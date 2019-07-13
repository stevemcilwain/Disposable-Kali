#!/bin/bash

if [[ -e /root/.bash_aliases ]]; then
    echo ">>> SKIP: .bash_aliases already exists..."
else
    echo ">>> adding aliases..."

    # Add your aliases here 

    #ls 
    echo "alias ll='ls -lvhAF --file-type --group-directories-first'" >> /root/.bash_aliases
    echo "alias lr='ll -R'" >> /root/.bash_aliases

    #python web server
    echo "alias http='python -m SimpleHTTPServer 80'" >> /root/.bash_aliases

    #netcat shortcuts (rlwrap!!!)
    echo "alias ncr='rlwrap nc'" >> /root/.bash_aliases
    echo "alias ncrl='rlwrap nc -nlvp'" >> /root/.bash_aliases
    echo "alias ncl='nc -nlvp'" >> /root/.bash_aliases

    #mingw
    echo "alias wcc32='i686-w64-mingw32-gcc'" >> /root/.bash_aliases
    echo "alias wcc64='x86_64-w64-mingw32-gcc'" >> /root/.bash_aliases
    echo "alias wcc32+='i686-w64-mingw32-g++'" >> /root/.bash_aliases
    echo "alias wcc64+='x86_64-w64-mingw32-g++'" >> /root/.bash_aliases

    echo ">>> sourcing .bash_aliases..."
    source /root/.bash_aliases

    echo " "
    cat /root/.bash_aliases
    echo " "
fi
