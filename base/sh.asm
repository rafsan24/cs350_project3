
_sh:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
  return 0;
}

int
main(void)
{
       0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
       4:	83 e4 f0             	and    $0xfffffff0,%esp
       7:	ff 71 fc             	push   -0x4(%ecx)
       a:	55                   	push   %ebp
       b:	89 e5                	mov    %esp,%ebp
       d:	51                   	push   %ecx
       e:	83 ec 04             	sub    $0x4,%esp
  static char buf[100];
  int fd;

  // Ensure that three file descriptors are open.
  while((fd = open("console", O_RDWR)) >= 0){
      11:	eb 0e                	jmp    21 <main+0x21>
      13:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
      17:	90                   	nop
    if(fd >= 3){
      18:	83 f8 02             	cmp    $0x2,%eax
      1b:	0f 8f 96 00 00 00    	jg     b7 <main+0xb7>
  while((fd = open("console", O_RDWR)) >= 0){
      21:	83 ec 08             	sub    $0x8,%esp
      24:	6a 02                	push   $0x2
      26:	68 00 13 00 00       	push   $0x1300
      2b:	e8 c3 0d 00 00       	call   df3 <open>
      30:	83 c4 10             	add    $0x10,%esp
      33:	85 c0                	test   %eax,%eax
      35:	79 e1                	jns    18 <main+0x18>
      37:	eb 2e                	jmp    67 <main+0x67>
      39:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    }
  }

  // Read and run input commands.
  while(getcmd(buf, sizeof(buf)) >= 0){
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      40:	80 3d c2 19 00 00 20 	cmpb   $0x20,0x19c2
      47:	0f 84 8d 00 00 00    	je     da <main+0xda>
      4d:	8d 76 00             	lea    0x0(%esi),%esi
int
fork1(void)
{
  int pid;

  pid = fork();
      50:	e8 56 0d 00 00       	call   dab <fork>
  if(pid == -1)
      55:	83 f8 ff             	cmp    $0xffffffff,%eax
      58:	0f 84 c1 00 00 00    	je     11f <main+0x11f>
    if(fork1() == 0)
      5e:	85 c0                	test   %eax,%eax
      60:	74 63                	je     c5 <main+0xc5>
    wait();
      62:	e8 54 0d 00 00       	call   dbb <wait>
  printf(2, "$ ");
      67:	83 ec 08             	sub    $0x8,%esp
      6a:	68 38 12 00 00       	push   $0x1238
      6f:	6a 02                	push   $0x2
      71:	e8 9a 0e 00 00       	call   f10 <printf>
  memset(buf, 0, nbuf);
      76:	83 c4 0c             	add    $0xc,%esp
      79:	6a 64                	push   $0x64
      7b:	6a 00                	push   $0x0
      7d:	68 c0 19 00 00       	push   $0x19c0
      82:	e8 a9 0b 00 00       	call   c30 <memset>
  gets(buf, nbuf);
      87:	58                   	pop    %eax
      88:	5a                   	pop    %edx
      89:	6a 64                	push   $0x64
      8b:	68 c0 19 00 00       	push   $0x19c0
      90:	e8 fb 0b 00 00       	call   c90 <gets>
  if(buf[0] == 0) // EOF
      95:	0f b6 05 c0 19 00 00 	movzbl 0x19c0,%eax
      9c:	83 c4 10             	add    $0x10,%esp
      9f:	84 c0                	test   %al,%al
      a1:	74 0f                	je     b2 <main+0xb2>
    if(buf[0] == 'c' && buf[1] == 'd' && buf[2] == ' '){
      a3:	3c 63                	cmp    $0x63,%al
      a5:	75 a9                	jne    50 <main+0x50>
      a7:	80 3d c1 19 00 00 64 	cmpb   $0x64,0x19c1
      ae:	75 a0                	jne    50 <main+0x50>
      b0:	eb 8e                	jmp    40 <main+0x40>
  exit();
      b2:	e8 fc 0c 00 00       	call   db3 <exit>
      close(fd);
      b7:	83 ec 0c             	sub    $0xc,%esp
      ba:	50                   	push   %eax
      bb:	e8 1b 0d 00 00       	call   ddb <close>
      break;
      c0:	83 c4 10             	add    $0x10,%esp
      c3:	eb a2                	jmp    67 <main+0x67>
      runcmd(parsecmd(buf));
      c5:	83 ec 0c             	sub    $0xc,%esp
      c8:	68 c0 19 00 00       	push   $0x19c0
      cd:	e8 2e 0a 00 00       	call   b00 <parsecmd>
      d2:	89 04 24             	mov    %eax,(%esp)
      d5:	e8 b6 00 00 00       	call   190 <runcmd>
      buf[strlen(buf)-1] = 0;  // chop \n
      da:	83 ec 0c             	sub    $0xc,%esp
      dd:	68 c0 19 00 00       	push   $0x19c0
      e2:	e8 19 0b 00 00       	call   c00 <strlen>
      if(chdir(buf+3) < 0)
      e7:	c7 04 24 c3 19 00 00 	movl   $0x19c3,(%esp)
      buf[strlen(buf)-1] = 0;  // chop \n
      ee:	c6 80 bf 19 00 00 00 	movb   $0x0,0x19bf(%eax)
      if(chdir(buf+3) < 0)
      f5:	e8 29 0d 00 00       	call   e23 <chdir>
      fa:	83 c4 10             	add    $0x10,%esp
      fd:	85 c0                	test   %eax,%eax
      ff:	0f 89 62 ff ff ff    	jns    67 <main+0x67>
        printf(2, "cannot cd %s\n", buf+3);
     105:	51                   	push   %ecx
     106:	68 c3 19 00 00       	push   $0x19c3
     10b:	68 08 13 00 00       	push   $0x1308
     110:	6a 02                	push   $0x2
     112:	e8 f9 0d 00 00       	call   f10 <printf>
     117:	83 c4 10             	add    $0x10,%esp
     11a:	e9 48 ff ff ff       	jmp    67 <main+0x67>
    panic("fork");
     11f:	83 ec 0c             	sub    $0xc,%esp
     122:	68 8e 12 00 00       	push   $0x128e
     127:	e8 44 00 00 00       	call   170 <panic>
     12c:	66 90                	xchg   %ax,%ax
     12e:	66 90                	xchg   %ax,%ax

00000130 <getcmd>:
{
     130:	55                   	push   %ebp
     131:	89 e5                	mov    %esp,%ebp
     133:	56                   	push   %esi
     134:	53                   	push   %ebx
     135:	8b 5d 08             	mov    0x8(%ebp),%ebx
     138:	8b 75 0c             	mov    0xc(%ebp),%esi
  printf(2, "$ ");
     13b:	83 ec 08             	sub    $0x8,%esp
     13e:	68 38 12 00 00       	push   $0x1238
     143:	6a 02                	push   $0x2
     145:	e8 c6 0d 00 00       	call   f10 <printf>
  memset(buf, 0, nbuf);
     14a:	83 c4 0c             	add    $0xc,%esp
     14d:	56                   	push   %esi
     14e:	6a 00                	push   $0x0
     150:	53                   	push   %ebx
     151:	e8 da 0a 00 00       	call   c30 <memset>
  gets(buf, nbuf);
     156:	58                   	pop    %eax
     157:	5a                   	pop    %edx
     158:	56                   	push   %esi
     159:	53                   	push   %ebx
     15a:	e8 31 0b 00 00       	call   c90 <gets>
  if(buf[0] == 0) // EOF
     15f:	83 c4 10             	add    $0x10,%esp
     162:	80 3b 01             	cmpb   $0x1,(%ebx)
     165:	19 c0                	sbb    %eax,%eax
}
     167:	8d 65 f8             	lea    -0x8(%ebp),%esp
     16a:	5b                   	pop    %ebx
     16b:	5e                   	pop    %esi
     16c:	5d                   	pop    %ebp
     16d:	c3                   	ret
     16e:	66 90                	xchg   %ax,%ax

00000170 <panic>:
{
     170:	55                   	push   %ebp
     171:	89 e5                	mov    %esp,%ebp
     173:	83 ec 0c             	sub    $0xc,%esp
  printf(2, "%s\n", s);
     176:	ff 75 08             	push   0x8(%ebp)
     179:	68 fc 12 00 00       	push   $0x12fc
     17e:	6a 02                	push   $0x2
     180:	e8 8b 0d 00 00       	call   f10 <printf>
  exit();
     185:	e8 29 0c 00 00       	call   db3 <exit>
     18a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000190 <runcmd>:
{
     190:	55                   	push   %ebp
     191:	89 e5                	mov    %esp,%ebp
     193:	57                   	push   %edi
     194:	56                   	push   %esi
     195:	53                   	push   %ebx
     196:	83 ec 0c             	sub    $0xc,%esp
     199:	8b 5d 08             	mov    0x8(%ebp),%ebx
  if(cmd == 0)
     19c:	85 db                	test   %ebx,%ebx
     19e:	74 28                	je     1c8 <runcmd+0x38>
  switch(cmd->type){
     1a0:	83 3b 05             	cmpl   $0x5,(%ebx)
     1a3:	0f 87 c6 00 00 00    	ja     26f <runcmd+0xdf>
     1a9:	8b 03                	mov    (%ebx),%eax
     1ab:	ff 24 85 64 13 00 00 	jmp    *0x1364(,%eax,4)
    printf(2, "List Not Implemented\n");
     1b2:	51                   	push   %ecx
     1b3:	51                   	push   %ecx
     1b4:	68 62 12 00 00       	push   $0x1262
     1b9:	6a 02                	push   $0x2
     1bb:	e8 50 0d 00 00       	call   f10 <printf>
    break;
     1c0:	83 c4 10             	add    $0x10,%esp
     1c3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     1c7:	90                   	nop
    exit();
     1c8:	e8 e6 0b 00 00       	call   db3 <exit>
    printf(2, "Backgrounding not implemented\n");
     1cd:	50                   	push   %eax
     1ce:	50                   	push   %eax
     1cf:	68 44 13 00 00       	push   $0x1344
     1d4:	6a 02                	push   $0x2
     1d6:	e8 35 0d 00 00       	call   f10 <printf>
    break;
     1db:	83 c4 10             	add    $0x10,%esp
     1de:	eb e8                	jmp    1c8 <runcmd+0x38>
    if(ecmd->argv[0] == 0)
     1e0:	8b 43 04             	mov    0x4(%ebx),%eax
     1e3:	85 c0                	test   %eax,%eax
     1e5:	74 e1                	je     1c8 <runcmd+0x38>
    exec(ecmd->argv[0], ecmd->argv);
     1e7:	8d 53 04             	lea    0x4(%ebx),%edx
     1ea:	57                   	push   %edi
     1eb:	57                   	push   %edi
     1ec:	52                   	push   %edx
     1ed:	50                   	push   %eax
     1ee:	e8 f8 0b 00 00       	call   deb <exec>
    printf(2, "exec %s failed\n", ecmd->argv[0]);
     1f3:	83 c4 0c             	add    $0xc,%esp
     1f6:	ff 73 04             	push   0x4(%ebx)
     1f9:	68 42 12 00 00       	push   $0x1242
     1fe:	6a 02                	push   $0x2
     200:	e8 0b 0d 00 00       	call   f10 <printf>
    break;
     205:	83 c4 10             	add    $0x10,%esp
     208:	eb be                	jmp    1c8 <runcmd+0x38>
    if(rcmd->mode == O_RDONLY) {
     20a:	8b 43 10             	mov    0x10(%ebx),%eax
    int oldfd = rcmd->fd; // This is typically either 0 (stdin) or 1 (stdout).
     20d:	8b 7b 14             	mov    0x14(%ebx),%edi
        fd = open(rcmd->file, rcmd->mode);
     210:	8b 53 08             	mov    0x8(%ebx),%edx
    if(rcmd->mode == O_RDONLY) {
     213:	85 c0                	test   %eax,%eax
     215:	75 65                	jne    27c <runcmd+0xec>
        fd = open(rcmd->file, rcmd->mode);
     217:	56                   	push   %esi
     218:	56                   	push   %esi
     219:	6a 00                	push   $0x0
     21b:	52                   	push   %edx
     21c:	e8 d2 0b 00 00       	call   df3 <open>
     221:	83 c4 10             	add    $0x10,%esp
     224:	89 c6                	mov    %eax,%esi
    if(fd < 0) {
     226:	85 f6                	test   %esi,%esi
     228:	78 7c                	js     2a6 <runcmd+0x116>
    if(fd != oldfd) {
     22a:	39 fe                	cmp    %edi,%esi
     22c:	74 6d                	je     29b <runcmd+0x10b>
        close(oldfd);
     22e:	83 ec 0c             	sub    $0xc,%esp
     231:	57                   	push   %edi
     232:	e8 a4 0b 00 00       	call   ddb <close>
        int newfd = dup(fd);
     237:	89 34 24             	mov    %esi,(%esp)
     23a:	e8 ec 0b 00 00       	call   e2b <dup>
        if(newfd != oldfd) {
     23f:	83 c4 10             	add    $0x10,%esp
     242:	39 c7                	cmp    %eax,%edi
     244:	74 49                	je     28f <runcmd+0xff>
            printf(2, "unexpected file descriptor duplication: %d\n", newfd);
     246:	53                   	push   %ebx
     247:	50                   	push   %eax
     248:	68 18 13 00 00       	push   $0x1318
     24d:	6a 02                	push   $0x2
     24f:	e8 bc 0c 00 00       	call   f10 <printf>
            exit();
     254:	e8 5a 0b 00 00       	call   db3 <exit>
    printf(2, "Pipe Not implemented\n");
     259:	52                   	push   %edx
     25a:	52                   	push   %edx
     25b:	68 78 12 00 00       	push   $0x1278
     260:	6a 02                	push   $0x2
     262:	e8 a9 0c 00 00       	call   f10 <printf>
    break;
     267:	83 c4 10             	add    $0x10,%esp
     26a:	e9 59 ff ff ff       	jmp    1c8 <runcmd+0x38>
    panic("runcmd");
     26f:	83 ec 0c             	sub    $0xc,%esp
     272:	68 3b 12 00 00       	push   $0x123b
     277:	e8 f4 fe ff ff       	call   170 <panic>
        fd = open(rcmd->file, rcmd->mode | O_CREATE);
     27c:	80 cc 02             	or     $0x2,%ah
     27f:	51                   	push   %ecx
     280:	51                   	push   %ecx
     281:	50                   	push   %eax
     282:	52                   	push   %edx
     283:	e8 6b 0b 00 00       	call   df3 <open>
     288:	83 c4 10             	add    $0x10,%esp
     28b:	89 c6                	mov    %eax,%esi
     28d:	eb 97                	jmp    226 <runcmd+0x96>
        close(fd);
     28f:	83 ec 0c             	sub    $0xc,%esp
     292:	56                   	push   %esi
     293:	e8 43 0b 00 00       	call   ddb <close>
     298:	83 c4 10             	add    $0x10,%esp
    runcmd(rcmd->cmd);
     29b:	83 ec 0c             	sub    $0xc,%esp
     29e:	ff 73 04             	push   0x4(%ebx)
     2a1:	e8 ea fe ff ff       	call   190 <runcmd>
        printf(2, "open %s failed\n", rcmd->file);
     2a6:	56                   	push   %esi
     2a7:	ff 73 08             	push   0x8(%ebx)
     2aa:	68 52 12 00 00       	push   $0x1252
     2af:	6a 02                	push   $0x2
     2b1:	e8 5a 0c 00 00       	call   f10 <printf>
        exit();
     2b6:	e8 f8 0a 00 00       	call   db3 <exit>
     2bb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     2bf:	90                   	nop

000002c0 <fork1>:
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	83 ec 08             	sub    $0x8,%esp
  pid = fork();
     2c6:	e8 e0 0a 00 00       	call   dab <fork>
  if(pid == -1)
     2cb:	83 f8 ff             	cmp    $0xffffffff,%eax
     2ce:	74 02                	je     2d2 <fork1+0x12>
  return pid;
}
     2d0:	c9                   	leave
     2d1:	c3                   	ret
    panic("fork");
     2d2:	83 ec 0c             	sub    $0xc,%esp
     2d5:	68 8e 12 00 00       	push   $0x128e
     2da:	e8 91 fe ff ff       	call   170 <panic>
     2df:	90                   	nop

000002e0 <execcmd>:
//PAGEBREAK!
// Constructors

struct cmd*
execcmd(void)
{
     2e0:	55                   	push   %ebp
     2e1:	89 e5                	mov    %esp,%ebp
     2e3:	53                   	push   %ebx
     2e4:	83 ec 10             	sub    $0x10,%esp
  struct execcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     2e7:	6a 54                	push   $0x54
     2e9:	e8 62 0e 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     2ee:	83 c4 0c             	add    $0xc,%esp
     2f1:	6a 54                	push   $0x54
  cmd = malloc(sizeof(*cmd));
     2f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     2f5:	6a 00                	push   $0x0
     2f7:	50                   	push   %eax
     2f8:	e8 33 09 00 00       	call   c30 <memset>
  cmd->type = EXEC;
     2fd:	c7 03 01 00 00 00    	movl   $0x1,(%ebx)
  return (struct cmd*)cmd;
}
     303:	89 d8                	mov    %ebx,%eax
     305:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     308:	c9                   	leave
     309:	c3                   	ret
     30a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000310 <redircmd>:

struct cmd*
redircmd(struct cmd *subcmd, char *file, char *efile, int mode, int fd)
{
     310:	55                   	push   %ebp
     311:	89 e5                	mov    %esp,%ebp
     313:	53                   	push   %ebx
     314:	83 ec 10             	sub    $0x10,%esp
  struct redircmd *cmd;

  cmd = malloc(sizeof(*cmd));
     317:	6a 18                	push   $0x18
     319:	e8 32 0e 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     31e:	83 c4 0c             	add    $0xc,%esp
     321:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     323:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     325:	6a 00                	push   $0x0
     327:	50                   	push   %eax
     328:	e8 03 09 00 00       	call   c30 <memset>
  cmd->type = REDIR;
  cmd->cmd = subcmd;
     32d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = REDIR;
     330:	c7 03 02 00 00 00    	movl   $0x2,(%ebx)
  cmd->cmd = subcmd;
     336:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->file = file;
     339:	8b 45 0c             	mov    0xc(%ebp),%eax
     33c:	89 43 08             	mov    %eax,0x8(%ebx)
  cmd->efile = efile;
     33f:	8b 45 10             	mov    0x10(%ebp),%eax
     342:	89 43 0c             	mov    %eax,0xc(%ebx)
  cmd->mode = mode;
     345:	8b 45 14             	mov    0x14(%ebp),%eax
     348:	89 43 10             	mov    %eax,0x10(%ebx)
  cmd->fd = fd;
     34b:	8b 45 18             	mov    0x18(%ebp),%eax
     34e:	89 43 14             	mov    %eax,0x14(%ebx)
  return (struct cmd*)cmd;
}
     351:	89 d8                	mov    %ebx,%eax
     353:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     356:	c9                   	leave
     357:	c3                   	ret
     358:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     35f:	90                   	nop

00000360 <pipecmd>:

struct cmd*
pipecmd(struct cmd *left, struct cmd *right)
{
     360:	55                   	push   %ebp
     361:	89 e5                	mov    %esp,%ebp
     363:	53                   	push   %ebx
     364:	83 ec 10             	sub    $0x10,%esp
  struct pipecmd *cmd;

  cmd = malloc(sizeof(*cmd));
     367:	6a 0c                	push   $0xc
     369:	e8 e2 0d 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     36e:	83 c4 0c             	add    $0xc,%esp
     371:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     373:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     375:	6a 00                	push   $0x0
     377:	50                   	push   %eax
     378:	e8 b3 08 00 00       	call   c30 <memset>
  cmd->type = PIPE;
  cmd->left = left;
     37d:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = PIPE;
     380:	c7 03 03 00 00 00    	movl   $0x3,(%ebx)
  cmd->left = left;
     386:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     389:	8b 45 0c             	mov    0xc(%ebp),%eax
     38c:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     38f:	89 d8                	mov    %ebx,%eax
     391:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     394:	c9                   	leave
     395:	c3                   	ret
     396:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     39d:	8d 76 00             	lea    0x0(%esi),%esi

000003a0 <listcmd>:

struct cmd*
listcmd(struct cmd *left, struct cmd *right)
{
     3a0:	55                   	push   %ebp
     3a1:	89 e5                	mov    %esp,%ebp
     3a3:	53                   	push   %ebx
     3a4:	83 ec 10             	sub    $0x10,%esp
  struct listcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3a7:	6a 0c                	push   $0xc
     3a9:	e8 a2 0d 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ae:	83 c4 0c             	add    $0xc,%esp
     3b1:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     3b3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3b5:	6a 00                	push   $0x0
     3b7:	50                   	push   %eax
     3b8:	e8 73 08 00 00       	call   c30 <memset>
  cmd->type = LIST;
  cmd->left = left;
     3bd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = LIST;
     3c0:	c7 03 04 00 00 00    	movl   $0x4,(%ebx)
  cmd->left = left;
     3c6:	89 43 04             	mov    %eax,0x4(%ebx)
  cmd->right = right;
     3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     3cc:	89 43 08             	mov    %eax,0x8(%ebx)
  return (struct cmd*)cmd;
}
     3cf:	89 d8                	mov    %ebx,%eax
     3d1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     3d4:	c9                   	leave
     3d5:	c3                   	ret
     3d6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     3dd:	8d 76 00             	lea    0x0(%esi),%esi

000003e0 <backcmd>:

struct cmd*
backcmd(struct cmd *subcmd)
{
     3e0:	55                   	push   %ebp
     3e1:	89 e5                	mov    %esp,%ebp
     3e3:	53                   	push   %ebx
     3e4:	83 ec 10             	sub    $0x10,%esp
  struct backcmd *cmd;

  cmd = malloc(sizeof(*cmd));
     3e7:	6a 08                	push   $0x8
     3e9:	e8 62 0d 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     3ee:	83 c4 0c             	add    $0xc,%esp
     3f1:	6a 08                	push   $0x8
  cmd = malloc(sizeof(*cmd));
     3f3:	89 c3                	mov    %eax,%ebx
  memset(cmd, 0, sizeof(*cmd));
     3f5:	6a 00                	push   $0x0
     3f7:	50                   	push   %eax
     3f8:	e8 33 08 00 00       	call   c30 <memset>
  cmd->type = BACK;
  cmd->cmd = subcmd;
     3fd:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->type = BACK;
     400:	c7 03 05 00 00 00    	movl   $0x5,(%ebx)
  cmd->cmd = subcmd;
     406:	89 43 04             	mov    %eax,0x4(%ebx)
  return (struct cmd*)cmd;
}
     409:	89 d8                	mov    %ebx,%eax
     40b:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     40e:	c9                   	leave
     40f:	c3                   	ret

00000410 <gettoken>:
char whitespace[] = " \t\r\n\v";
char symbols[] = "<|>&;()";

int
gettoken(char **ps, char *es, char **q, char **eq)
{
     410:	55                   	push   %ebp
     411:	89 e5                	mov    %esp,%ebp
     413:	57                   	push   %edi
     414:	56                   	push   %esi
     415:	53                   	push   %ebx
     416:	83 ec 0c             	sub    $0xc,%esp
  char *s;
  int ret;

  s = *ps;
     419:	8b 45 08             	mov    0x8(%ebp),%eax
{
     41c:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     41f:	8b 75 10             	mov    0x10(%ebp),%esi
  s = *ps;
     422:	8b 38                	mov    (%eax),%edi
  while(s < es && strchr(whitespace, *s))
     424:	39 df                	cmp    %ebx,%edi
     426:	72 0f                	jb     437 <gettoken+0x27>
     428:	eb 25                	jmp    44f <gettoken+0x3f>
     42a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    s++;
     430:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     433:	39 fb                	cmp    %edi,%ebx
     435:	74 18                	je     44f <gettoken+0x3f>
     437:	0f be 07             	movsbl (%edi),%eax
     43a:	83 ec 08             	sub    $0x8,%esp
     43d:	50                   	push   %eax
     43e:	68 b0 19 00 00       	push   $0x19b0
     443:	e8 08 08 00 00       	call   c50 <strchr>
     448:	83 c4 10             	add    $0x10,%esp
     44b:	85 c0                	test   %eax,%eax
     44d:	75 e1                	jne    430 <gettoken+0x20>
  if(q)
     44f:	85 f6                	test   %esi,%esi
     451:	74 02                	je     455 <gettoken+0x45>
    *q = s;
     453:	89 3e                	mov    %edi,(%esi)
  ret = *s;
     455:	0f b6 07             	movzbl (%edi),%eax
  switch(*s){
     458:	3c 3c                	cmp    $0x3c,%al
     45a:	0f 8f d0 00 00 00    	jg     530 <gettoken+0x120>
     460:	3c 3a                	cmp    $0x3a,%al
     462:	0f 8f bc 00 00 00    	jg     524 <gettoken+0x114>
     468:	84 c0                	test   %al,%al
     46a:	75 44                	jne    4b0 <gettoken+0xa0>
     46c:	31 f6                	xor    %esi,%esi
    ret = 'a';
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
      s++;
    break;
  }
  if(eq)
     46e:	8b 4d 14             	mov    0x14(%ebp),%ecx
     471:	85 c9                	test   %ecx,%ecx
     473:	74 05                	je     47a <gettoken+0x6a>
    *eq = s;
     475:	8b 45 14             	mov    0x14(%ebp),%eax
     478:	89 38                	mov    %edi,(%eax)

  while(s < es && strchr(whitespace, *s))
     47a:	39 df                	cmp    %ebx,%edi
     47c:	72 09                	jb     487 <gettoken+0x77>
     47e:	eb 1f                	jmp    49f <gettoken+0x8f>
    s++;
     480:	83 c7 01             	add    $0x1,%edi
  while(s < es && strchr(whitespace, *s))
     483:	39 fb                	cmp    %edi,%ebx
     485:	74 18                	je     49f <gettoken+0x8f>
     487:	0f be 07             	movsbl (%edi),%eax
     48a:	83 ec 08             	sub    $0x8,%esp
     48d:	50                   	push   %eax
     48e:	68 b0 19 00 00       	push   $0x19b0
     493:	e8 b8 07 00 00       	call   c50 <strchr>
     498:	83 c4 10             	add    $0x10,%esp
     49b:	85 c0                	test   %eax,%eax
     49d:	75 e1                	jne    480 <gettoken+0x70>
  *ps = s;
     49f:	8b 45 08             	mov    0x8(%ebp),%eax
     4a2:	89 38                	mov    %edi,(%eax)
  return ret;
}
     4a4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     4a7:	89 f0                	mov    %esi,%eax
     4a9:	5b                   	pop    %ebx
     4aa:	5e                   	pop    %esi
     4ab:	5f                   	pop    %edi
     4ac:	5d                   	pop    %ebp
     4ad:	c3                   	ret
     4ae:	66 90                	xchg   %ax,%ax
  switch(*s){
     4b0:	79 66                	jns    518 <gettoken+0x108>
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4b2:	39 df                	cmp    %ebx,%edi
     4b4:	72 39                	jb     4ef <gettoken+0xdf>
  if(eq)
     4b6:	8b 55 14             	mov    0x14(%ebp),%edx
     4b9:	85 d2                	test   %edx,%edx
     4bb:	0f 84 b3 00 00 00    	je     574 <gettoken+0x164>
    *eq = s;
     4c1:	8b 45 14             	mov    0x14(%ebp),%eax
     4c4:	89 38                	mov    %edi,(%eax)
  while(s < es && strchr(whitespace, *s))
     4c6:	e9 a9 00 00 00       	jmp    574 <gettoken+0x164>
     4cb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     4cf:	90                   	nop
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4d0:	0f be 07             	movsbl (%edi),%eax
     4d3:	83 ec 08             	sub    $0x8,%esp
     4d6:	50                   	push   %eax
     4d7:	68 a8 19 00 00       	push   $0x19a8
     4dc:	e8 6f 07 00 00       	call   c50 <strchr>
     4e1:	83 c4 10             	add    $0x10,%esp
     4e4:	85 c0                	test   %eax,%eax
     4e6:	75 1f                	jne    507 <gettoken+0xf7>
      s++;
     4e8:	83 c7 01             	add    $0x1,%edi
    while(s < es && !strchr(whitespace, *s) && !strchr(symbols, *s))
     4eb:	39 fb                	cmp    %edi,%ebx
     4ed:	74 77                	je     566 <gettoken+0x156>
     4ef:	0f be 07             	movsbl (%edi),%eax
     4f2:	83 ec 08             	sub    $0x8,%esp
     4f5:	50                   	push   %eax
     4f6:	68 b0 19 00 00       	push   $0x19b0
     4fb:	e8 50 07 00 00       	call   c50 <strchr>
     500:	83 c4 10             	add    $0x10,%esp
     503:	85 c0                	test   %eax,%eax
     505:	74 c9                	je     4d0 <gettoken+0xc0>
    ret = 'a';
     507:	be 61 00 00 00       	mov    $0x61,%esi
     50c:	e9 5d ff ff ff       	jmp    46e <gettoken+0x5e>
     511:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  switch(*s){
     518:	3c 26                	cmp    $0x26,%al
     51a:	74 08                	je     524 <gettoken+0x114>
     51c:	8d 48 d8             	lea    -0x28(%eax),%ecx
     51f:	80 f9 01             	cmp    $0x1,%cl
     522:	77 8e                	ja     4b2 <gettoken+0xa2>
  ret = *s;
     524:	0f be f0             	movsbl %al,%esi
    s++;
     527:	83 c7 01             	add    $0x1,%edi
    break;
     52a:	e9 3f ff ff ff       	jmp    46e <gettoken+0x5e>
     52f:	90                   	nop
  switch(*s){
     530:	3c 3e                	cmp    $0x3e,%al
     532:	75 1c                	jne    550 <gettoken+0x140>
    if(*s == '>'){
     534:	80 7f 01 3e          	cmpb   $0x3e,0x1(%edi)
     538:	74 1f                	je     559 <gettoken+0x149>
    s++;
     53a:	83 c7 01             	add    $0x1,%edi
  ret = *s;
     53d:	be 3e 00 00 00       	mov    $0x3e,%esi
     542:	e9 27 ff ff ff       	jmp    46e <gettoken+0x5e>
     547:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     54e:	66 90                	xchg   %ax,%ax
  switch(*s){
     550:	3c 7c                	cmp    $0x7c,%al
     552:	74 d0                	je     524 <gettoken+0x114>
     554:	e9 59 ff ff ff       	jmp    4b2 <gettoken+0xa2>
      s++;
     559:	83 c7 02             	add    $0x2,%edi
      ret = '+';
     55c:	be 2b 00 00 00       	mov    $0x2b,%esi
     561:	e9 08 ff ff ff       	jmp    46e <gettoken+0x5e>
  if(eq)
     566:	8b 45 14             	mov    0x14(%ebp),%eax
     569:	85 c0                	test   %eax,%eax
     56b:	74 05                	je     572 <gettoken+0x162>
    *eq = s;
     56d:	8b 45 14             	mov    0x14(%ebp),%eax
     570:	89 18                	mov    %ebx,(%eax)
      s++;
     572:	89 df                	mov    %ebx,%edi
    ret = 'a';
     574:	be 61 00 00 00       	mov    $0x61,%esi
     579:	e9 21 ff ff ff       	jmp    49f <gettoken+0x8f>
     57e:	66 90                	xchg   %ax,%ax

00000580 <peek>:

int
peek(char **ps, char *es, char *toks)
{
     580:	55                   	push   %ebp
     581:	89 e5                	mov    %esp,%ebp
     583:	57                   	push   %edi
     584:	56                   	push   %esi
     585:	53                   	push   %ebx
     586:	83 ec 0c             	sub    $0xc,%esp
     589:	8b 7d 08             	mov    0x8(%ebp),%edi
     58c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *s;

  s = *ps;
     58f:	8b 1f                	mov    (%edi),%ebx
  while(s < es && strchr(whitespace, *s))
     591:	39 f3                	cmp    %esi,%ebx
     593:	72 12                	jb     5a7 <peek+0x27>
     595:	eb 28                	jmp    5bf <peek+0x3f>
     597:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     59e:	66 90                	xchg   %ax,%ax
    s++;
     5a0:	83 c3 01             	add    $0x1,%ebx
  while(s < es && strchr(whitespace, *s))
     5a3:	39 de                	cmp    %ebx,%esi
     5a5:	74 18                	je     5bf <peek+0x3f>
     5a7:	0f be 03             	movsbl (%ebx),%eax
     5aa:	83 ec 08             	sub    $0x8,%esp
     5ad:	50                   	push   %eax
     5ae:	68 b0 19 00 00       	push   $0x19b0
     5b3:	e8 98 06 00 00       	call   c50 <strchr>
     5b8:	83 c4 10             	add    $0x10,%esp
     5bb:	85 c0                	test   %eax,%eax
     5bd:	75 e1                	jne    5a0 <peek+0x20>
  *ps = s;
     5bf:	89 1f                	mov    %ebx,(%edi)
  return *s && strchr(toks, *s);
     5c1:	0f be 03             	movsbl (%ebx),%eax
     5c4:	31 d2                	xor    %edx,%edx
     5c6:	84 c0                	test   %al,%al
     5c8:	75 0e                	jne    5d8 <peek+0x58>
}
     5ca:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5cd:	89 d0                	mov    %edx,%eax
     5cf:	5b                   	pop    %ebx
     5d0:	5e                   	pop    %esi
     5d1:	5f                   	pop    %edi
     5d2:	5d                   	pop    %ebp
     5d3:	c3                   	ret
     5d4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  return *s && strchr(toks, *s);
     5d8:	83 ec 08             	sub    $0x8,%esp
     5db:	50                   	push   %eax
     5dc:	ff 75 10             	push   0x10(%ebp)
     5df:	e8 6c 06 00 00       	call   c50 <strchr>
     5e4:	83 c4 10             	add    $0x10,%esp
     5e7:	31 d2                	xor    %edx,%edx
     5e9:	85 c0                	test   %eax,%eax
     5eb:	0f 95 c2             	setne  %dl
}
     5ee:	8d 65 f4             	lea    -0xc(%ebp),%esp
     5f1:	5b                   	pop    %ebx
     5f2:	89 d0                	mov    %edx,%eax
     5f4:	5e                   	pop    %esi
     5f5:	5f                   	pop    %edi
     5f6:	5d                   	pop    %ebp
     5f7:	c3                   	ret
     5f8:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     5ff:	90                   	nop

00000600 <parseredirs>:
  return cmd;
}

struct cmd*
parseredirs(struct cmd *cmd, char **ps, char *es)
{
     600:	55                   	push   %ebp
     601:	89 e5                	mov    %esp,%ebp
     603:	57                   	push   %edi
     604:	56                   	push   %esi
     605:	53                   	push   %ebx
     606:	83 ec 2c             	sub    $0x2c,%esp
     609:	8b 75 0c             	mov    0xc(%ebp),%esi
     60c:	8b 5d 10             	mov    0x10(%ebp),%ebx
  int tok;
  char *q, *eq;

  while(peek(ps, es, "<>")){
     60f:	90                   	nop
     610:	83 ec 04             	sub    $0x4,%esp
     613:	68 b0 12 00 00       	push   $0x12b0
     618:	53                   	push   %ebx
     619:	56                   	push   %esi
     61a:	e8 61 ff ff ff       	call   580 <peek>
     61f:	83 c4 10             	add    $0x10,%esp
     622:	85 c0                	test   %eax,%eax
     624:	0f 84 f6 00 00 00    	je     720 <parseredirs+0x120>
    tok = gettoken(ps, es, 0, 0);
     62a:	6a 00                	push   $0x0
     62c:	6a 00                	push   $0x0
     62e:	53                   	push   %ebx
     62f:	56                   	push   %esi
     630:	e8 db fd ff ff       	call   410 <gettoken>
     635:	89 c7                	mov    %eax,%edi
    if(gettoken(ps, es, &q, &eq) != 'a')
     637:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     63a:	50                   	push   %eax
     63b:	8d 45 e0             	lea    -0x20(%ebp),%eax
     63e:	50                   	push   %eax
     63f:	53                   	push   %ebx
     640:	56                   	push   %esi
     641:	e8 ca fd ff ff       	call   410 <gettoken>
     646:	83 c4 20             	add    $0x20,%esp
     649:	83 f8 61             	cmp    $0x61,%eax
     64c:	0f 85 d9 00 00 00    	jne    72b <parseredirs+0x12b>
      panic("missing file for redirection");
    switch(tok){
     652:	83 ff 3c             	cmp    $0x3c,%edi
     655:	74 69                	je     6c0 <parseredirs+0xc0>
     657:	83 ff 3e             	cmp    $0x3e,%edi
     65a:	74 05                	je     661 <parseredirs+0x61>
     65c:	83 ff 2b             	cmp    $0x2b,%edi
     65f:	75 af                	jne    610 <parseredirs+0x10>
      break;
    case '>':
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
      break;
    case '+':  // >>
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     661:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     664:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     667:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_WRONLY|O_CREATE, 1);
     66a:	89 55 d0             	mov    %edx,-0x30(%ebp)
     66d:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     670:	6a 18                	push   $0x18
     672:	e8 d9 0a 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     677:	83 c4 0c             	add    $0xc,%esp
     67a:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     67c:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     67e:	6a 00                	push   $0x0
     680:	50                   	push   %eax
     681:	e8 aa 05 00 00       	call   c30 <memset>
  cmd->type = REDIR;
     686:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
  cmd->cmd = subcmd;
     68c:	8b 45 08             	mov    0x8(%ebp),%eax
      break;
     68f:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     692:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     695:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
     698:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     69b:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->mode = mode;
     69e:	c7 47 10 01 02 00 00 	movl   $0x201,0x10(%edi)
  cmd->efile = efile;
     6a5:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->fd = fd;
     6a8:	c7 47 14 01 00 00 00 	movl   $0x1,0x14(%edi)
      break;
     6af:	89 7d 08             	mov    %edi,0x8(%ebp)
     6b2:	e9 59 ff ff ff       	jmp    610 <parseredirs+0x10>
     6b7:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     6be:	66 90                	xchg   %ax,%ax
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6c0:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     6c3:	8b 4d e0             	mov    -0x20(%ebp),%ecx
  cmd = malloc(sizeof(*cmd));
     6c6:	83 ec 0c             	sub    $0xc,%esp
      cmd = redircmd(cmd, q, eq, O_RDONLY, 0);
     6c9:	89 55 d0             	mov    %edx,-0x30(%ebp)
     6cc:	89 4d d4             	mov    %ecx,-0x2c(%ebp)
  cmd = malloc(sizeof(*cmd));
     6cf:	6a 18                	push   $0x18
     6d1:	e8 7a 0a 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     6d6:	83 c4 0c             	add    $0xc,%esp
     6d9:	6a 18                	push   $0x18
  cmd = malloc(sizeof(*cmd));
     6db:	89 c7                	mov    %eax,%edi
  memset(cmd, 0, sizeof(*cmd));
     6dd:	6a 00                	push   $0x0
     6df:	50                   	push   %eax
     6e0:	e8 4b 05 00 00       	call   c30 <memset>
  cmd->cmd = subcmd;
     6e5:	8b 45 08             	mov    0x8(%ebp),%eax
  cmd->file = file;
     6e8:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
      break;
     6eb:	89 7d 08             	mov    %edi,0x8(%ebp)
  cmd->efile = efile;
     6ee:	8b 55 d0             	mov    -0x30(%ebp),%edx
  cmd->type = REDIR;
     6f1:	c7 07 02 00 00 00    	movl   $0x2,(%edi)
      break;
     6f7:	83 c4 10             	add    $0x10,%esp
  cmd->cmd = subcmd;
     6fa:	89 47 04             	mov    %eax,0x4(%edi)
  cmd->file = file;
     6fd:	89 4f 08             	mov    %ecx,0x8(%edi)
  cmd->efile = efile;
     700:	89 57 0c             	mov    %edx,0xc(%edi)
  cmd->mode = mode;
     703:	c7 47 10 00 00 00 00 	movl   $0x0,0x10(%edi)
  cmd->fd = fd;
     70a:	c7 47 14 00 00 00 00 	movl   $0x0,0x14(%edi)
      break;
     711:	e9 fa fe ff ff       	jmp    610 <parseredirs+0x10>
     716:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     71d:	8d 76 00             	lea    0x0(%esi),%esi
    }
  }
  return cmd;
}
     720:	8b 45 08             	mov    0x8(%ebp),%eax
     723:	8d 65 f4             	lea    -0xc(%ebp),%esp
     726:	5b                   	pop    %ebx
     727:	5e                   	pop    %esi
     728:	5f                   	pop    %edi
     729:	5d                   	pop    %ebp
     72a:	c3                   	ret
      panic("missing file for redirection");
     72b:	83 ec 0c             	sub    $0xc,%esp
     72e:	68 93 12 00 00       	push   $0x1293
     733:	e8 38 fa ff ff       	call   170 <panic>
     738:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     73f:	90                   	nop

00000740 <parseexec>:
  return cmd;
}

struct cmd*
parseexec(char **ps, char *es)
{
     740:	55                   	push   %ebp
     741:	89 e5                	mov    %esp,%ebp
     743:	57                   	push   %edi
     744:	56                   	push   %esi
     745:	53                   	push   %ebx
     746:	83 ec 30             	sub    $0x30,%esp
     749:	8b 5d 08             	mov    0x8(%ebp),%ebx
     74c:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *q, *eq;
  int tok, argc;
  struct execcmd *cmd;
  struct cmd *ret;

  if(peek(ps, es, "("))
     74f:	68 b3 12 00 00       	push   $0x12b3
     754:	56                   	push   %esi
     755:	53                   	push   %ebx
     756:	e8 25 fe ff ff       	call   580 <peek>
     75b:	83 c4 10             	add    $0x10,%esp
     75e:	85 c0                	test   %eax,%eax
     760:	0f 85 aa 00 00 00    	jne    810 <parseexec+0xd0>
  cmd = malloc(sizeof(*cmd));
     766:	83 ec 0c             	sub    $0xc,%esp
     769:	89 c7                	mov    %eax,%edi
     76b:	6a 54                	push   $0x54
     76d:	e8 de 09 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     772:	83 c4 0c             	add    $0xc,%esp
     775:	6a 54                	push   $0x54
     777:	6a 00                	push   $0x0
     779:	89 45 d0             	mov    %eax,-0x30(%ebp)
     77c:	50                   	push   %eax
     77d:	e8 ae 04 00 00       	call   c30 <memset>
  cmd->type = EXEC;
     782:	8b 45 d0             	mov    -0x30(%ebp),%eax

  ret = execcmd();
  cmd = (struct execcmd*)ret;

  argc = 0;
  ret = parseredirs(ret, ps, es);
     785:	83 c4 0c             	add    $0xc,%esp
  cmd->type = EXEC;
     788:	c7 00 01 00 00 00    	movl   $0x1,(%eax)
  ret = parseredirs(ret, ps, es);
     78e:	56                   	push   %esi
     78f:	53                   	push   %ebx
     790:	50                   	push   %eax
     791:	e8 6a fe ff ff       	call   600 <parseredirs>
  while(!peek(ps, es, "|)&;")){
     796:	83 c4 10             	add    $0x10,%esp
  ret = parseredirs(ret, ps, es);
     799:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     79c:	eb 15                	jmp    7b3 <parseexec+0x73>
     79e:	66 90                	xchg   %ax,%ax
    cmd->argv[argc] = q;
    cmd->eargv[argc] = eq;
    argc++;
    if(argc >= MAXARGS)
      panic("too many args");
    ret = parseredirs(ret, ps, es);
     7a0:	83 ec 04             	sub    $0x4,%esp
     7a3:	56                   	push   %esi
     7a4:	53                   	push   %ebx
     7a5:	ff 75 d4             	push   -0x2c(%ebp)
     7a8:	e8 53 fe ff ff       	call   600 <parseredirs>
     7ad:	83 c4 10             	add    $0x10,%esp
     7b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  while(!peek(ps, es, "|)&;")){
     7b3:	83 ec 04             	sub    $0x4,%esp
     7b6:	68 ca 12 00 00       	push   $0x12ca
     7bb:	56                   	push   %esi
     7bc:	53                   	push   %ebx
     7bd:	e8 be fd ff ff       	call   580 <peek>
     7c2:	83 c4 10             	add    $0x10,%esp
     7c5:	85 c0                	test   %eax,%eax
     7c7:	75 5f                	jne    828 <parseexec+0xe8>
    if((tok=gettoken(ps, es, &q, &eq)) == 0)
     7c9:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     7cc:	50                   	push   %eax
     7cd:	8d 45 e0             	lea    -0x20(%ebp),%eax
     7d0:	50                   	push   %eax
     7d1:	56                   	push   %esi
     7d2:	53                   	push   %ebx
     7d3:	e8 38 fc ff ff       	call   410 <gettoken>
     7d8:	83 c4 10             	add    $0x10,%esp
     7db:	85 c0                	test   %eax,%eax
     7dd:	74 49                	je     828 <parseexec+0xe8>
    if(tok != 'a')
     7df:	83 f8 61             	cmp    $0x61,%eax
     7e2:	75 62                	jne    846 <parseexec+0x106>
    cmd->argv[argc] = q;
     7e4:	8b 45 e0             	mov    -0x20(%ebp),%eax
     7e7:	8b 55 d0             	mov    -0x30(%ebp),%edx
     7ea:	89 44 ba 04          	mov    %eax,0x4(%edx,%edi,4)
    cmd->eargv[argc] = eq;
     7ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     7f1:	89 44 ba 2c          	mov    %eax,0x2c(%edx,%edi,4)
    argc++;
     7f5:	83 c7 01             	add    $0x1,%edi
    if(argc >= MAXARGS)
     7f8:	83 ff 0a             	cmp    $0xa,%edi
     7fb:	75 a3                	jne    7a0 <parseexec+0x60>
      panic("too many args");
     7fd:	83 ec 0c             	sub    $0xc,%esp
     800:	68 bc 12 00 00       	push   $0x12bc
     805:	e8 66 f9 ff ff       	call   170 <panic>
     80a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    return parseblock(ps, es);
     810:	89 75 0c             	mov    %esi,0xc(%ebp)
     813:	89 5d 08             	mov    %ebx,0x8(%ebp)
  }
  cmd->argv[argc] = 0;
  cmd->eargv[argc] = 0;
  return ret;
}
     816:	8d 65 f4             	lea    -0xc(%ebp),%esp
     819:	5b                   	pop    %ebx
     81a:	5e                   	pop    %esi
     81b:	5f                   	pop    %edi
     81c:	5d                   	pop    %ebp
    return parseblock(ps, es);
     81d:	e9 ae 01 00 00       	jmp    9d0 <parseblock>
     822:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  cmd->argv[argc] = 0;
     828:	8b 45 d0             	mov    -0x30(%ebp),%eax
     82b:	c7 44 b8 04 00 00 00 	movl   $0x0,0x4(%eax,%edi,4)
     832:	00 
  cmd->eargv[argc] = 0;
     833:	c7 44 b8 2c 00 00 00 	movl   $0x0,0x2c(%eax,%edi,4)
     83a:	00 
}
     83b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
     83e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     841:	5b                   	pop    %ebx
     842:	5e                   	pop    %esi
     843:	5f                   	pop    %edi
     844:	5d                   	pop    %ebp
     845:	c3                   	ret
      panic("syntax");
     846:	83 ec 0c             	sub    $0xc,%esp
     849:	68 b5 12 00 00       	push   $0x12b5
     84e:	e8 1d f9 ff ff       	call   170 <panic>
     853:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     85a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi

00000860 <parsepipe>:
{
     860:	55                   	push   %ebp
     861:	89 e5                	mov    %esp,%ebp
     863:	57                   	push   %edi
     864:	56                   	push   %esi
     865:	53                   	push   %ebx
     866:	83 ec 14             	sub    $0x14,%esp
     869:	8b 75 08             	mov    0x8(%ebp),%esi
     86c:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parseexec(ps, es);
     86f:	57                   	push   %edi
     870:	56                   	push   %esi
     871:	e8 ca fe ff ff       	call   740 <parseexec>
  if(peek(ps, es, "|")){
     876:	83 c4 0c             	add    $0xc,%esp
     879:	68 cf 12 00 00       	push   $0x12cf
  cmd = parseexec(ps, es);
     87e:	89 c3                	mov    %eax,%ebx
  if(peek(ps, es, "|")){
     880:	57                   	push   %edi
     881:	56                   	push   %esi
     882:	e8 f9 fc ff ff       	call   580 <peek>
     887:	83 c4 10             	add    $0x10,%esp
     88a:	85 c0                	test   %eax,%eax
     88c:	75 12                	jne    8a0 <parsepipe+0x40>
}
     88e:	8d 65 f4             	lea    -0xc(%ebp),%esp
     891:	89 d8                	mov    %ebx,%eax
     893:	5b                   	pop    %ebx
     894:	5e                   	pop    %esi
     895:	5f                   	pop    %edi
     896:	5d                   	pop    %ebp
     897:	c3                   	ret
     898:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     89f:	90                   	nop
    gettoken(ps, es, 0, 0);
     8a0:	6a 00                	push   $0x0
     8a2:	6a 00                	push   $0x0
     8a4:	57                   	push   %edi
     8a5:	56                   	push   %esi
     8a6:	e8 65 fb ff ff       	call   410 <gettoken>
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8ab:	58                   	pop    %eax
     8ac:	5a                   	pop    %edx
     8ad:	57                   	push   %edi
     8ae:	56                   	push   %esi
     8af:	e8 ac ff ff ff       	call   860 <parsepipe>
  cmd = malloc(sizeof(*cmd));
     8b4:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = pipecmd(cmd, parsepipe(ps, es));
     8bb:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     8bd:	e8 8e 08 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     8c2:	83 c4 0c             	add    $0xc,%esp
     8c5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     8c7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     8c9:	6a 00                	push   $0x0
     8cb:	50                   	push   %eax
     8cc:	e8 5f 03 00 00       	call   c30 <memset>
  cmd->left = left;
     8d1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     8d4:	83 c4 10             	add    $0x10,%esp
     8d7:	89 f3                	mov    %esi,%ebx
  cmd->type = PIPE;
     8d9:	c7 06 03 00 00 00    	movl   $0x3,(%esi)
}
     8df:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     8e1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     8e4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     8e7:	5b                   	pop    %ebx
     8e8:	5e                   	pop    %esi
     8e9:	5f                   	pop    %edi
     8ea:	5d                   	pop    %ebp
     8eb:	c3                   	ret
     8ec:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000008f0 <parseline>:
{
     8f0:	55                   	push   %ebp
     8f1:	89 e5                	mov    %esp,%ebp
     8f3:	57                   	push   %edi
     8f4:	56                   	push   %esi
     8f5:	53                   	push   %ebx
     8f6:	83 ec 24             	sub    $0x24,%esp
     8f9:	8b 75 08             	mov    0x8(%ebp),%esi
     8fc:	8b 7d 0c             	mov    0xc(%ebp),%edi
  cmd = parsepipe(ps, es);
     8ff:	57                   	push   %edi
     900:	56                   	push   %esi
     901:	e8 5a ff ff ff       	call   860 <parsepipe>
  while(peek(ps, es, "&")){
     906:	83 c4 10             	add    $0x10,%esp
  cmd = parsepipe(ps, es);
     909:	89 c3                	mov    %eax,%ebx
  while(peek(ps, es, "&")){
     90b:	eb 3b                	jmp    948 <parseline+0x58>
     90d:	8d 76 00             	lea    0x0(%esi),%esi
    gettoken(ps, es, 0, 0);
     910:	6a 00                	push   $0x0
     912:	6a 00                	push   $0x0
     914:	57                   	push   %edi
     915:	56                   	push   %esi
     916:	e8 f5 fa ff ff       	call   410 <gettoken>
  cmd = malloc(sizeof(*cmd));
     91b:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
     922:	e8 29 08 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     927:	83 c4 0c             	add    $0xc,%esp
     92a:	6a 08                	push   $0x8
     92c:	6a 00                	push   $0x0
     92e:	50                   	push   %eax
     92f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
     932:	e8 f9 02 00 00       	call   c30 <memset>
  cmd->type = BACK;
     937:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  cmd->cmd = subcmd;
     93a:	83 c4 10             	add    $0x10,%esp
  cmd->type = BACK;
     93d:	c7 02 05 00 00 00    	movl   $0x5,(%edx)
  cmd->cmd = subcmd;
     943:	89 5a 04             	mov    %ebx,0x4(%edx)
     946:	89 d3                	mov    %edx,%ebx
  while(peek(ps, es, "&")){
     948:	83 ec 04             	sub    $0x4,%esp
     94b:	68 d1 12 00 00       	push   $0x12d1
     950:	57                   	push   %edi
     951:	56                   	push   %esi
     952:	e8 29 fc ff ff       	call   580 <peek>
     957:	83 c4 10             	add    $0x10,%esp
     95a:	85 c0                	test   %eax,%eax
     95c:	75 b2                	jne    910 <parseline+0x20>
  if(peek(ps, es, ";")){
     95e:	83 ec 04             	sub    $0x4,%esp
     961:	68 cd 12 00 00       	push   $0x12cd
     966:	57                   	push   %edi
     967:	56                   	push   %esi
     968:	e8 13 fc ff ff       	call   580 <peek>
     96d:	83 c4 10             	add    $0x10,%esp
     970:	85 c0                	test   %eax,%eax
     972:	75 0c                	jne    980 <parseline+0x90>
}
     974:	8d 65 f4             	lea    -0xc(%ebp),%esp
     977:	89 d8                	mov    %ebx,%eax
     979:	5b                   	pop    %ebx
     97a:	5e                   	pop    %esi
     97b:	5f                   	pop    %edi
     97c:	5d                   	pop    %ebp
     97d:	c3                   	ret
     97e:	66 90                	xchg   %ax,%ax
    gettoken(ps, es, 0, 0);
     980:	6a 00                	push   $0x0
     982:	6a 00                	push   $0x0
     984:	57                   	push   %edi
     985:	56                   	push   %esi
     986:	e8 85 fa ff ff       	call   410 <gettoken>
    cmd = listcmd(cmd, parseline(ps, es));
     98b:	58                   	pop    %eax
     98c:	5a                   	pop    %edx
     98d:	57                   	push   %edi
     98e:	56                   	push   %esi
     98f:	e8 5c ff ff ff       	call   8f0 <parseline>
  cmd = malloc(sizeof(*cmd));
     994:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
    cmd = listcmd(cmd, parseline(ps, es));
     99b:	89 c7                	mov    %eax,%edi
  cmd = malloc(sizeof(*cmd));
     99d:	e8 ae 07 00 00       	call   1150 <malloc>
  memset(cmd, 0, sizeof(*cmd));
     9a2:	83 c4 0c             	add    $0xc,%esp
     9a5:	6a 0c                	push   $0xc
  cmd = malloc(sizeof(*cmd));
     9a7:	89 c6                	mov    %eax,%esi
  memset(cmd, 0, sizeof(*cmd));
     9a9:	6a 00                	push   $0x0
     9ab:	50                   	push   %eax
     9ac:	e8 7f 02 00 00       	call   c30 <memset>
  cmd->left = left;
     9b1:	89 5e 04             	mov    %ebx,0x4(%esi)
  cmd->right = right;
     9b4:	83 c4 10             	add    $0x10,%esp
     9b7:	89 f3                	mov    %esi,%ebx
  cmd->type = LIST;
     9b9:	c7 06 04 00 00 00    	movl   $0x4,(%esi)
}
     9bf:	89 d8                	mov    %ebx,%eax
  cmd->right = right;
     9c1:	89 7e 08             	mov    %edi,0x8(%esi)
}
     9c4:	8d 65 f4             	lea    -0xc(%ebp),%esp
     9c7:	5b                   	pop    %ebx
     9c8:	5e                   	pop    %esi
     9c9:	5f                   	pop    %edi
     9ca:	5d                   	pop    %ebp
     9cb:	c3                   	ret
     9cc:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

000009d0 <parseblock>:
{
     9d0:	55                   	push   %ebp
     9d1:	89 e5                	mov    %esp,%ebp
     9d3:	57                   	push   %edi
     9d4:	56                   	push   %esi
     9d5:	53                   	push   %ebx
     9d6:	83 ec 10             	sub    $0x10,%esp
     9d9:	8b 5d 08             	mov    0x8(%ebp),%ebx
     9dc:	8b 75 0c             	mov    0xc(%ebp),%esi
  if(!peek(ps, es, "("))
     9df:	68 b3 12 00 00       	push   $0x12b3
     9e4:	56                   	push   %esi
     9e5:	53                   	push   %ebx
     9e6:	e8 95 fb ff ff       	call   580 <peek>
     9eb:	83 c4 10             	add    $0x10,%esp
     9ee:	85 c0                	test   %eax,%eax
     9f0:	74 4a                	je     a3c <parseblock+0x6c>
  gettoken(ps, es, 0, 0);
     9f2:	6a 00                	push   $0x0
     9f4:	6a 00                	push   $0x0
     9f6:	56                   	push   %esi
     9f7:	53                   	push   %ebx
     9f8:	e8 13 fa ff ff       	call   410 <gettoken>
  cmd = parseline(ps, es);
     9fd:	58                   	pop    %eax
     9fe:	5a                   	pop    %edx
     9ff:	56                   	push   %esi
     a00:	53                   	push   %ebx
     a01:	e8 ea fe ff ff       	call   8f0 <parseline>
  if(!peek(ps, es, ")"))
     a06:	83 c4 0c             	add    $0xc,%esp
     a09:	68 ef 12 00 00       	push   $0x12ef
  cmd = parseline(ps, es);
     a0e:	89 c7                	mov    %eax,%edi
  if(!peek(ps, es, ")"))
     a10:	56                   	push   %esi
     a11:	53                   	push   %ebx
     a12:	e8 69 fb ff ff       	call   580 <peek>
     a17:	83 c4 10             	add    $0x10,%esp
     a1a:	85 c0                	test   %eax,%eax
     a1c:	74 2b                	je     a49 <parseblock+0x79>
  gettoken(ps, es, 0, 0);
     a1e:	6a 00                	push   $0x0
     a20:	6a 00                	push   $0x0
     a22:	56                   	push   %esi
     a23:	53                   	push   %ebx
     a24:	e8 e7 f9 ff ff       	call   410 <gettoken>
  cmd = parseredirs(cmd, ps, es);
     a29:	83 c4 0c             	add    $0xc,%esp
     a2c:	56                   	push   %esi
     a2d:	53                   	push   %ebx
     a2e:	57                   	push   %edi
     a2f:	e8 cc fb ff ff       	call   600 <parseredirs>
}
     a34:	8d 65 f4             	lea    -0xc(%ebp),%esp
     a37:	5b                   	pop    %ebx
     a38:	5e                   	pop    %esi
     a39:	5f                   	pop    %edi
     a3a:	5d                   	pop    %ebp
     a3b:	c3                   	ret
    panic("parseblock");
     a3c:	83 ec 0c             	sub    $0xc,%esp
     a3f:	68 d3 12 00 00       	push   $0x12d3
     a44:	e8 27 f7 ff ff       	call   170 <panic>
    panic("syntax - missing )");
     a49:	83 ec 0c             	sub    $0xc,%esp
     a4c:	68 de 12 00 00       	push   $0x12de
     a51:	e8 1a f7 ff ff       	call   170 <panic>
     a56:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     a5d:	8d 76 00             	lea    0x0(%esi),%esi

00000a60 <nulterminate>:

// NUL-terminate all the counted strings.
struct cmd*
nulterminate(struct cmd *cmd)
{
     a60:	55                   	push   %ebp
     a61:	89 e5                	mov    %esp,%ebp
     a63:	53                   	push   %ebx
     a64:	83 ec 04             	sub    $0x4,%esp
     a67:	8b 5d 08             	mov    0x8(%ebp),%ebx
  struct execcmd *ecmd;
  struct listcmd *lcmd;
  struct pipecmd *pcmd;
  struct redircmd *rcmd;

  if(cmd == 0)
     a6a:	85 db                	test   %ebx,%ebx
     a6c:	0f 84 7e 00 00 00    	je     af0 <nulterminate+0x90>
    return 0;

  switch(cmd->type){
     a72:	83 3b 05             	cmpl   $0x5,(%ebx)
     a75:	77 20                	ja     a97 <nulterminate+0x37>
     a77:	8b 03                	mov    (%ebx),%eax
     a79:	ff 24 85 7c 13 00 00 	jmp    *0x137c(,%eax,4)
    nulterminate(pcmd->right);
    break;

  case LIST:
    lcmd = (struct listcmd*)cmd;
    nulterminate(lcmd->left);
     a80:	83 ec 0c             	sub    $0xc,%esp
     a83:	ff 73 04             	push   0x4(%ebx)
     a86:	e8 d5 ff ff ff       	call   a60 <nulterminate>
    nulterminate(lcmd->right);
     a8b:	58                   	pop    %eax
     a8c:	ff 73 08             	push   0x8(%ebx)
     a8f:	e8 cc ff ff ff       	call   a60 <nulterminate>
    break;
     a94:	83 c4 10             	add    $0x10,%esp
    return 0;
     a97:	89 d8                	mov    %ebx,%eax
    bcmd = (struct backcmd*)cmd;
    nulterminate(bcmd->cmd);
    break;
  }
  return cmd;
}
     a99:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     a9c:	c9                   	leave
     a9d:	c3                   	ret
     a9e:	66 90                	xchg   %ax,%ax
    nulterminate(bcmd->cmd);
     aa0:	83 ec 0c             	sub    $0xc,%esp
     aa3:	ff 73 04             	push   0x4(%ebx)
     aa6:	e8 b5 ff ff ff       	call   a60 <nulterminate>
    break;
     aab:	83 c4 10             	add    $0x10,%esp
     aae:	eb e7                	jmp    a97 <nulterminate+0x37>
    for(i=0; ecmd->argv[i]; i++)
     ab0:	8b 4b 04             	mov    0x4(%ebx),%ecx
     ab3:	8d 43 08             	lea    0x8(%ebx),%eax
     ab6:	85 c9                	test   %ecx,%ecx
     ab8:	74 dd                	je     a97 <nulterminate+0x37>
     aba:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      *ecmd->eargv[i] = 0;
     ac0:	8b 50 24             	mov    0x24(%eax),%edx
    for(i=0; ecmd->argv[i]; i++)
     ac3:	83 c0 04             	add    $0x4,%eax
      *ecmd->eargv[i] = 0;
     ac6:	c6 02 00             	movb   $0x0,(%edx)
    for(i=0; ecmd->argv[i]; i++)
     ac9:	8b 50 fc             	mov    -0x4(%eax),%edx
     acc:	85 d2                	test   %edx,%edx
     ace:	75 f0                	jne    ac0 <nulterminate+0x60>
     ad0:	eb c5                	jmp    a97 <nulterminate+0x37>
     ad2:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
    nulterminate(rcmd->cmd);
     ad8:	83 ec 0c             	sub    $0xc,%esp
     adb:	ff 73 04             	push   0x4(%ebx)
     ade:	e8 7d ff ff ff       	call   a60 <nulterminate>
    *rcmd->efile = 0;
     ae3:	8b 43 0c             	mov    0xc(%ebx),%eax
    break;
     ae6:	83 c4 10             	add    $0x10,%esp
    *rcmd->efile = 0;
     ae9:	c6 00 00             	movb   $0x0,(%eax)
    break;
     aec:	eb a9                	jmp    a97 <nulterminate+0x37>
     aee:	66 90                	xchg   %ax,%ax
    return 0;
     af0:	31 c0                	xor    %eax,%eax
     af2:	eb a5                	jmp    a99 <nulterminate+0x39>
     af4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     afb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     aff:	90                   	nop

00000b00 <parsecmd>:
{
     b00:	55                   	push   %ebp
     b01:	89 e5                	mov    %esp,%ebp
     b03:	57                   	push   %edi
     b04:	56                   	push   %esi
  cmd = parseline(&s, es);
     b05:	8d 7d 08             	lea    0x8(%ebp),%edi
{
     b08:	53                   	push   %ebx
     b09:	83 ec 18             	sub    $0x18,%esp
  es = s + strlen(s);
     b0c:	8b 5d 08             	mov    0x8(%ebp),%ebx
     b0f:	53                   	push   %ebx
     b10:	e8 eb 00 00 00       	call   c00 <strlen>
  cmd = parseline(&s, es);
     b15:	59                   	pop    %ecx
     b16:	5e                   	pop    %esi
  es = s + strlen(s);
     b17:	01 c3                	add    %eax,%ebx
  cmd = parseline(&s, es);
     b19:	53                   	push   %ebx
     b1a:	57                   	push   %edi
     b1b:	e8 d0 fd ff ff       	call   8f0 <parseline>
  peek(&s, es, "");
     b20:	83 c4 0c             	add    $0xc,%esp
     b23:	68 51 12 00 00       	push   $0x1251
  cmd = parseline(&s, es);
     b28:	89 c6                	mov    %eax,%esi
  peek(&s, es, "");
     b2a:	53                   	push   %ebx
     b2b:	57                   	push   %edi
     b2c:	e8 4f fa ff ff       	call   580 <peek>
  if(s != es){
     b31:	8b 45 08             	mov    0x8(%ebp),%eax
     b34:	83 c4 10             	add    $0x10,%esp
     b37:	39 d8                	cmp    %ebx,%eax
     b39:	75 13                	jne    b4e <parsecmd+0x4e>
  nulterminate(cmd);
     b3b:	83 ec 0c             	sub    $0xc,%esp
     b3e:	56                   	push   %esi
     b3f:	e8 1c ff ff ff       	call   a60 <nulterminate>
}
     b44:	8d 65 f4             	lea    -0xc(%ebp),%esp
     b47:	89 f0                	mov    %esi,%eax
     b49:	5b                   	pop    %ebx
     b4a:	5e                   	pop    %esi
     b4b:	5f                   	pop    %edi
     b4c:	5d                   	pop    %ebp
     b4d:	c3                   	ret
    printf(2, "leftovers: %s\n", s);
     b4e:	52                   	push   %edx
     b4f:	50                   	push   %eax
     b50:	68 f1 12 00 00       	push   $0x12f1
     b55:	6a 02                	push   $0x2
     b57:	e8 b4 03 00 00       	call   f10 <printf>
    panic("syntax");
     b5c:	c7 04 24 b5 12 00 00 	movl   $0x12b5,(%esp)
     b63:	e8 08 f6 ff ff       	call   170 <panic>
     b68:	66 90                	xchg   %ax,%ax
     b6a:	66 90                	xchg   %ax,%ax
     b6c:	66 90                	xchg   %ax,%ax
     b6e:	66 90                	xchg   %ax,%ax

00000b70 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     b70:	55                   	push   %ebp
  char *os;

  os = s;
  while((*s++ = *t++) != 0)
     b71:	31 c0                	xor    %eax,%eax
{
     b73:	89 e5                	mov    %esp,%ebp
     b75:	53                   	push   %ebx
     b76:	8b 4d 08             	mov    0x8(%ebp),%ecx
     b79:	8b 5d 0c             	mov    0xc(%ebp),%ebx
     b7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
  while((*s++ = *t++) != 0)
     b80:	0f b6 14 03          	movzbl (%ebx,%eax,1),%edx
     b84:	88 14 01             	mov    %dl,(%ecx,%eax,1)
     b87:	83 c0 01             	add    $0x1,%eax
     b8a:	84 d2                	test   %dl,%dl
     b8c:	75 f2                	jne    b80 <strcpy+0x10>
    ;
  return os;
}
     b8e:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     b91:	89 c8                	mov    %ecx,%eax
     b93:	c9                   	leave
     b94:	c3                   	ret
     b95:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     b9c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000ba0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
     ba0:	55                   	push   %ebp
     ba1:	89 e5                	mov    %esp,%ebp
     ba3:	53                   	push   %ebx
     ba4:	8b 55 08             	mov    0x8(%ebp),%edx
     ba7:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  while(*p && *p == *q)
     baa:	0f b6 02             	movzbl (%edx),%eax
     bad:	84 c0                	test   %al,%al
     baf:	75 17                	jne    bc8 <strcmp+0x28>
     bb1:	eb 3a                	jmp    bed <strcmp+0x4d>
     bb3:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bb7:	90                   	nop
     bb8:	0f b6 42 01          	movzbl 0x1(%edx),%eax
    p++, q++;
     bbc:	83 c2 01             	add    $0x1,%edx
     bbf:	8d 59 01             	lea    0x1(%ecx),%ebx
  while(*p && *p == *q)
     bc2:	84 c0                	test   %al,%al
     bc4:	74 1a                	je     be0 <strcmp+0x40>
    p++, q++;
     bc6:	89 d9                	mov    %ebx,%ecx
  while(*p && *p == *q)
     bc8:	0f b6 19             	movzbl (%ecx),%ebx
     bcb:	38 c3                	cmp    %al,%bl
     bcd:	74 e9                	je     bb8 <strcmp+0x18>
  return (uchar)*p - (uchar)*q;
     bcf:	29 d8                	sub    %ebx,%eax
}
     bd1:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     bd4:	c9                   	leave
     bd5:	c3                   	ret
     bd6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bdd:	8d 76 00             	lea    0x0(%esi),%esi
  return (uchar)*p - (uchar)*q;
     be0:	0f b6 59 01          	movzbl 0x1(%ecx),%ebx
     be4:	31 c0                	xor    %eax,%eax
     be6:	29 d8                	sub    %ebx,%eax
}
     be8:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     beb:	c9                   	leave
     bec:	c3                   	ret
  return (uchar)*p - (uchar)*q;
     bed:	0f b6 19             	movzbl (%ecx),%ebx
     bf0:	31 c0                	xor    %eax,%eax
     bf2:	eb db                	jmp    bcf <strcmp+0x2f>
     bf4:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     bfb:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     bff:	90                   	nop

00000c00 <strlen>:

uint
strlen(char *s)
{
     c00:	55                   	push   %ebp
     c01:	89 e5                	mov    %esp,%ebp
     c03:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  for(n = 0; s[n]; n++)
     c06:	80 3a 00             	cmpb   $0x0,(%edx)
     c09:	74 15                	je     c20 <strlen+0x20>
     c0b:	31 c0                	xor    %eax,%eax
     c0d:	8d 76 00             	lea    0x0(%esi),%esi
     c10:	83 c0 01             	add    $0x1,%eax
     c13:	80 3c 02 00          	cmpb   $0x0,(%edx,%eax,1)
     c17:	89 c1                	mov    %eax,%ecx
     c19:	75 f5                	jne    c10 <strlen+0x10>
    ;
  return n;
}
     c1b:	89 c8                	mov    %ecx,%eax
     c1d:	5d                   	pop    %ebp
     c1e:	c3                   	ret
     c1f:	90                   	nop
  for(n = 0; s[n]; n++)
     c20:	31 c9                	xor    %ecx,%ecx
}
     c22:	5d                   	pop    %ebp
     c23:	89 c8                	mov    %ecx,%eax
     c25:	c3                   	ret
     c26:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c2d:	8d 76 00             	lea    0x0(%esi),%esi

00000c30 <memset>:

void*
memset(void *dst, int c, uint n)
{
     c30:	55                   	push   %ebp
     c31:	89 e5                	mov    %esp,%ebp
     c33:	57                   	push   %edi
     c34:	8b 55 08             	mov    0x8(%ebp),%edx
}

static inline void
stosb(void *addr, int data, int cnt)
{
  asm volatile("cld; rep stosb" :
     c37:	8b 4d 10             	mov    0x10(%ebp),%ecx
     c3a:	8b 45 0c             	mov    0xc(%ebp),%eax
     c3d:	89 d7                	mov    %edx,%edi
     c3f:	fc                   	cld
     c40:	f3 aa                	rep stos %al,%es:(%edi)
  stosb(dst, c, n);
  return dst;
}
     c42:	8b 7d fc             	mov    -0x4(%ebp),%edi
     c45:	89 d0                	mov    %edx,%eax
     c47:	c9                   	leave
     c48:	c3                   	ret
     c49:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000c50 <strchr>:

char*
strchr(const char *s, char c)
{
     c50:	55                   	push   %ebp
     c51:	89 e5                	mov    %esp,%ebp
     c53:	8b 45 08             	mov    0x8(%ebp),%eax
     c56:	0f b6 4d 0c          	movzbl 0xc(%ebp),%ecx
  for(; *s; s++)
     c5a:	0f b6 10             	movzbl (%eax),%edx
     c5d:	84 d2                	test   %dl,%dl
     c5f:	75 12                	jne    c73 <strchr+0x23>
     c61:	eb 1d                	jmp    c80 <strchr+0x30>
     c63:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c67:	90                   	nop
     c68:	0f b6 50 01          	movzbl 0x1(%eax),%edx
     c6c:	83 c0 01             	add    $0x1,%eax
     c6f:	84 d2                	test   %dl,%dl
     c71:	74 0d                	je     c80 <strchr+0x30>
    if(*s == c)
     c73:	38 d1                	cmp    %dl,%cl
     c75:	75 f1                	jne    c68 <strchr+0x18>
      return (char*)s;
  return 0;
}
     c77:	5d                   	pop    %ebp
     c78:	c3                   	ret
     c79:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  return 0;
     c80:	31 c0                	xor    %eax,%eax
}
     c82:	5d                   	pop    %ebp
     c83:	c3                   	ret
     c84:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     c8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     c8f:	90                   	nop

00000c90 <gets>:

char*
gets(char *buf, int max)
{
     c90:	55                   	push   %ebp
     c91:	89 e5                	mov    %esp,%ebp
     c93:	57                   	push   %edi
     c94:	56                   	push   %esi
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    cc = read(0, &c, 1);
     c95:	8d 75 e7             	lea    -0x19(%ebp),%esi
{
     c98:	53                   	push   %ebx
  for(i=0; i+1 < max; ){
     c99:	31 db                	xor    %ebx,%ebx
{
     c9b:	83 ec 1c             	sub    $0x1c,%esp
  for(i=0; i+1 < max; ){
     c9e:	eb 27                	jmp    cc7 <gets+0x37>
    cc = read(0, &c, 1);
     ca0:	83 ec 04             	sub    $0x4,%esp
     ca3:	6a 01                	push   $0x1
     ca5:	56                   	push   %esi
     ca6:	6a 00                	push   $0x0
     ca8:	e8 1e 01 00 00       	call   dcb <read>
    if(cc < 1)
     cad:	83 c4 10             	add    $0x10,%esp
     cb0:	85 c0                	test   %eax,%eax
     cb2:	7e 1d                	jle    cd1 <gets+0x41>
      break;
    buf[i++] = c;
     cb4:	0f b6 45 e7          	movzbl -0x19(%ebp),%eax
     cb8:	8b 55 08             	mov    0x8(%ebp),%edx
     cbb:	88 44 1a ff          	mov    %al,-0x1(%edx,%ebx,1)
    if(c == '\n' || c == '\r')
     cbf:	3c 0a                	cmp    $0xa,%al
     cc1:	74 10                	je     cd3 <gets+0x43>
     cc3:	3c 0d                	cmp    $0xd,%al
     cc5:	74 0c                	je     cd3 <gets+0x43>
  for(i=0; i+1 < max; ){
     cc7:	89 df                	mov    %ebx,%edi
     cc9:	83 c3 01             	add    $0x1,%ebx
     ccc:	3b 5d 0c             	cmp    0xc(%ebp),%ebx
     ccf:	7c cf                	jl     ca0 <gets+0x10>
     cd1:	89 fb                	mov    %edi,%ebx
      break;
  }
  buf[i] = '\0';
     cd3:	8b 45 08             	mov    0x8(%ebp),%eax
     cd6:	c6 04 18 00          	movb   $0x0,(%eax,%ebx,1)
  return buf;
}
     cda:	8d 65 f4             	lea    -0xc(%ebp),%esp
     cdd:	5b                   	pop    %ebx
     cde:	5e                   	pop    %esi
     cdf:	5f                   	pop    %edi
     ce0:	5d                   	pop    %ebp
     ce1:	c3                   	ret
     ce2:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ce9:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi

00000cf0 <stat>:

int
stat(char *n, struct stat *st)
{
     cf0:	55                   	push   %ebp
     cf1:	89 e5                	mov    %esp,%ebp
     cf3:	56                   	push   %esi
     cf4:	53                   	push   %ebx
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     cf5:	83 ec 08             	sub    $0x8,%esp
     cf8:	6a 00                	push   $0x0
     cfa:	ff 75 08             	push   0x8(%ebp)
     cfd:	e8 f1 00 00 00       	call   df3 <open>
  if(fd < 0)
     d02:	83 c4 10             	add    $0x10,%esp
     d05:	85 c0                	test   %eax,%eax
     d07:	78 27                	js     d30 <stat+0x40>
    return -1;
  r = fstat(fd, st);
     d09:	83 ec 08             	sub    $0x8,%esp
     d0c:	ff 75 0c             	push   0xc(%ebp)
     d0f:	89 c3                	mov    %eax,%ebx
     d11:	50                   	push   %eax
     d12:	e8 f4 00 00 00       	call   e0b <fstat>
  close(fd);
     d17:	89 1c 24             	mov    %ebx,(%esp)
  r = fstat(fd, st);
     d1a:	89 c6                	mov    %eax,%esi
  close(fd);
     d1c:	e8 ba 00 00 00       	call   ddb <close>
  return r;
     d21:	83 c4 10             	add    $0x10,%esp
}
     d24:	8d 65 f8             	lea    -0x8(%ebp),%esp
     d27:	89 f0                	mov    %esi,%eax
     d29:	5b                   	pop    %ebx
     d2a:	5e                   	pop    %esi
     d2b:	5d                   	pop    %ebp
     d2c:	c3                   	ret
     d2d:	8d 76 00             	lea    0x0(%esi),%esi
    return -1;
     d30:	be ff ff ff ff       	mov    $0xffffffff,%esi
     d35:	eb ed                	jmp    d24 <stat+0x34>
     d37:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d3e:	66 90                	xchg   %ax,%ax

00000d40 <atoi>:

int
atoi(const char *s)
{
     d40:	55                   	push   %ebp
     d41:	89 e5                	mov    %esp,%ebp
     d43:	53                   	push   %ebx
     d44:	8b 55 08             	mov    0x8(%ebp),%edx
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     d47:	0f be 02             	movsbl (%edx),%eax
     d4a:	8d 48 d0             	lea    -0x30(%eax),%ecx
     d4d:	80 f9 09             	cmp    $0x9,%cl
  n = 0;
     d50:	b9 00 00 00 00       	mov    $0x0,%ecx
  while('0' <= *s && *s <= '9')
     d55:	77 1e                	ja     d75 <atoi+0x35>
     d57:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d5e:	66 90                	xchg   %ax,%ax
    n = n*10 + *s++ - '0';
     d60:	83 c2 01             	add    $0x1,%edx
     d63:	8d 0c 89             	lea    (%ecx,%ecx,4),%ecx
     d66:	8d 4c 48 d0          	lea    -0x30(%eax,%ecx,2),%ecx
  while('0' <= *s && *s <= '9')
     d6a:	0f be 02             	movsbl (%edx),%eax
     d6d:	8d 58 d0             	lea    -0x30(%eax),%ebx
     d70:	80 fb 09             	cmp    $0x9,%bl
     d73:	76 eb                	jbe    d60 <atoi+0x20>
  return n;
}
     d75:	8b 5d fc             	mov    -0x4(%ebp),%ebx
     d78:	89 c8                	mov    %ecx,%eax
     d7a:	c9                   	leave
     d7b:	c3                   	ret
     d7c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000d80 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     d80:	55                   	push   %ebp
     d81:	89 e5                	mov    %esp,%ebp
     d83:	57                   	push   %edi
     d84:	56                   	push   %esi
     d85:	8b 45 10             	mov    0x10(%ebp),%eax
     d88:	8b 55 08             	mov    0x8(%ebp),%edx
     d8b:	8b 75 0c             	mov    0xc(%ebp),%esi
  char *dst, *src;

  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     d8e:	85 c0                	test   %eax,%eax
     d90:	7e 13                	jle    da5 <memmove+0x25>
     d92:	01 d0                	add    %edx,%eax
  dst = vdst;
     d94:	89 d7                	mov    %edx,%edi
     d96:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     d9d:	8d 76 00             	lea    0x0(%esi),%esi
    *dst++ = *src++;
     da0:	a4                   	movsb  %ds:(%esi),%es:(%edi)
  while(n-- > 0)
     da1:	39 f8                	cmp    %edi,%eax
     da3:	75 fb                	jne    da0 <memmove+0x20>
  return vdst;
}
     da5:	5e                   	pop    %esi
     da6:	89 d0                	mov    %edx,%eax
     da8:	5f                   	pop    %edi
     da9:	5d                   	pop    %ebp
     daa:	c3                   	ret

00000dab <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     dab:	b8 01 00 00 00       	mov    $0x1,%eax
     db0:	cd 40                	int    $0x40
     db2:	c3                   	ret

00000db3 <exit>:
SYSCALL(exit)
     db3:	b8 02 00 00 00       	mov    $0x2,%eax
     db8:	cd 40                	int    $0x40
     dba:	c3                   	ret

00000dbb <wait>:
SYSCALL(wait)
     dbb:	b8 03 00 00 00       	mov    $0x3,%eax
     dc0:	cd 40                	int    $0x40
     dc2:	c3                   	ret

00000dc3 <pipe>:
SYSCALL(pipe)
     dc3:	b8 04 00 00 00       	mov    $0x4,%eax
     dc8:	cd 40                	int    $0x40
     dca:	c3                   	ret

00000dcb <read>:
SYSCALL(read)
     dcb:	b8 05 00 00 00       	mov    $0x5,%eax
     dd0:	cd 40                	int    $0x40
     dd2:	c3                   	ret

00000dd3 <write>:
SYSCALL(write)
     dd3:	b8 10 00 00 00       	mov    $0x10,%eax
     dd8:	cd 40                	int    $0x40
     dda:	c3                   	ret

00000ddb <close>:
SYSCALL(close)
     ddb:	b8 15 00 00 00       	mov    $0x15,%eax
     de0:	cd 40                	int    $0x40
     de2:	c3                   	ret

00000de3 <kill>:
SYSCALL(kill)
     de3:	b8 06 00 00 00       	mov    $0x6,%eax
     de8:	cd 40                	int    $0x40
     dea:	c3                   	ret

00000deb <exec>:
SYSCALL(exec)
     deb:	b8 07 00 00 00       	mov    $0x7,%eax
     df0:	cd 40                	int    $0x40
     df2:	c3                   	ret

00000df3 <open>:
SYSCALL(open)
     df3:	b8 0f 00 00 00       	mov    $0xf,%eax
     df8:	cd 40                	int    $0x40
     dfa:	c3                   	ret

00000dfb <mknod>:
SYSCALL(mknod)
     dfb:	b8 11 00 00 00       	mov    $0x11,%eax
     e00:	cd 40                	int    $0x40
     e02:	c3                   	ret

00000e03 <unlink>:
SYSCALL(unlink)
     e03:	b8 12 00 00 00       	mov    $0x12,%eax
     e08:	cd 40                	int    $0x40
     e0a:	c3                   	ret

00000e0b <fstat>:
SYSCALL(fstat)
     e0b:	b8 08 00 00 00       	mov    $0x8,%eax
     e10:	cd 40                	int    $0x40
     e12:	c3                   	ret

00000e13 <link>:
SYSCALL(link)
     e13:	b8 13 00 00 00       	mov    $0x13,%eax
     e18:	cd 40                	int    $0x40
     e1a:	c3                   	ret

00000e1b <mkdir>:
SYSCALL(mkdir)
     e1b:	b8 14 00 00 00       	mov    $0x14,%eax
     e20:	cd 40                	int    $0x40
     e22:	c3                   	ret

00000e23 <chdir>:
SYSCALL(chdir)
     e23:	b8 09 00 00 00       	mov    $0x9,%eax
     e28:	cd 40                	int    $0x40
     e2a:	c3                   	ret

00000e2b <dup>:
SYSCALL(dup)
     e2b:	b8 0a 00 00 00       	mov    $0xa,%eax
     e30:	cd 40                	int    $0x40
     e32:	c3                   	ret

00000e33 <getpid>:
SYSCALL(getpid)
     e33:	b8 0b 00 00 00       	mov    $0xb,%eax
     e38:	cd 40                	int    $0x40
     e3a:	c3                   	ret

00000e3b <sbrk>:
SYSCALL(sbrk)
     e3b:	b8 0c 00 00 00       	mov    $0xc,%eax
     e40:	cd 40                	int    $0x40
     e42:	c3                   	ret

00000e43 <sleep>:
SYSCALL(sleep)
     e43:	b8 0d 00 00 00       	mov    $0xd,%eax
     e48:	cd 40                	int    $0x40
     e4a:	c3                   	ret

00000e4b <uptime>:
SYSCALL(uptime)
     e4b:	b8 0e 00 00 00       	mov    $0xe,%eax
     e50:	cd 40                	int    $0x40
     e52:	c3                   	ret

00000e53 <shutdown>:
SYSCALL(shutdown)
     e53:	b8 16 00 00 00       	mov    $0x16,%eax
     e58:	cd 40                	int    $0x40
     e5a:	c3                   	ret

00000e5b <cps>:
SYSCALL(cps)
     e5b:	b8 17 00 00 00       	mov    $0x17,%eax
     e60:	cd 40                	int    $0x40
     e62:	c3                   	ret

00000e63 <chpr>:
SYSCALL(chpr)
     e63:	b8 18 00 00 00       	mov    $0x18,%eax
     e68:	cd 40                	int    $0x40
     e6a:	c3                   	ret
     e6b:	66 90                	xchg   %ax,%ax
     e6d:	66 90                	xchg   %ax,%ax
     e6f:	90                   	nop

00000e70 <printint>:
  write(fd, &c, 1);
}

static void
printint(int fd, int xx, int base, int sgn)
{
     e70:	55                   	push   %ebp
     e71:	89 e5                	mov    %esp,%ebp
     e73:	57                   	push   %edi
     e74:	56                   	push   %esi
     e75:	53                   	push   %ebx
     e76:	89 cb                	mov    %ecx,%ebx
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    neg = 1;
    x = -xx;
     e78:	89 d1                	mov    %edx,%ecx
{
     e7a:	83 ec 3c             	sub    $0x3c,%esp
     e7d:	89 45 c0             	mov    %eax,-0x40(%ebp)
  if(sgn && xx < 0){
     e80:	85 d2                	test   %edx,%edx
     e82:	0f 89 80 00 00 00    	jns    f08 <printint+0x98>
     e88:	f6 45 08 01          	testb  $0x1,0x8(%ebp)
     e8c:	74 7a                	je     f08 <printint+0x98>
    x = -xx;
     e8e:	f7 d9                	neg    %ecx
    neg = 1;
     e90:	b8 01 00 00 00       	mov    $0x1,%eax
  } else {
    x = xx;
  }

  i = 0;
     e95:	89 45 c4             	mov    %eax,-0x3c(%ebp)
     e98:	31 f6                	xor    %esi,%esi
     e9a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  do{
    buf[i++] = digits[x % base];
     ea0:	89 c8                	mov    %ecx,%eax
     ea2:	31 d2                	xor    %edx,%edx
     ea4:	89 f7                	mov    %esi,%edi
     ea6:	f7 f3                	div    %ebx
     ea8:	8d 76 01             	lea    0x1(%esi),%esi
     eab:	0f b6 92 f4 13 00 00 	movzbl 0x13f4(%edx),%edx
     eb2:	88 54 35 d7          	mov    %dl,-0x29(%ebp,%esi,1)
  }while((x /= base) != 0);
     eb6:	89 ca                	mov    %ecx,%edx
     eb8:	89 c1                	mov    %eax,%ecx
     eba:	39 da                	cmp    %ebx,%edx
     ebc:	73 e2                	jae    ea0 <printint+0x30>
  if(neg)
     ebe:	8b 45 c4             	mov    -0x3c(%ebp),%eax
     ec1:	85 c0                	test   %eax,%eax
     ec3:	74 07                	je     ecc <printint+0x5c>
    buf[i++] = '-';
     ec5:	c6 44 35 d8 2d       	movb   $0x2d,-0x28(%ebp,%esi,1)
    buf[i++] = digits[x % base];
     eca:	89 f7                	mov    %esi,%edi
     ecc:	8d 5d d8             	lea    -0x28(%ebp),%ebx
     ecf:	8b 75 c0             	mov    -0x40(%ebp),%esi
     ed2:	01 df                	add    %ebx,%edi
     ed4:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

  while(--i >= 0)
    putc(fd, buf[i]);
     ed8:	0f b6 07             	movzbl (%edi),%eax
  write(fd, &c, 1);
     edb:	83 ec 04             	sub    $0x4,%esp
     ede:	88 45 d7             	mov    %al,-0x29(%ebp)
     ee1:	8d 45 d7             	lea    -0x29(%ebp),%eax
     ee4:	6a 01                	push   $0x1
     ee6:	50                   	push   %eax
     ee7:	56                   	push   %esi
     ee8:	e8 e6 fe ff ff       	call   dd3 <write>
  while(--i >= 0)
     eed:	89 f8                	mov    %edi,%eax
     eef:	83 c4 10             	add    $0x10,%esp
     ef2:	83 ef 01             	sub    $0x1,%edi
     ef5:	39 d8                	cmp    %ebx,%eax
     ef7:	75 df                	jne    ed8 <printint+0x68>
}
     ef9:	8d 65 f4             	lea    -0xc(%ebp),%esp
     efc:	5b                   	pop    %ebx
     efd:	5e                   	pop    %esi
     efe:	5f                   	pop    %edi
     eff:	5d                   	pop    %ebp
     f00:	c3                   	ret
     f01:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
  neg = 0;
     f08:	31 c0                	xor    %eax,%eax
     f0a:	eb 89                	jmp    e95 <printint+0x25>
     f0c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi

00000f10 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     f10:	55                   	push   %ebp
     f11:	89 e5                	mov    %esp,%ebp
     f13:	57                   	push   %edi
     f14:	56                   	push   %esi
     f15:	53                   	push   %ebx
     f16:	83 ec 2c             	sub    $0x2c,%esp
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     f19:	8b 75 0c             	mov    0xc(%ebp),%esi
{
     f1c:	8b 7d 08             	mov    0x8(%ebp),%edi
  for(i = 0; fmt[i]; i++){
     f1f:	0f b6 1e             	movzbl (%esi),%ebx
     f22:	83 c6 01             	add    $0x1,%esi
     f25:	84 db                	test   %bl,%bl
     f27:	74 67                	je     f90 <printf+0x80>
     f29:	8d 4d 10             	lea    0x10(%ebp),%ecx
     f2c:	31 d2                	xor    %edx,%edx
     f2e:	89 4d d0             	mov    %ecx,-0x30(%ebp)
     f31:	eb 34                	jmp    f67 <printf+0x57>
     f33:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f37:	90                   	nop
     f38:	89 55 d4             	mov    %edx,-0x2c(%ebp)
    c = fmt[i] & 0xff;
    if(state == 0){
      if(c == '%'){
        state = '%';
     f3b:	ba 25 00 00 00       	mov    $0x25,%edx
      if(c == '%'){
     f40:	83 f8 25             	cmp    $0x25,%eax
     f43:	74 18                	je     f5d <printf+0x4d>
  write(fd, &c, 1);
     f45:	83 ec 04             	sub    $0x4,%esp
     f48:	8d 45 e7             	lea    -0x19(%ebp),%eax
     f4b:	88 5d e7             	mov    %bl,-0x19(%ebp)
     f4e:	6a 01                	push   $0x1
     f50:	50                   	push   %eax
     f51:	57                   	push   %edi
     f52:	e8 7c fe ff ff       	call   dd3 <write>
     f57:	8b 55 d4             	mov    -0x2c(%ebp),%edx
      } else {
        putc(fd, c);
     f5a:	83 c4 10             	add    $0x10,%esp
  for(i = 0; fmt[i]; i++){
     f5d:	0f b6 1e             	movzbl (%esi),%ebx
     f60:	83 c6 01             	add    $0x1,%esi
     f63:	84 db                	test   %bl,%bl
     f65:	74 29                	je     f90 <printf+0x80>
    c = fmt[i] & 0xff;
     f67:	0f b6 c3             	movzbl %bl,%eax
    if(state == 0){
     f6a:	85 d2                	test   %edx,%edx
     f6c:	74 ca                	je     f38 <printf+0x28>
      }
    } else if(state == '%'){
     f6e:	83 fa 25             	cmp    $0x25,%edx
     f71:	75 ea                	jne    f5d <printf+0x4d>
      if(c == 'd'){
     f73:	83 f8 25             	cmp    $0x25,%eax
     f76:	0f 84 24 01 00 00    	je     10a0 <printf+0x190>
     f7c:	83 e8 63             	sub    $0x63,%eax
     f7f:	83 f8 15             	cmp    $0x15,%eax
     f82:	77 1c                	ja     fa0 <printf+0x90>
     f84:	ff 24 85 9c 13 00 00 	jmp    *0x139c(,%eax,4)
     f8b:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
     f8f:	90                   	nop
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     f90:	8d 65 f4             	lea    -0xc(%ebp),%esp
     f93:	5b                   	pop    %ebx
     f94:	5e                   	pop    %esi
     f95:	5f                   	pop    %edi
     f96:	5d                   	pop    %ebp
     f97:	c3                   	ret
     f98:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     f9f:	90                   	nop
  write(fd, &c, 1);
     fa0:	83 ec 04             	sub    $0x4,%esp
     fa3:	8d 55 e7             	lea    -0x19(%ebp),%edx
     fa6:	c6 45 e7 25          	movb   $0x25,-0x19(%ebp)
     faa:	6a 01                	push   $0x1
     fac:	52                   	push   %edx
     fad:	89 55 d4             	mov    %edx,-0x2c(%ebp)
     fb0:	57                   	push   %edi
     fb1:	e8 1d fe ff ff       	call   dd3 <write>
     fb6:	83 c4 0c             	add    $0xc,%esp
     fb9:	88 5d e7             	mov    %bl,-0x19(%ebp)
     fbc:	6a 01                	push   $0x1
     fbe:	8b 55 d4             	mov    -0x2c(%ebp),%edx
     fc1:	52                   	push   %edx
     fc2:	57                   	push   %edi
     fc3:	e8 0b fe ff ff       	call   dd3 <write>
        putc(fd, c);
     fc8:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fcb:	31 d2                	xor    %edx,%edx
     fcd:	eb 8e                	jmp    f5d <printf+0x4d>
     fcf:	90                   	nop
        printint(fd, *ap, 16, 0);
     fd0:	8b 5d d0             	mov    -0x30(%ebp),%ebx
     fd3:	83 ec 0c             	sub    $0xc,%esp
     fd6:	b9 10 00 00 00       	mov    $0x10,%ecx
     fdb:	8b 13                	mov    (%ebx),%edx
     fdd:	6a 00                	push   $0x0
     fdf:	89 f8                	mov    %edi,%eax
        ap++;
     fe1:	83 c3 04             	add    $0x4,%ebx
        printint(fd, *ap, 16, 0);
     fe4:	e8 87 fe ff ff       	call   e70 <printint>
        ap++;
     fe9:	89 5d d0             	mov    %ebx,-0x30(%ebp)
     fec:	83 c4 10             	add    $0x10,%esp
      state = 0;
     fef:	31 d2                	xor    %edx,%edx
     ff1:	e9 67 ff ff ff       	jmp    f5d <printf+0x4d>
     ff6:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
     ffd:	8d 76 00             	lea    0x0(%esi),%esi
        s = (char*)*ap;
    1000:	8b 45 d0             	mov    -0x30(%ebp),%eax
    1003:	8b 18                	mov    (%eax),%ebx
        ap++;
    1005:	83 c0 04             	add    $0x4,%eax
    1008:	89 45 d0             	mov    %eax,-0x30(%ebp)
        if(s == 0)
    100b:	85 db                	test   %ebx,%ebx
    100d:	0f 84 9d 00 00 00    	je     10b0 <printf+0x1a0>
        while(*s != 0){
    1013:	0f b6 03             	movzbl (%ebx),%eax
      state = 0;
    1016:	31 d2                	xor    %edx,%edx
        while(*s != 0){
    1018:	84 c0                	test   %al,%al
    101a:	0f 84 3d ff ff ff    	je     f5d <printf+0x4d>
    1020:	8d 55 e7             	lea    -0x19(%ebp),%edx
    1023:	89 75 d4             	mov    %esi,-0x2c(%ebp)
    1026:	89 de                	mov    %ebx,%esi
    1028:	89 d3                	mov    %edx,%ebx
    102a:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
  write(fd, &c, 1);
    1030:	83 ec 04             	sub    $0x4,%esp
    1033:	88 45 e7             	mov    %al,-0x19(%ebp)
          s++;
    1036:	83 c6 01             	add    $0x1,%esi
  write(fd, &c, 1);
    1039:	6a 01                	push   $0x1
    103b:	53                   	push   %ebx
    103c:	57                   	push   %edi
    103d:	e8 91 fd ff ff       	call   dd3 <write>
        while(*s != 0){
    1042:	0f b6 06             	movzbl (%esi),%eax
    1045:	83 c4 10             	add    $0x10,%esp
    1048:	84 c0                	test   %al,%al
    104a:	75 e4                	jne    1030 <printf+0x120>
      state = 0;
    104c:	8b 75 d4             	mov    -0x2c(%ebp),%esi
    104f:	31 d2                	xor    %edx,%edx
    1051:	e9 07 ff ff ff       	jmp    f5d <printf+0x4d>
    1056:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    105d:	8d 76 00             	lea    0x0(%esi),%esi
        printint(fd, *ap, 10, 1);
    1060:	8b 5d d0             	mov    -0x30(%ebp),%ebx
    1063:	83 ec 0c             	sub    $0xc,%esp
    1066:	b9 0a 00 00 00       	mov    $0xa,%ecx
    106b:	8b 13                	mov    (%ebx),%edx
    106d:	6a 01                	push   $0x1
    106f:	e9 6b ff ff ff       	jmp    fdf <printf+0xcf>
    1074:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
        putc(fd, *ap);
    1078:	8b 5d d0             	mov    -0x30(%ebp),%ebx
  write(fd, &c, 1);
    107b:	83 ec 04             	sub    $0x4,%esp
    107e:	8d 55 e7             	lea    -0x19(%ebp),%edx
        putc(fd, *ap);
    1081:	8b 03                	mov    (%ebx),%eax
        ap++;
    1083:	83 c3 04             	add    $0x4,%ebx
        putc(fd, *ap);
    1086:	88 45 e7             	mov    %al,-0x19(%ebp)
  write(fd, &c, 1);
    1089:	6a 01                	push   $0x1
    108b:	52                   	push   %edx
    108c:	57                   	push   %edi
    108d:	e8 41 fd ff ff       	call   dd3 <write>
        ap++;
    1092:	89 5d d0             	mov    %ebx,-0x30(%ebp)
    1095:	83 c4 10             	add    $0x10,%esp
      state = 0;
    1098:	31 d2                	xor    %edx,%edx
    109a:	e9 be fe ff ff       	jmp    f5d <printf+0x4d>
    109f:	90                   	nop
  write(fd, &c, 1);
    10a0:	83 ec 04             	sub    $0x4,%esp
    10a3:	88 5d e7             	mov    %bl,-0x19(%ebp)
    10a6:	8d 55 e7             	lea    -0x19(%ebp),%edx
    10a9:	6a 01                	push   $0x1
    10ab:	e9 11 ff ff ff       	jmp    fc1 <printf+0xb1>
    10b0:	b8 28 00 00 00       	mov    $0x28,%eax
          s = "(null)";
    10b5:	bb 94 13 00 00       	mov    $0x1394,%ebx
    10ba:	e9 61 ff ff ff       	jmp    1020 <printf+0x110>
    10bf:	90                   	nop

000010c0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    10c0:	55                   	push   %ebp
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10c1:	a1 24 1a 00 00       	mov    0x1a24,%eax
{
    10c6:	89 e5                	mov    %esp,%ebp
    10c8:	57                   	push   %edi
    10c9:	56                   	push   %esi
    10ca:	53                   	push   %ebx
    10cb:	8b 5d 08             	mov    0x8(%ebp),%ebx
  bp = (Header*)ap - 1;
    10ce:	8d 4b f8             	lea    -0x8(%ebx),%ecx
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10d1:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    10d8:	89 c2                	mov    %eax,%edx
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10da:	8b 00                	mov    (%eax),%eax
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    10dc:	39 ca                	cmp    %ecx,%edx
    10de:	73 30                	jae    1110 <free+0x50>
    10e0:	39 c1                	cmp    %eax,%ecx
    10e2:	72 04                	jb     10e8 <free+0x28>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    10e4:	39 c2                	cmp    %eax,%edx
    10e6:	72 f0                	jb     10d8 <free+0x18>
      break;
  if(bp + bp->s.size == p->s.ptr){
    10e8:	8b 73 fc             	mov    -0x4(%ebx),%esi
    10eb:	8d 3c f1             	lea    (%ecx,%esi,8),%edi
    10ee:	39 f8                	cmp    %edi,%eax
    10f0:	74 2e                	je     1120 <free+0x60>
    bp->s.size += p->s.ptr->s.size;
    bp->s.ptr = p->s.ptr->s.ptr;
    10f2:	89 43 f8             	mov    %eax,-0x8(%ebx)
  } else
    bp->s.ptr = p->s.ptr;
  if(p + p->s.size == bp){
    10f5:	8b 42 04             	mov    0x4(%edx),%eax
    10f8:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    10fb:	39 f1                	cmp    %esi,%ecx
    10fd:	74 38                	je     1137 <free+0x77>
    p->s.size += bp->s.size;
    p->s.ptr = bp->s.ptr;
    10ff:	89 0a                	mov    %ecx,(%edx)
  } else
    p->s.ptr = bp;
  freep = p;
}
    1101:	5b                   	pop    %ebx
  freep = p;
    1102:	89 15 24 1a 00 00    	mov    %edx,0x1a24
}
    1108:	5e                   	pop    %esi
    1109:	5f                   	pop    %edi
    110a:	5d                   	pop    %ebp
    110b:	c3                   	ret
    110c:	8d 74 26 00          	lea    0x0(%esi,%eiz,1),%esi
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    1110:	39 c1                	cmp    %eax,%ecx
    1112:	72 d0                	jb     10e4 <free+0x24>
    1114:	eb c2                	jmp    10d8 <free+0x18>
    1116:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    111d:	8d 76 00             	lea    0x0(%esi),%esi
    bp->s.size += p->s.ptr->s.size;
    1120:	03 70 04             	add    0x4(%eax),%esi
    1123:	89 73 fc             	mov    %esi,-0x4(%ebx)
    bp->s.ptr = p->s.ptr->s.ptr;
    1126:	8b 02                	mov    (%edx),%eax
    1128:	8b 00                	mov    (%eax),%eax
    112a:	89 43 f8             	mov    %eax,-0x8(%ebx)
  if(p + p->s.size == bp){
    112d:	8b 42 04             	mov    0x4(%edx),%eax
    1130:	8d 34 c2             	lea    (%edx,%eax,8),%esi
    1133:	39 f1                	cmp    %esi,%ecx
    1135:	75 c8                	jne    10ff <free+0x3f>
    p->s.size += bp->s.size;
    1137:	03 43 fc             	add    -0x4(%ebx),%eax
  freep = p;
    113a:	89 15 24 1a 00 00    	mov    %edx,0x1a24
    p->s.size += bp->s.size;
    1140:	89 42 04             	mov    %eax,0x4(%edx)
    p->s.ptr = bp->s.ptr;
    1143:	8b 4b f8             	mov    -0x8(%ebx),%ecx
    1146:	89 0a                	mov    %ecx,(%edx)
}
    1148:	5b                   	pop    %ebx
    1149:	5e                   	pop    %esi
    114a:	5f                   	pop    %edi
    114b:	5d                   	pop    %ebp
    114c:	c3                   	ret
    114d:	8d 76 00             	lea    0x0(%esi),%esi

00001150 <malloc>:
  return freep;
}

void*
malloc(uint nbytes)
{
    1150:	55                   	push   %ebp
    1151:	89 e5                	mov    %esp,%ebp
    1153:	57                   	push   %edi
    1154:	56                   	push   %esi
    1155:	53                   	push   %ebx
    1156:	83 ec 0c             	sub    $0xc,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1159:	8b 45 08             	mov    0x8(%ebp),%eax
  if((prevp = freep) == 0){
    115c:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    1162:	8d 78 07             	lea    0x7(%eax),%edi
    1165:	c1 ef 03             	shr    $0x3,%edi
    1168:	83 c7 01             	add    $0x1,%edi
  if((prevp = freep) == 0){
    116b:	85 d2                	test   %edx,%edx
    116d:	0f 84 8d 00 00 00    	je     1200 <malloc+0xb0>
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1173:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1175:	8b 48 04             	mov    0x4(%eax),%ecx
    1178:	39 f9                	cmp    %edi,%ecx
    117a:	73 64                	jae    11e0 <malloc+0x90>
  if(nu < 4096)
    117c:	bb 00 10 00 00       	mov    $0x1000,%ebx
    1181:	39 df                	cmp    %ebx,%edi
    1183:	0f 43 df             	cmovae %edi,%ebx
  p = sbrk(nu * sizeof(Header));
    1186:	8d 34 dd 00 00 00 00 	lea    0x0(,%ebx,8),%esi
    118d:	eb 0a                	jmp    1199 <malloc+0x49>
    118f:	90                   	nop
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    1190:	8b 02                	mov    (%edx),%eax
    if(p->s.size >= nunits){
    1192:	8b 48 04             	mov    0x4(%eax),%ecx
    1195:	39 f9                	cmp    %edi,%ecx
    1197:	73 47                	jae    11e0 <malloc+0x90>
        p->s.size = nunits;
      }
      freep = prevp;
      return (void*)(p + 1);
    }
    if(p == freep)
    1199:	89 c2                	mov    %eax,%edx
    119b:	39 05 24 1a 00 00    	cmp    %eax,0x1a24
    11a1:	75 ed                	jne    1190 <malloc+0x40>
  p = sbrk(nu * sizeof(Header));
    11a3:	83 ec 0c             	sub    $0xc,%esp
    11a6:	56                   	push   %esi
    11a7:	e8 8f fc ff ff       	call   e3b <sbrk>
  if(p == (char*)-1)
    11ac:	83 c4 10             	add    $0x10,%esp
    11af:	83 f8 ff             	cmp    $0xffffffff,%eax
    11b2:	74 1c                	je     11d0 <malloc+0x80>
  hp->s.size = nu;
    11b4:	89 58 04             	mov    %ebx,0x4(%eax)
  free((void*)(hp + 1));
    11b7:	83 ec 0c             	sub    $0xc,%esp
    11ba:	83 c0 08             	add    $0x8,%eax
    11bd:	50                   	push   %eax
    11be:	e8 fd fe ff ff       	call   10c0 <free>
  return freep;
    11c3:	8b 15 24 1a 00 00    	mov    0x1a24,%edx
      if((p = morecore(nunits)) == 0)
    11c9:	83 c4 10             	add    $0x10,%esp
    11cc:	85 d2                	test   %edx,%edx
    11ce:	75 c0                	jne    1190 <malloc+0x40>
        return 0;
  }
}
    11d0:	8d 65 f4             	lea    -0xc(%ebp),%esp
        return 0;
    11d3:	31 c0                	xor    %eax,%eax
}
    11d5:	5b                   	pop    %ebx
    11d6:	5e                   	pop    %esi
    11d7:	5f                   	pop    %edi
    11d8:	5d                   	pop    %ebp
    11d9:	c3                   	ret
    11da:	8d b6 00 00 00 00    	lea    0x0(%esi),%esi
      if(p->s.size == nunits)
    11e0:	39 cf                	cmp    %ecx,%edi
    11e2:	74 4c                	je     1230 <malloc+0xe0>
        p->s.size -= nunits;
    11e4:	29 f9                	sub    %edi,%ecx
    11e6:	89 48 04             	mov    %ecx,0x4(%eax)
        p += p->s.size;
    11e9:	8d 04 c8             	lea    (%eax,%ecx,8),%eax
        p->s.size = nunits;
    11ec:	89 78 04             	mov    %edi,0x4(%eax)
      freep = prevp;
    11ef:	89 15 24 1a 00 00    	mov    %edx,0x1a24
}
    11f5:	8d 65 f4             	lea    -0xc(%ebp),%esp
      return (void*)(p + 1);
    11f8:	83 c0 08             	add    $0x8,%eax
}
    11fb:	5b                   	pop    %ebx
    11fc:	5e                   	pop    %esi
    11fd:	5f                   	pop    %edi
    11fe:	5d                   	pop    %ebp
    11ff:	c3                   	ret
    base.s.ptr = freep = prevp = &base;
    1200:	c7 05 24 1a 00 00 28 	movl   $0x1a28,0x1a24
    1207:	1a 00 00 
    base.s.size = 0;
    120a:	b8 28 1a 00 00       	mov    $0x1a28,%eax
    base.s.ptr = freep = prevp = &base;
    120f:	c7 05 28 1a 00 00 28 	movl   $0x1a28,0x1a28
    1216:	1a 00 00 
    base.s.size = 0;
    1219:	c7 05 2c 1a 00 00 00 	movl   $0x0,0x1a2c
    1220:	00 00 00 
    if(p->s.size >= nunits){
    1223:	e9 54 ff ff ff       	jmp    117c <malloc+0x2c>
    1228:	8d b4 26 00 00 00 00 	lea    0x0(%esi,%eiz,1),%esi
    122f:	90                   	nop
        prevp->s.ptr = p->s.ptr;
    1230:	8b 08                	mov    (%eax),%ecx
    1232:	89 0a                	mov    %ecx,(%edx)
    1234:	eb b9                	jmp    11ef <malloc+0x9f>
