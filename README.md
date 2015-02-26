# alienate
Docker convenience function for alien operations

Run like this:

```sh
docker run -v /path/to/io_folder:/io imiell/alienate
```

to output converted files to your ```/path/to/io_folder```

or:

```sh
docker run -v /path/to/io_folder:/io imiell/alienate ftp://rpmfind.net/linux/fedora/linux/updates/21/x86_64/b/bash-4.3.33-1.fc21.x86_64.rpm
```

To retrieve the file and output converted files to your io_folder

Useful examples:

http://mirrors.kernel.org/ubuntu/pool/main/libe/libeatmydata/eatmydata_26-2_i386.deb
ftp://ftp.pbone.net/mirror/archive.fedoraproject.org/fedora/linux/releases/15/Everything/x86_64/os/Packages/nss-mdns-0.10-9.fc15.x86_64.rpm
http://mirror.opencsw.org/opencsw/pkgutil.pkg
http://www.aljex.com/bkw/linux/xrmenc-0.25.slp
ftp://ftp.slackware.com/pub/slackware/slackware-8.1/patches/packages/wget-1.10.2-i386-1.tgz

stored in the test folder
