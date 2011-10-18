
cleanmd (){  # clean all except txt, md, ...
    rm -f *.pdf *.tex *.html log
}

xvman (){   #  vman.sh - view man pages in vim
	vim -c "Man $*" -c 'silent! only' -c 'nmap q :q<CR>'
}


