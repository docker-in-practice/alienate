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
