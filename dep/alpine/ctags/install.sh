cp ./ctags /usr/local/bin/ctags  &&  chmod 755 /usr/local/bin/ctags
./mkinstalldirs /usr/local/share/man/man1
mkdir -p /usr/local/share/man/man1
cp ./ctags.1 /usr/local/share/man/man1/ctags.1  &&  chmod 644 /usr/local/share/man/man1/ctags.1
