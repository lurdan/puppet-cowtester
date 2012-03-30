puppet-cowtester
----------------

automatic test harness for puppet. Using cowbuilder, it mimics minimal debian
nstallation and apply puppet manifests to check whether they are sane or not.

setup
-----

1. compile chname

cowtester heavily depends on 'chname' utility. Following commands
will compile it for you.

  $ make
  $ make clean

2. examine config file

You can change various settings through editing .cowtesterrc file.
cowtester assumes this file exists in the $CWD.

  $ cp .cowtesterrc-sample .cowtesterrc
  $ $EDITOR .cowtesterrc

3. create base-tree

  $ ./cowtester -c

4. run test

  $ ./cowtester -h <SOME-NODE-NAME> -d 1

For more options, execute cowtester without any options to show
its usage:

  $ ./cowtester

Tips, and so on
---------------

using puppetmaster
==================

Cowtester can use with puppetmaster as manifest provider, though
puppetmaster must runs on the host which cowtester run.
Because cowtester will destroy its environment, its needs
to be set up dedicated for this use.

  $ sudo /etc/init.d/puppetmaster start
  $ ./cowtester -s

eatmydata
=========

Cowtester automatically sets eatmydata to extrapackages.
So, you can use it simply with installing eatmydata into host and
adding below to your pbuilderrc.

  if [ -z "$LD_PRELOAD" ]; then
    LD_PRELOAD=/usr/lib/libeatmydata/libeatmydata.so
  else
    LD_PRELOAD="$LD_PRELOAD":/usr/lib/libeatmydata/libeatmydata.so
  fi
  export LD_PRELOAD
