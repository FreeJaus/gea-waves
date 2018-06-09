# !/bin/sh

cd $(dirname $0)

curl -L https://github.com/hoxu/gitstats/archive/master.tar.gz | tar xvz
cd gitstats-master
./gitstats ../.. ../gitstats-out
cd ..
rm -rf gitstats-master