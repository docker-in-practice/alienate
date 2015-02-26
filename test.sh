#!/bin/bash
set -e
git clean
docker run -v $(pwd)/test imiell/alienate
TMPDIR=$(mktemp -d)
D=$(mktemp -d --tpmdir=$TMPDIR)
docker run -v $D:/io imiell/alienate http://mirrors.kernel.org/ubuntu/pool/main/libe/libeatmydata/eatmydata_26-2_i386.deb
D=$(mktemp -d --tpmdir=$TMPDIR)
docker run -v $D:/io imiell/alienate ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/15/Everything/x86_64/os/Packages/nss-mdns-0.10-9.fc15.x86_64.rpm
D=$(mktemp -d --tpmdir=$TMPDIR)
docker run -v $D:/io imiell/alienate ftp://ftp.slackware.com/pub/slackware/slackware-8.1/patches/packages/wget-1.10.2-i386-1.tgz
git clean -f
rm -rf $TMPDIR

