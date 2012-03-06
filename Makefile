#!/usr/bin/make

all: chname

chname:
	wget http://chname.googlecode.com/files/chname-1.0.tar.gz
	tar xvf chname-1.0.tar.gz
	cd chname-1.0 && make && mv chname ..

clean:
	rm -rf chname-*

.PHONY: doc check clean setup
