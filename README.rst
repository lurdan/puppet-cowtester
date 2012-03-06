puppet-cowtester
----------------

automatic test harness for puppet. Using cowbuilder, it mimics minimal debian
nstallation and apply puppet manifests to check whether they are sane or not.

setup
-----

1. compile chname

cowtester heavily depends on `chname'  utility. Following commands
will compile it for you.

::
  $ make
  $ make clean

2. examine config file

You can change various settings through editing .cowtesterrc file.
cowtester assumes this file exists in the $CWD.

::
  $ cp .cowtesterrc-sample .cowtesterrc
  $ $EDITOR .cowtesterrc 

3. create base-tree

::
  $ ./cowtester -c

4. run test

::
  $ ./cowtester -h <SOME-NODE-NAME> -d 1


Tips, and so on
---------------

eatmydata
=========
Cowtester automatically sets eatmydata to extrapackages.
So, you can use it to speed up cowtester simply adding below to your pbuilderrc.

::
  if [ -z "$LD_PRELOAD" ]; then
    LD_PRELOAD=/usr/lib/libeatmydata/libeatmydata.so
  else
    LD_PRELOAD="$LD_PRELOAD":/usr/lib/libeatmydata/libeatmydata.so
  fi
  export LD_PRELOAD

