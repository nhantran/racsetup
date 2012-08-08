# .bash_profile

# Get the aliases and functions
if [ -f ~/.bashrc ]; then
	. ~/.bashrc
fi

# User specific environment and startup programs

PATH=$PATH:$HOME/bin

TMP=/tmp; export TMP
TMPDIR=$TMP; export TMPDIR

ORACLE_HOSTNAME=rac2.codingbee.net; export ORACLE_HOSTNAME
ORACLE_UNQNAME=RAC; export ORACLE_UNQNAME
ORACLE_BASE=/u01/app/oracle; export ORACLE_BASE
GRID_HOME=/u01/app/11.2.0/grid; export GRID_HOME
DB_HOME=$ORACLE_BASE/product/11.2.0/db_1; export DB_HOME
ORACLE_HOME=$DB_HOME; export ORACLE_HOME
ORACLE_SID=RAC2; export ORACLE_SID
ORACLE_TERM=xterm; export ORACLE_TERM
BASE_PATH=/usr/sbin:$PATH; export BASE_PATH
PATH=$ORACLE_HOME/bin:$BASE_PATH; export PATH

LD_LIBRARY_PATH=$ORACLE_HOME/lib:/lib:/usr/lib; export LD_LIBRARY_PATH
CLASSPATH=$ORACLE_HOME/JRE:$ORACLE_HOME/jlib:$ORACLE_HOME/rdbms/jlib; export CLASSPATH

if [ $USER = "oracle" ]; then
  if [ $SHELL = "/bin/ksh" ]; then
	ulimit -p 16384
	ulimit -n 65536
  else
	ulimit -u 16384 -n 65536
  fi
fi

alias grid_env='. /home/oracle/grid_env'
alias db_env='. /home/oracle/db_env'
