// Shell.

#include "types.h"
#include "user.h"
#include "fcntl.h"
#include <stddef.h>

// Parsed command representation
#define EXEC  1
#define REDIR 2
#define PIPE  3
#define LIST  4
#define BACK  5
#define HIST 6

#define MAXARGS 10
#define MAXHIST 10
char *cmdHist[MAXHIST];
int historyIndex = 0;

struct cmd {
  int type;
};

struct execcmd {
  int type;
  char *argv[MAXARGS];
  char *eargv[MAXARGS];
};

struct redircmd {
  int type;
  struct cmd *cmd;
  char *file;
  char *efile;
  int mode;
  int fd;
};

struct pipecmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct listcmd {
  int type;
  struct cmd *left;
  struct cmd *right;
};

struct backcmd {
  int type;
  struct cmd *cmd;
};

struct histcmd {
  int type;
  struct cmd *arg;
};

int fork1(void);  // Fork but panics on failure.
void panic(char*);
struct cmd *parsecmd(char*);

// Execute cmd.  Never returns.
void
runcmd(struct cmd *cmd)
{
  //int p[2];
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  struct histcmd *hcmd;
  
  if(cmd == 0)
    exit();

  switch(cmd->type){
  default:
    panic("runcmd");

  case EXEC:
    ecmd = (struct execcmd*)cmd;
    if(ecmd->argv[0] == 0)
      exit();
    exec(ecmd->argv[0], ecmd->argv);
    printf(2, "exec %s failed\n", ecmd->argv[0]);
    break;

  case REDIR: //implemented code
  {
    struct redircmd *rcmd = (struct redircmd*)cmd;
    int fd;
    int oldfd = rcmd->fd; 

    // Open the file with the specified mode.
    if(rcmd->mode == O_RDONLY) {
        // If the redirection is for input.
        fd = open(rcmd->file, rcmd->mode);
    } else {
        // If the redirection is for output. 
        fd = open(rcmd->file, rcmd->mode | O_CREATE);
    }

    if(fd < 0) {
        printf(2, "open %s failed\n", rcmd->file);
        exit();
    }

    if(fd != oldfd) {
        // Duplicate fd onto oldfd. Since we're closing oldfd first, dup should duplicate onto oldfd.
        close(oldfd);
        int newfd = dup(fd);
        if(newfd != oldfd) {
            printf(2, "unexpected file descriptor duplication: %d\n", newfd);
            exit();
        }
        close(fd);
    }

    // Execute the command with redirection in place.
    runcmd(rcmd->cmd);
    break;
  }
    //printf(2, "Redirection Not Implemented\n");
    //break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
      int pid;
      pid = fork();
      switch (pid) {
        case -1:
          exit();
          break;
        case 0:
          runcmd(lcmd->left);
          break;
        default:
          wait();
          runcmd(lcmd->right);
          break;
}
    break;

  case PIPE:
    // int pid;
    int pfds[2];
    pcmd = (struct pipecmd*)cmd;
   
    //create pipe
    if(pipe(pfds) < 0) {
      printf(2, "pipe failed\n");
      exit();
    }

    pid = fork1();
    if(pid == 0){    //in child

      //redirect stdout to pipe
      close(1);
      dup(pfds[1]);
      //close unused read end of pipe
      close(pfds[0]);
      // close dup pipe
      close(pfds[1]);
      //run cmd on left side of pipe
      runcmd(pcmd->left);

      //wait for all children to exit
      //wait();

    }

    pid = fork1();
    if(pid == 0){    //in child

      //redirect stdin to pipe
      close(0);
      dup(pfds[0]);
      //close dup read end of pipe
      close(pfds[0]);
      //close unused write end of pipe
      close(pfds[1]);
      //run command on right side of pipe
      runcmd(pcmd->right); 
     
    }

    //close pipe ends in parent
    close(pfds[0]);
    close(pfds[1]);

    //wait for both children
    wait();
    wait();
    
    //printf(2, "Pipe Not implemented\n");
    break;

  case BACK:
    printf(2, "Backgrounding not implemented\n");
    break;
  case HIST:
    hcmd = (struct histcmd *)cmd;
    if (strcmp(hcmd-> arg, "print") == 0) {
      int start = historyIndex - 1;
      int count = 0;
      for (int i = start; i >= 0 && count < MAXHIST; i--, count++) {
        printf(2, "Previous command %d: %s", count + 1, cmdHist[i]);
      }
    } 
    else {
      int histNum = atoi(hcmd->arg);
      if (histNum > 0 && histNum <= MAXHIST && (historyIndex - histNum) >= 0) {
          int index = (historyIndex - histNum + MAXHIST) % MAXHIST;
          char *cmdToRerun = cmdHist[index];
          if (cmdToRerun != NULL) {
              struct cmd *n_cmd = parsecmd(cmdToRerun);
              runcmd(n_cmd);
          }
      }
    }
    break;
  }

  exit();
}
char *my_strdup(const char *src) { 
  if (src == NULL)
  {
    return NULL;
  }
}

void addToHistory(char* com) {
  free(cmdHist[0]);
  int count = 0;
  while (count < MAXHIST - 1) {
    cmdHist[count] = cmdHist[count + 1];
    count++;
  }

  cmdHist[MAXHIST - 1] = my_strdup(com);
}

int
getcmd(char *buf, int nbuf)
{
  printf(2, "$ ");
  memset(buf, 0, nbuf);
  gets(buf, nbuf);
  if(buf[0] == 0) // EOF
    return -1;
  return 0;
}

int
main(void)
{
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
    if(fd >= 3){
      close(fd);
      break;
    }
  }

  memset(cmdHist, 0, sizeof(*cmdHist) * MAXHIST);

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){

    if (!(buf[0] == 'h' && buf[1] == 'i' && buf[2] == 's' && buf[3] == 't' && (buf[4] == ' ' || buf[4] == '\0'))) {
      int index = historyIndex % MAXHIST;
      if (cmdHist[index] != NULL) 
        addToHistory(buf);
      else {
        cmdHist[index] = my_strdup(buf);
        historyIndex = historyIndex + 1;
      }
    }

    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' ') {
      // Chdir must be `lled by the parent, not the child.
      buf[strlen(buf)-1] = 0;  // chop \n
      if(chdir(buf+3) < 0)
        printf(2, "cannot cd %s\n", buf+3);
      continue;
    }
    if(fork1() == 0)
      runcmd(parsecmd(buf));
    wait();
  }
  exit();
}

void
panic(char *s)
{
  printf(2, "%s\n", s);
  exit();
}

int
fork1(void)
{
  int pid;

  pid = fork();
  if(pid == -1)
    panic("fork");
  return pid;
}

//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = EXEC;
  return (struct cmd*)cmd;
}

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = REDIR;
  cmd->cmd = subcmd;
  cmd->file = file;
  cmd->efile = efile;
  cmd->mode = mode;
  cmd->fd = fd;
  return (struct cmd*)cmd;
}

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = PIPE;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = LIST;
  cmd->left = left;
  cmd->right = right;
  return (struct cmd*)cmd;
}

struct cmd*
backcmd(struct cmd *subcmd)
{
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->type = BACK;
  cmd->cmd = subcmd;
  return (struct cmd*)cmd;
}

struct cmd*
histcmd(struct cmd *subcmd) {
  struct histcmd *cmd;
  cmd = malloc(sizeof(*cmd));
  memset(cmd, 0, sizeof(*cmd));
  cmd->arg = subcmd;
  cmd->type = HIST;
  return (struct cmd *)cmd;
}
//PAGEBREAK!
// Parsing

char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
  char *s;
  int ret;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  if(q)
    *q = s;
  ret = *s;
  switch(*s){
  case 0:
    break;
  case '|':
  case '(':
  case ')':
  case ';':
  case '&':
  case '<':
    s++;
    break;
  case '>':
    s++;
    if(*s == '>'){
      ret = '+';
      s++;
    }
    break;
  default:
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
    *eq = s;

  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return ret;
}

int
peek(char **ps, char *es, char *toks)
{
  char *s;

  s = *ps;
  while(s < es && strchr(whitespace, *s))
    s++;
  *ps = s;
  return *s && strchr(toks, *s);
}

struct cmd *parseline(char**, char*);
struct cmd *parsepipe(char**, char*);
struct cmd *parseexec(char**, char*);
struct cmd *nulterminate(struct cmd*);
struct cmd *parsehist(char**, char*);

struct cmd*
parsecmd(char *s)
{
  char *es;
  struct cmd *cmd;

  es = s + strlen(s);
  cmd = parseline(&s, es);
  peek(&s, es, "");
  if(s != es){
    printf(2, "leftovers: %s\n", s);
    panic("syntax");
  }
  nulterminate(cmd);
  return cmd;
}

struct cmd*
parseline(char **ps, char *es)
{
  struct cmd *cmd;

  char *q, *eq;
  int token = gettoken(ps, es, &q, &eq);
  if (token == "a") {
    char first[eq - q + 1];
    memmove(first, q, eq - q);
    first[eq - q] = '\0';
    if (strcmp(first, "hist") == 0) {
      *ps = q;
      cmd = parsehist(ps, es);
      return cmd;
    }
  }
  
  *ps = q;

  cmd = parsepipe(ps, es);
  while(peek(ps, es, "&")){
    gettoken(ps, es, 0, 0);
    cmd = backcmd(cmd);
  }
  if(peek(ps, es, ";")){
    gettoken(ps, es, 0, 0);
    cmd = listcmd(cmd, parseline(ps, es));
  }
  return cmd;
}

struct cmd*
parsepipe(char **ps, char *es)
{
  struct cmd *cmd;

  cmd = parseexec(ps, es);
  if(peek(ps, es, "|")){
    gettoken(ps, es, 0, 0);
    cmd = pipecmd(cmd, parsepipe(ps, es));
  }
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
    tok = gettoken(ps, es, 0, 0);
    if(gettoken(ps, es, &q, &eq) != 'a')
      panic("missing file for redirection");
    switch(tok){
    case '<':
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    }
  }
  return cmd;
}

struct cmd*
parseblock(char **ps, char *es)
{
  struct cmd *cmd;

  if(!peek(ps, es, "("))
    panic("parseblock");
  gettoken(ps, es, 0, 0);
  cmd = parseline(ps, es);
  if(!peek(ps, es, ")"))
    panic("syntax - missing )");
  gettoken(ps, es, 0, 0);
  cmd = parseredirs(cmd, ps, es);
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
    return parseblock(ps, es);

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
  while(!peek(ps, es, "|)&;")){
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
      break;
    if(tok != 'a')
      panic("syntax");
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}

struct cmd *
parsehist(char **ps, char *es) {
  char *q, *eq;
  int token;
  struct histcmd *hcmd;

  token = gettoken(ps, es, &q, &eq);
  if (token == "a") {
    char cmd[eq - q + 1];
    memmove(cmd, q, eq - q);
    cmd[eq - q] = "\0";

    if (strcmp(cmd, "hist") == 0) {

      token = gettoken(ps, es, &q, &eq);

      if (token == "a") {
        char arg[eq - q + 1];
        memmove(arg, q, eq - q);
        arg[eq - q] = "\0";
        
        if (strcmp(arg, "print") == 0) {
          hcmd = malloc(sizeof(*hcmd));
          hcmd->arg = malloc(strlen("print") + 1);
          hcmd->type = HIST;
          strcpy(hcmd->arg, "print");
          return (struct cmd *)hcmd;
        }
        else {
          int num = atoi(arg);
          if (num > 0) {
            hcmd = malloc(sizeof(*hcmd));
            hcmd->arg = malloc(strlen(arg) + 1);
            hcmd->type = HIST;
            strcpy(hcmd->arg, arg);
            return (struct cmd *)hcmd;
          }
        }
      }
    }
  }
  return NULL;
}

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
  int i;
  struct backcmd *bcmd;
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;
  struct histcmd *hcmd;

  if(cmd == 0)
    return 0;

  switch(cmd->type){
  case EXEC:
    ecmd = (struct execcmd*)cmd;
    for(i=0; ecmd->argv[i]; i++)
      *ecmd->eargv[i] = 0;
    break;

  case REDIR:
    rcmd = (struct redircmd*)cmd;
    nulterminate(rcmd->cmd);
    *rcmd->efile = 0;
    break;

  case PIPE:
    pcmd = (struct pipecmd*)cmd;
    nulterminate(pcmd->left);
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
    nulterminate(lcmd->right);
    break;

  case BACK:
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  
  case HIST:
    hcmd = (struct histcmd *) cmd;
    nulterminate(hcmd->arg);
    break;
  }

  return cmd;
}