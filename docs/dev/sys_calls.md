# System calls

## sys_read: `0`
[comment]: # "description goes here"
* unsigned int fd
* char *buf
* size_t count

## sys_write: `1`
[comment]: # "description goes here"
* unsigned int fd
* const char *buf
* size_t count

## sys_open: `2`
[comment]: # "description goes here"
* const char *filename
* int flags
* int mode

## sys_close: `3`
[comment]: # "description goes here"
* unsigned int fd

## sys_stat: `4`
[comment]: # "description goes here"
* const char *filename
* struct stat *statbuf

## sys_fstat: `5`
[comment]: # "description goes here"
* unsigned int fd
* struct stat *statbuf

## sys_lstat: `6`
[comment]: # "description goes here"
* fconst char *filename
* struct stat *statbuf

## sys_poll: `7`
[comment]: # "description goes here"
* struct poll_fd *ufds
* unsigned int nfds
* long timeout_msecs

## sys_lseek: `8`
[comment]: # "description goes here"
* unsigned int fd
* off_t offset
* unsigned int origin

## sys_mmap: `9`
[comment]: # "description goes here"
* unsigned long addr
* unsigned long len
* unsigned long prot
* unsigned long flags
* unsigned long fd
* unsigned long off

## sys_mprotect: `10`
[comment]: # "description goes here"
* unsigned long start
* size_t len
* unsigned long prot

## sys_munmap: `11`
[comment]: # "description goes here"
* unsigned long addr
* size_t len

## sys_brk: `12`
[comment]: # "description goes here"
* unsigned long brk

## sys_rt_sigaction: `13`
[comment]: # "description goes here"
* int sig
* const struct sigaction *act
* struct sigaction *oact
* size_t sigsetsize

## sys_rt_sigprocmask: `14`
[comment]: # "description goes here"
* int how
* sigset_t *nset
* sigset_t *oset
* size_t sigsetsize

## sys_rt_sigreturn: `15`
[comment]: # "description goes here"
* unsigned long __unused

## sys_ioctl: `16`
[comment]: # "description goes here"
* unsigned int fd
* unsigned int cmd
* unsigned long arg

## sys_pread64: `17`
[comment]: # "description goes here"
* unsigned long fd
* char *buf
* size_t count
* loff_t pos

## sys_pwrite64: `18`
[comment]: # "description goes here"
* unsigned int fd
* const char *buf
* size_t count
* loff_t pos

## sys_readv: `19`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec *vec
* unsigned long vlen

## sys_writev: `20`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec *vec
* unsigned long vlen

## sys_access: `21`
[comment]: # "description goes here"
* const char *filename
* int mode

## sys_pipe: `22`
[comment]: # "description goes here"
* int *filedes

## sys_select: `23`
[comment]: # "description goes here"
* int n
* fd_set *inp
* fd_set *outp
* fd_set*exp
* struct timeval *tvp

## sys_sched_yield: `24`
[comment]: # "description goes here"

## sys_mremap: `25`
[comment]: # "description goes here"
* unsigned long addr
* unsigned long old_len
* unsigned long new_len
* unsigned long flags
* unsigned long new_addr

## sys_msync: `26`
[comment]: # "description goes here"
* unsigned long start
* size_t len
* int flags

## sys_mincore: `27`
[comment]: # "description goes here"
* unsigned long start
* size_t len
* unsigned char *vec

## sys_madvise: `28`
[comment]: # "description goes here"
* unsigned long start
* size_t len_in
* int behavior

## sys_shmget: `29`
[comment]: # "description goes here"
* key_t key
* size_t size
* int shmflg

## sys_shmat: `30`
[comment]: # "description goes here"
* int shmid
* char *shmaddr
* int shmflg

## sys_shmctl: `31`
[comment]: # "description goes here"
* int shmid
* int cmd
* struct shmid_ds *buf

## sys_dup: `32`
[comment]: # "description goes here"
* unsigned int fildes

## sys_dup2: `33`
[comment]: # "description goes here"
* unsigned int oldfd
* unsigned int newfd

## sys_pause: `34`
[comment]: # "description goes here"

## sys_nanosleep: `35`
[comment]: # "description goes here"
* struct timespec *rqtp
* struct timespec *rmtp

## sys_getitimer: `36`
[comment]: # "description goes here"
* int which
* struct itimerval *value

## sys_alarm: `37`
[comment]: # "description goes here"
* unsigned int seconds

## sys_setitimer: `38`
[comment]: # "description goes here"
* int which
* struct itimerval *value
* struct itimerval *ovalue

## sys_getpid: `39`
[comment]: # "description goes here"

## sys_sendfile: `40`
[comment]: # "description goes here"
* int out_fd
* int in_fd
* off_t *offset
* size_t count

## sys_socket: `41`
[comment]: # "description goes here"
* int family
* int type
* int protocol

## sys_connect: `42`
[comment]: # "description goes here"
* int fd
* struct sockaddr *uservaddr
* int addrlen

## sys_accept: `43`
[comment]: # "description goes here"
* int fd
* struct sockaddr *upeer_sockaddr
* int *upeer_addrlen

## sys_sendto: `44`
[comment]: # "description goes here"
* int fd
* void *buff
* size_t len
* unsigned flags
* struct sockaddr *addr
* int addr_len

## sys_recvfrom: `45`
[comment]: # "description goes here"
* int fd
* void *ubuf
* size_t size
* unsigned flags
* struct sockaddr *addr
* int *addr_len

## sys_sendmsg: `46`
[comment]: # "description goes here"
* int fd
* struct msghdr *msg
* unsigned flags

## sys_recvmsg: `47`
[comment]: # "description goes here"
* int fd
* struct msghdr *msg
* unsigned int flags

## sys_shutdown: `48`
[comment]: # "description goes here"
* int fd
* int how

## sys_bind: `49`
[comment]: # "description goes here"
* int fd
* struct sokaddr *umyaddr
* int addrlen

## sys_listen: `50`
[comment]: # "description goes here"
* int fd
* int backlog

## sys_getsockname: `51`
[comment]: # "description goes here"
* int fd
* struct sockaddr *usockaddr
* int *usockaddr_len

## sys_getpeername: `52`
[comment]: # "description goes here"
* int fd
* struct sockaddr *usockaddr
* int *usockaddr_len

## sys_socketpair: `53`
[comment]: # "description goes here"
* int family
* int type
* int protocol
* int *usockvec

## sys_setsockopt: `54`
[comment]: # "description goes here"
* int fd
* int level
* int optname
* char *optval
* int optlen

## sys_getsockopt: `55`
[comment]: # "description goes here"
* int fd
* int level
* int optname
* char *optval
* int *optlen

## sys_clone: `56`
[comment]: # "description goes here"
* unsigned long clone_flags
* unsigned long newsp
* void *parent_tid
* void *child_tid
* unsigned int tid

## sys_fork: `57`
[comment]: # "description goes here"

## sys_vfork: `58`
[comment]: # "description goes here"

## sys_execve: `59`
[comment]: # "description goes here"
* const char *filename
* const char *const argv[]
* const char *const envp[]

## sys_exit: `60`
[comment]: # "description goes here"
* int error_code

## sys_wait4: `61`
[comment]: # "description goes here"
* pid_t upid
* int *stat_addr
* int options
* struct rusage *ru

## sys_kill: `62`
[comment]: # "description goes here"
* pid_t pid
* int sig

## sys_uname: `63`
[comment]: # "description goes here"
* struct old_utsname *name

## sys_semget: `64`
[comment]: # "description goes here"
* key_t key
* int nsems
* int semflg

## sys_semop: `65`
[comment]: # "description goes here"
* int semid
* struct sembuf *tsops
* unsigned nsops

## sys_semctl: `66`
[comment]: # "description goes here"
* int semid
* int semnum
* int cmd
* union semun arg

## sys_shmdt: `67`
[comment]: # "description goes here"
* char *shmaddr

## sys_msgget: `68`
[comment]: # "description goes here"
* key_t key
* int msgflg

## sys_msgsnd: `69`
[comment]: # "description goes here"
* int msqid
* struct msgbuf *msgp
* size_t msgsz
* int msgflg

## sys_msgrcv: `70`
[comment]: # "description goes here"
* int msqid
* struct msgbuf *msgp
* size_t msgsz
* long msgtyp
* int msgflg

## sys_msgctl: `71`
[comment]: # "description goes here"
* int msqid
* int cmd
* struct msqid_ds *buf

## sys_fcntl: `72`
[comment]: # "description goes here"
* unsigned int fd
* unsigned int cmd
* unsigned long arg

## sys_flock: `73`
[comment]: # "description goes here"
* unsigned int fd
* unsigned int cmd

## sys_fsync: `74`
[comment]: # "description goes here"
* unsigned int fd

## sys_fdatasync: `75`
[comment]: # "description goes here"
* unsigned int fd

## sys_truncate: `76`
[comment]: # "description goes here"
* const char *path
* long length

## sys_ftruncate: `77`
[comment]: # "description goes here"
* unsigned int fd
* unsigned long length

## sys_getdents: `78`
[comment]: # "description goes here"
* unsigned int fd
* struct linux_dirent *dirent
* unsigned int count

## sys_getcwd: `79`
[comment]: # "description goes here"
* char *buf
* unsigned long size

## sys_chdir: `80`
[comment]: # "description goes here"
* const char *filename

## sys_fchdir: `81`
[comment]: # "description goes here"
* unsigned int fd

## sys_rename: `82`
[comment]: # "description goes here"
* const char *oldname
* const char *newname

## sys_mkdir: `83`
[comment]: # "description goes here"
* const char *pathname
* int mode

## sys_rmdir: `84`
[comment]: # "description goes here"
* const char *pathname

## sys_creat: `85`
[comment]: # "description goes here"
* const char *pathname
* int mode

## sys_link: `86`
[comment]: # "description goes here"
* const char *oldname
* const char *newname

## sys_unlink: `87`
[comment]: # "description goes here"
* const char *pathname

## sys_symlink: `88`
[comment]: # "description goes here"
* const char *oldname
* const char *newname

## sys_readlink: `89`
[comment]: # "description goes here"
* const char *path
* char *buf
* int bufsiz

## sys_chmod: `90`
[comment]: # "description goes here"
* const char *filename
* mode_t mode

## sys_fchmod: `91`
[comment]: # "description goes here"
* unsigned int fd
* mode_t mode

## sys_chown: `92`
[comment]: # "description goes here"
* const char *filename
* uid_t user
* gid_t group

## sys_fchown: `93`
[comment]: # "description goes here"
* unsigned int fd
* uid_t user
* gid_t group

## sys_lchown: `94`
[comment]: # "description goes here"
* const char *filename
* uid_t user
* gid_t group

## sys_umask: `95`
[comment]: # "description goes here"
* int mask

## sys_gettimeofday: `96`
[comment]: # "description goes here"
* struct timeval *tv
* struct timezone *tz

## sys_getrlimit: `97`
[comment]: # "description goes here"
* unsigned int resource
* struct rlimit *rlim

## sys_getrusage: `98`
[comment]: # "description goes here"
* int who
* struct rusage *ru

## sys_sysinfo: `99`
[comment]: # "description goes here"
* struct sysinfo *info

## sys_times: `100`
[comment]: # "description goes here"
* struct tms *tbuf

## sys_ptrace: `101`
[comment]: # "description goes here"
* long request
* long pid
* unsigned long addr
* unsigned long data

## sys_getuid: `102`
[comment]: # "description goes here"

## sys_syslog: `103`
[comment]: # "description goes here"
* int type
* char *buf
* int len

## sys_getgid: `104`
[comment]: # "description goes here"

## sys_setuid: `105`
[comment]: # "description goes here"
* uid_t uid

## sys_setgid: `106`
[comment]: # "description goes here"
* gid_t gid

## sys_geteuid: `107`
[comment]: # "description goes here"

## sys_getegid: `108`
[comment]: # "description goes here"

## sys_setpgid: `109`
[comment]: # "description goes here"
* pid_t pid
* pid_t pgid

## sys_getppid: `110`
[comment]: # "description goes here"

## sys_getpgrp: `111`
[comment]: # "description goes here"

## sys_setsid: `112`
[comment]: # "description goes here"

## sys_setreuid: `113`
[comment]: # "description goes here"
* uid_t ruid
* uid_t euid

## sys_setregid: `114`
[comment]: # "description goes here"
* gid_t rgid
* gid_t egid

## sys_getgroups: `115`
[comment]: # "description goes here"
* int gidsetsize
* gid_t *grouplist

## sys_setgroups: `116`
[comment]: # "description goes here"
* int gidsetsize
* gid_t *grouplist

## sys_setresuid: `117`
[comment]: # "description goes here"
* uid_t *ruid
* uid_t *euid
* uid_t *suid

## sys_getresuid: `118`
[comment]: # "description goes here"
* uid_t *ruid
* uid_t *euid
* uid_t *suid

## sys_setresgid: `119`
[comment]: # "description goes here"
* gid_t rgid
* gid_t egid
* gid_t sgid

## sys_getresgid: `120`
[comment]: # "description goes here"
* gid_t *rgid
* gid_t *egid
* gid_t *sgid

## sys_getpgid: `121`
[comment]: # "description goes here"
* pid_t pid

## sys_setfsuid: `122`
[comment]: # "description goes here"
* uid_t uid

## sys_setfsgid: `123`
[comment]: # "description goes here"
* gid_t gid

## sys_getsid: `124`
[comment]: # "description goes here"
* pid_t pid

## sys_capget: `125`
[comment]: # "description goes here"
* cap_user_header_t header
* cap_user_data_t dataptr

## sys_capset: `126`
[comment]: # "description goes here"
* cap_user_header_t header
* const cap_user_data_t data

## sys_rt_sigpending: `127`
[comment]: # "description goes here"
* sigset_t *set
* size_t sigsetsize

## sys_rt_sigtimedwait: `128`
[comment]: # "description goes here"
* const sigset_t *uthese
* siginfo_t *uinfo
* const struct timespec *uts
* size_t sigsetsize

## sys_rt_sigqueueinfo: `129`
[comment]: # "description goes here"
* pid_t pid
* int sig
* siginfo_t *uinfo

## sys_rt_sigsuspend: `130`
[comment]: # "description goes here"
* sigset_t *unewset
* size_t sigsetsize

## sys_sigaltstack: `131`
[comment]: # "description goes here"
* const stack_t *uss
* stack_t *uoss

## sys_utime: `132`
[comment]: # "description goes here"
* char *filename
* struct utimbuf *times

## sys_mknod: `133`
[comment]: # "description goes here"
* const char *filename
* umode_t mode
* unsigned dev

## sys_uselib: `134`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_personality: `135`
[comment]: # "description goes here"
* unsigned int personality

## sys_ustat: `136`
[comment]: # "description goes here"
* unsigned dev
* struct ustat *ubuf

## sys_statfs: `137`
[comment]: # "description goes here"
* const char *pathname
* struct statfs *buf

## sys_fstatfs: `138`
[comment]: # "description goes here"
* unsigned int fd
* struct statfs *buf

## sys_sysfs: `139`
[comment]: # "description goes here"
* int option
* unsigned long arg1
* unsigned long arg2

## sys_getpriority: `140`
[comment]: # "description goes here"
* int which
* int who

## sys_setpriority: `141`
[comment]: # "description goes here"
* int which
* int who
* int niceval

## sys_sched_setparam: `142`
[comment]: # "description goes here"
* pid_t pid
* struct sched_param *param

## sys_sched_getparam: `143`
[comment]: # "description goes here"
* pid_t pid
* struct sched_param *param

## sys_sched_setscheduler: `144`
[comment]: # "description goes here"
* pid_t pid
* int policy
* struct sched_param *param

## sys_sched_getscheduler: `145`
[comment]: # "description goes here"
* pid_t pid

## sys_sched_get_priority_max: `146`
[comment]: # "description goes here"
* int policy

## sys_sched_get_priority_min: `147`
[comment]: # "description goes here"
* int policy

## sys_sched_rr_get_interval: `148`
[comment]: # "description goes here"
* pid_t pid
* struct timespec *interval

## sys_mlock: `149`
[comment]: # "description goes here"
* unsigned long start
* size_t len

## sys_munlock: `150`
[comment]: # "description goes here"
* unsigned long start
* size_t len

## sys_mlockall: `151`
[comment]: # "description goes here"
* int flags

## sys_munlockall: `152`
[comment]: # "description goes here"

## sys_vhangup: `153`
[comment]: # "description goes here"

## sys_modify_ldt: `154`
[comment]: # "description goes here"
* int func
* void *ptr
* unsigned long bytecount

## sys_pivot_root: `155`
[comment]: # "description goes here"
* const char *new_root
* const char *put_old

## sys__sysctl: `156`
[comment]: # "description goes here"
* struct __sysctl_args *args

## sys_prctl: `157`
[comment]: # "description goes here"
* int option
* unsigned long arg2
* unsigned long arg3
* unsigned long arg4
* unsigned long arg5

## sys_arch_prctl: `158`
[comment]: # "description goes here"
* struct task_struct *task
* int code
* unsigned long *addr

## sys_adjtimex: `159`
[comment]: # "description goes here"
* struct timex *txc_p

## sys_setrlimit: `160`
[comment]: # "description goes here"
* unsigned int resource
* struct rlimit *rlim

## sys_chroot: `161`
[comment]: # "description goes here"
* const char *filename

## sys_sync: `162`
[comment]: # "description goes here"

## sys_acct: `163`
[comment]: # "description goes here"
* const char *name

## sys_settimeofday: `164`
[comment]: # "description goes here"
* struct timeval *tv
* struct timezone *tz

## sys_mount: `165`
[comment]: # "description goes here"
* char *dev_name
* char *dir_name
* char *type
* unsigned long flags
* void *data

## sys_umount2: `166`
[comment]: # "description goes here"
* const char *target
* int flags

## sys_swapon: `167`
[comment]: # "description goes here"
* const char *specialfile
* int swap_flags

## sys_swapoff: `168`
[comment]: # "description goes here"
* const char *specialfile

## sys_reboot: `169`
[comment]: # "description goes here"
* int magic1
* int magic2
* unsigned int cmd
* void *arg

## sys_sethostname: `170`
[comment]: # "description goes here"
* char *name
* int len

## sys_setdomainname: `171`
[comment]: # "description goes here"
* char *name
* int len

## sys_iopl: `172`
[comment]: # "description goes here"
* unsigned int level
* struct pt_regs *regs

## sys_ioperm: `173`
[comment]: # "description goes here"
* unsigned long from
* unsigned long num
* int turn_on

## sys_create_module: `174`
[comment]: # "description goes here"
* REMOVED IN Linux 2.6

## sys_init_module: `175`
[comment]: # "description goes here"
* void *umod
* unsigned long len
* const char *uargs

## sys_delete_module: `176`
[comment]: # "description goes here"
* const chat *name_user
* unsigned int flags

## sys_get_kernel_syms: `177`
[comment]: # "description goes here"
* REMOVED IN Linux 2.6

## sys_query_module: `178`
[comment]: # "description goes here"
* REMOVED IN Linux 2.6

## sys_quotactl: `179`
[comment]: # "description goes here"
* unsigned int cmd
* const char *special
* qid_t id
* void *addr

## sys_nfsservctl: `180`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_getpmsg: `181`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_putpmsg: `182`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_afs_syscall: `183`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_tuxcall: `184`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_security: `185`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_gettid: `186`
[comment]: # "description goes here"

## sys_readahead: `187`
[comment]: # "description goes here"
* int fd
* loff_t offset
* size_t count

## sys_setxattr: `188`
[comment]: # "description goes here"
* const char *pathname
* const char *name
* const void *value
* size_t size
* int flags

## sys_lsetxattr: `189`
[comment]: # "description goes here"
* const char *pathname
* const char *name
* const void *value
* size_t size
* int flags

## sys_fsetxattr: `190`
[comment]: # "description goes here"
* int fd
* const char *name
* const void *value
* size_t size
* int flags

## sys_getxattr: `191`
[comment]: # "description goes here"
* const char *pathname
* const char *name
* void *value
* size_t size

## sys_lgetxattr: `192`
[comment]: # "description goes here"
* const char *pathname
* const char *name
* void *value
* size_t size

## sys_fgetxattr: `193`
[comment]: # "description goes here"
* int fd
* const har *name
* void *value
* size_t size

## sys_listxattr: `194`
[comment]: # "description goes here"
* const char *pathname
* char *list
* size_t size

## sys_llistxattr: `195`
[comment]: # "description goes here"
* const char *pathname
* char *list
* size_t size

## sys_flistxattr: `196`
[comment]: # "description goes here"
* int fd
* char *list
* size_t size

## sys_removexattr: `197`
[comment]: # "description goes here"
* const char *pathname
* const char *name

## sys_lremovexattr: `198`
[comment]: # "description goes here"
* const char *pathname
* const char *name

## sys_fremovexattr: `199`
[comment]: # "description goes here"
* int fd
* const char *name

## sys_tkill: `200`
[comment]: # "description goes here"
* pid_t pid
* ing sig

## sys_time: `201`
[comment]: # "description goes here"
* time_t *tloc

## sys_futex: `202`
[comment]: # "description goes here"
* u32 *uaddr
* int op
* u32 val
* struct timespec *utime
* u32 *uaddr2
* u32 val3

## sys_sched_setaffinity: `203`
[comment]: # "description goes here"
* pid_t pid
* unsigned int len
* unsigned long *user_mask_ptr

## sys_sched_getaffinity: `204`
[comment]: # "description goes here"
* pid_t pid
* unsigned int len
* unsigned long *user_mask_ptr

## sys_set_thread_area: `205`
[comment]: # "description goes here"
* NOT IMPLEMENTED. Use arch_prctl

## sys_io_setup: `206`
[comment]: # "description goes here"
* unsigned nr_events
* aio_context_t *ctxp

## sys_io_destroy: `207`
[comment]: # "description goes here"
* aio_context_t ctx

## sys_io_getevents: `208`
[comment]: # "description goes here"
* aio_context_t ctx_id
* long min_nr
* long nr
* struct io_event *events

## sys_io_submit: `209`
[comment]: # "description goes here"
* aio_context_t ctx_id
* long nr
* struct iocb **iocbpp

## sys_io_cancel: `210`
[comment]: # "description goes here"
* aio_context_t ctx_id
* struct iocb *iocb
* struct io_event *result

## sys_get_thread_area: `211`
[comment]: # "description goes here"
* NOT IMPLEMENTED. Use arch_prctl

## sys_lookup_dcookie: `212`
[comment]: # "description goes here"
* u64 cookie64
* long buf
* long len

## sys_epoll_create: `213`
[comment]: # "description goes here"
* int size

## sys_epoll_ctl_old: `214`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_epoll_wait_old: `215`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_remap_file_pages: `216`
[comment]: # "description goes here"
* unsigned long start
* unsigned long size
* unsigned long prot
* unsigned long pgoff
* unsigned long flags

## sys_getdents64: `217`
[comment]: # "description goes here"
* unsigned int fd
* struct linux_dirent64 *dirent
* unsigned int count

## sys_set_tid_address: `218`
[comment]: # "description goes here"
* int *tidptr

## sys_restart_syscall: `219`
[comment]: # "description goes here"

## sys_semtimedop: `220`
[comment]: # "description goes here"
* int semid
* struct sembuf *tsops
* unsigned nsops
* const struct timespec *timeout

## sys_fadvise64: `221`
[comment]: # "description goes here"
* int fd
* loff_t offset
* size_t len
* int advice

## sys_timer_create: `222`
[comment]: # "description goes here"
* const clockid_t which_clock
* struct sigevent *timer_event_spec
* timer_t *created_timer_id

## sys_timer_settime: `223`
[comment]: # "description goes here"
* timer_t timer_id
* int flags
* const struct itimerspec *new_setting
* struct itimerspec *old_setting

## sys_timer_gettime: `224`
[comment]: # "description goes here"
* timer_t timer_id
* struct itimerspec *setting

## sys_timer_getoverrun: `225`
[comment]: # "description goes here"
* timer_t timer_id

## sys_timer_delete: `226`
[comment]: # "description goes here"
* timer_t timer_id

## sys_clock_settime: `227`
[comment]: # "description goes here"
* const clockid_t which_clock
* const struct timespec *tp

## sys_clock_gettime: `228`
[comment]: # "description goes here"
* const clockid_t which_clock
* struct timespec *tp

## sys_clock_getres: `229`
[comment]: # "description goes here"
* const clockid_t which_clock
* struct timespec *tp

## sys_clock_nanosleep: `230`
[comment]: # "description goes here"
* const clockid_t which_clock
* int flags
* const struct timespec *rqtp
* struct timespec *rmtp

## sys_exit_group: `231`
[comment]: # "description goes here"
* int error_code

## sys_epoll_wait: `232`
[comment]: # "description goes here"
* int epfd
* struct epoll_event *events
* int maxevents
* int timeout

## sys_epoll_ctl: `233`
[comment]: # "description goes here"
* int epfd
* int op
* int fd
* struct epoll_event *event

## sys_tgkill: `234`
[comment]: # "description goes here"
* pid_t tgid
* pid_t pid
* int sig

## sys_utimes: `235`
[comment]: # "description goes here"
* char *filename
* struct timeval *utimes

## sys_vserver: `236`
[comment]: # "description goes here"
* NOT IMPLEMENTED

## sys_mbind: `237`
[comment]: # "description goes here"
* unsigned long start
* unsigned long len
* unsigned long mode
* unsigned long *nmask
* unsigned long maxnode
* unsigned flags

## sys_set_mempolicy: `238`
[comment]: # "description goes here"
* int mode
* unsigned long *nmask
* unsigned long maxnode

## sys_get_mempolicy: `239`
[comment]: # "description goes here"
* int *policy
* unsigned long *nmask
* unsigned long maxnode
* unsigned long addr
* unsigned long flags

## sys_mq_open: `240`
[comment]: # "description goes here"
* const char *u_name
* int oflag
* mode_t mode
* struct mq_attr *u_attr

## sys_mq_unlink: `241`
[comment]: # "description goes here"
* const char *u_name

## sys_mq_timedsend: `242`
[comment]: # "description goes here"
* mqd_t mqdes
* const char *u_msg_ptr
* size_t msg_len
* unsigned int msg_prio
* const stuct timespec *u_abs_timeout

## sys_mq_timedreceive: `243`
[comment]: # "description goes here"
* mqd_t mqdes
* char *u_msg_ptr
* size_t msg_len
* unsigned int *u_msg_prio
* const struct timespec *u_abs_timeout

## sys_mq_notify: `244`
[comment]: # "description goes here"
* mqd_t mqdes
* const struct sigevent *u_notification

## sys_mq_getsetattr: `245`
[comment]: # "description goes here"
* mqd_t mqdes
* const struct mq_attr *u_mqstat
* struct mq_attr *u_omqstat

## sys_kexec_load: `246`
[comment]: # "description goes here"
* unsigned long entry
* unsigned long nr_segments
* struct kexec_segment *segments
* unsigned long flags

## sys_waitid: `247`
[comment]: # "description goes here"
* int which
* pid_t upid
* struct siginfo *infop
* int options
* struct rusage *ru

## sys_add_key: `248`
[comment]: # "description goes here"
* const char *_type
* const char *_description
* const void *_payload
* size_t plen

## sys_request_key: `249`
[comment]: # "description goes here"
* const char *_type
* const char *_description
* const char *_callout_info
* key_serial_t destringid

## sys_keyctl: `250`
[comment]: # "description goes here"
* int option
* unsigned long arg2
* unsigned long arg3
* unsigned long arg4
* unsigned long arg5

## sys_ioprio_set: `251`
[comment]: # "description goes here"
* int which
* int who
* int ioprio

## sys_ioprio_get: `252`
[comment]: # "description goes here"
* int which
* int who

## sys_inotify_init: `253`
[comment]: # "description goes here"

## sys_inotify_add_watch: `254`
[comment]: # "description goes here"
* int fd
* const char *pathname
* u32 mask

## sys_inotify_rm_watch: `255`
[comment]: # "description goes here"
* int fd
* __s32 wd

## sys_migrate_pages: `256`
[comment]: # "description goes here"
* pid_t pid
* unsigned long maxnode
* const unsigned long *old_nodes
* const unsigned long *new_nodes

## sys_openat: `257`
[comment]: # "description goes here"
* int dfd
* const char *filename
* int flags
* int mode

## sys_mkdirat: `258`
[comment]: # "description goes here"
* int dfd
* const char *pathname
* int mode

## sys_mknodat: `259`
[comment]: # "description goes here"
* int dfd
* const char *filename
* int mode
* unsigned dev

## sys_fchownat: `260`
[comment]: # "description goes here"
* int dfd
* const char *filename
* uid_t user
* gid_t group
* int flag

## sys_futimesat: `261`
[comment]: # "description goes here"
* int dfd
* const char *filename
* struct timeval *utimes

## sys_newfstatat: `262`
[comment]: # "description goes here"
* int dfd
* const char *filename
* struct stat *statbuf
* int flag

## sys_unlinkat: `263`
[comment]: # "description goes here"
* int dfd
* const char *pathname
* int flag

## sys_renameat: `264`
[comment]: # "description goes here"
* int oldfd
* const char *oldname
* int newfd
* const char *newname

## sys_linkat: `265`
[comment]: # "description goes here"
* int oldfd
* const char *oldname
* int newfd
* const char *newname
* int flags

## sys_symlinkat: `266`
[comment]: # "description goes here"
* const char *oldname
* int newfd
* const char *newname

## sys_readlinkat: `267`
[comment]: # "description goes here"
* int dfd
* const char *pathname
* char *buf
* int bufsiz

## sys_fchmodat: `268`
[comment]: # "description goes here"
* int dfd
* const char *filename
* mode_t mode

## sys_faccessat: `269`
[comment]: # "description goes here"
* int dfd
* const char *filename
* int mode

## sys_pselect6: `270`
[comment]: # "description goes here"
* int n
* fd_set *inp
* fd_set *outp
* fd_set *exp
* struct timespec *tsp
* void *sig

## sys_ppoll: `271`
[comment]: # "description goes here"
* struct pollfd *ufds
* unsigned int nfds
* struct timespec *tsp
* const sigset_t *sigmask
* size_t sigsetsize

## sys_unshare: `272`
[comment]: # "description goes here"
* unsigned long unshare_flags

## sys_set_robust_list: `273`
[comment]: # "description goes here"
* struct robust_list_head *head
* size_t len

## sys_get_robust_list: `274`
[comment]: # "description goes here"
* int pid
* struct robust_list_head **head_ptr
* size_t *len_ptr

## sys_splice: `275`
[comment]: # "description goes here"
* int fd_in
* loff_t *off_in
* int fd_out
* loff_t *off_out
* size_t len
* unsigned int flags

## sys_tee: `276`
[comment]: # "description goes here"
* int fdin
* int fdout
* size_t len
* unsigned int flags

## sys_sync_file_range: `277`
[comment]: # "description goes here"
* long fd
* loff_t offset
* loff_t bytes
* long flags

## sys_vmsplice: `278`
[comment]: # "description goes here"
* int fd
* const struct iovec *iov
* unsigned long nr_segs
* unsigned int flags

## sys_move_pages: `279`
[comment]: # "description goes here"
* pid_t pid
* unsigned long nr_pages
* const void **pages
* const int *nodes
* int *status
* int flags

## sys_utimensat: `280`
[comment]: # "description goes here"
* int dfd
* const char *filename
* struct timespec *utimes
* int flags

## sys_epoll_pwait: `281`
[comment]: # "description goes here"
* int epfd
* struct epoll_event *events
* int maxevents
* int timeout
* const sigset_t *sigmask
* size_t sigsetsize

## sys_signalfd: `282`
[comment]: # "description goes here"
* int ufd
* sigset_t *user_mask
* size_t sizemask

## sys_timerfd_create: `283`
[comment]: # "description goes here"
* int clockid
* int flags

## sys_eventfd: `284`
[comment]: # "description goes here"
* unsigned int count

## sys_fallocate: `285`
[comment]: # "description goes here"
* long fd
* long mode
* loff_t offset
* loff_t len

## sys_timerfd_settime: `286`
[comment]: # "description goes here"
* int ufd
* int flags
* const struct itimerspec *utmr
* struct itimerspec *otmr

## sys_timerfd_gettime: `287`
[comment]: # "description goes here"
* int ufd
* struct itimerspec *otmr

## sys_accept4: `288`
[comment]: # "description goes here"
* int fd
* struct sockaddr *upeer_sockaddr
* int *upeer_addrlen
* int flags

## sys_signalfd4: `289`
[comment]: # "description goes here"
* int ufd
* sigset_t *user_mask
* size_t sizemask
* int flags

## sys_eventfd2: `290`
[comment]: # "description goes here"
* unsigned int count
* int flags

## sys_epoll_create1: `291`
[comment]: # "description goes here"
* int flags

## sys_dup3: `292`
[comment]: # "description goes here"
* unsigned int oldfd
* unsigned int newfd
* int flags

## sys_pipe2: `293`
[comment]: # "description goes here"
* int *filedes
* int flags

## sys_inotify_init1: `294`
[comment]: # "description goes here"
* int flags

## sys_preadv: `295`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec *vec
* unsigned long vlen
* unsigned long pos_l
* unsigned long pos_h

## sys_pwritev: `296`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec *vec
* unsigned long vlen
* unsigned long pos_l
* unsigned long pos_h

## sys_rt_tgsigqueueinfo: `297`
[comment]: # "description goes here"
* pid_t tgid
* pid_t pid
* int sig
* siginfo_t *uinfo

## sys_perf_event_open: `298`
[comment]: # "description goes here"
* struct perf_event_attr *attr_uptr
* pid_t pid
* int cpu
* int group_fd
* unsigned long flags

## sys_recvmmsg: `299`
[comment]: # "description goes here"
* int fd
* struct msghdr *mmsg
* unsigned int vlen
* unsigned int flags
* struct timespec *timeout

## sys_fanotify_init: `300`
[comment]: # "description goes here"
* unsigned int flags
* unsigned int event_f_flags

## sys_fanotify_mark: `301`
[comment]: # "description goes here"
* long fanotify_fd
* long flags
* __u64 mask
* long dfd
* long pathname

## sys_prlimit64: `302`
[comment]: # "description goes here"
* pid_t pid
* unsigned int resource
* const struct rlimit64 *new_rlim
* struct rlimit64 *old_rlim

## sys_name_to_handle_at: `303`
[comment]: # "description goes here"
* int dfd
* const char *name
* struct file_handle *handle
* int *mnt_id
* int flag

## sys_open_by_handle_at: `304`
[comment]: # "description goes here"
* int dfd
* const char *name
* struct file_handle *handle
* int *mnt_id
* int flags

## sys_clock_adjtime: `305`
[comment]: # "description goes here"
* clockid_t which_clock
* struct timex *tx

## sys_syncfs: `306`
[comment]: # "description goes here"
* int fd

## sys_sendmmsg: `307`
[comment]: # "description goes here"
* int fd
* struct mmsghdr *mmsg
* unsigned int vlen
* unsigned int flags

## sys_setns: `308`
[comment]: # "description goes here"
* int fd
* int nstype

## sys_getcpu: `309`
[comment]: # "description goes here"
* unsigned *cpup
* unsigned *nodep
* struct getcpu_cache *unused

## sys_process_vm_readv: `310`
[comment]: # "description goes here"
* pid_t pid
* const struct iovec *lvec
* unsigned long liovcnt
* const struct iovec *rvec
* unsigned long riovcnt
* unsigned long flags

## sys_process_vm_writev: `311`
[comment]: # "description goes here"
* pid_t pid
* const struct iovec *lvec
* unsigned long liovcnt
* const struct iovcc *rvec
* unsigned long riovcnt
* unsigned long flags

## sys_kcmp: `312`
[comment]: # "description goes here"
* pid_t pid1
* pid_t pid2
* int type
* unsigned long idx1
* unsigned long idx2

## sys_finit_module: `313`
[comment]: # "description goes here"
* int fd
* const char __user *uargs
* int flags

## sys_sched_setattr: `314`
[comment]: # "description goes here"
* pid_t pid
* struct sched_attr __user *attr
* unsigned int flags

## sys_sched_getattr: `315`
[comment]: # "description goes here"
* pid_t pid
* struct sched_attr __user *attr
* unsigned int size
* unsigned int flags

## sys_renameat2</t>: `316`
[comment]: # "description goes here"
* int olddfd
* const char __user *oldname
* int newdfd
* const char __user *newname
* unsigned int flags

## sys_seccomp: `317`
[comment]: # "description goes here"
* unsigned int op
* unsigned int flags
* const char __user *uargs

## sys_getrandom: `318`
[comment]: # "description goes here"
* char __user *buf
* size_t count
* unsigned int flags

## sys_memfd_create: `319`
[comment]: # "description goes here"
* const char __user *uname_ptr
* unsigned int flags

## sys_kexec_file_load: `320`
[comment]: # "description goes here"
* int kernel_fd
* int initrd_fd
* unsigned long cmdline_len
* const char __user *cmdline_ptr
* unsigned long flags

## sys_bpf: `321`
[comment]: # "description goes here"
* int cmd
* union bpf_attr *attr
* unsigned int size

## stub_execveat: `322`
[comment]: # "description goes here"
* int dfd
* const char __user *filename
* const char __user *const __user *argv
* const char __user *const __user *envp
* int flags

## userfaultfd: `323`
[comment]: # "description goes here"
* int flags

## membarrier: `324`
[comment]: # "description goes here"
* int cmd
* int flags

## mlock2: `325`
[comment]: # "description goes here"
* unsigned long start
* size_t len
* int flags

## copy_file_range: `326`
[comment]: # "description goes here"
* int fd_in
* loff_t __user *off_in
* int fd_out
* loff_t __user * off_out
* size_t len
* unsigned int flags

## preadv2: `327`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec __user *vec
* unsigned long vlen
* unsigned long pos_l
* unsigned long pos_h
* int flags

## pwritev2: `328`
[comment]: # "description goes here"
* unsigned long fd
* const struct iovec __user *vec
* unsigned long vlen
* unsigned long pos_l
* unsigned long pos_h
* int flags

## pkey_mprotect: `329`
[comment]: # "description goes here"

## pkey_alloc: `330`
[comment]: # "description goes here"

## pkey_free: `331`
[comment]: # "description goes here"

## statx: `332`
[comment]: # "description goes here"

## io_pgetevents: `333`
[comment]: # "description goes here"

## rseq: `334`
[comment]: # "description goes here"

## pkey_mprotect: `335`
[comment]: # "description goes here"