#!/bin/sh

cd `pwd`

rm -rf backup
[ -d 'backup' ] || mkdir 'backup'

for x in *conf *docs *apps *etc; do
    [ -e "$x" ] && {

    ext=${x##*-}
    name=${x%-*}

    [ -d $HOME/$ext ] || mkdir -p $HOME/$ext

    if [ "$ext" = "$name"  ] ; then
        for f in $x/* ; do
            [ -e "$f" ] || break
            bn=$(basename $f)
            rm -rf $HOME/$ext/$bn
            ln -s `pwd`/$f  $HOME/$ext/$bn
            if [ "$ext" = 'conf'  ] ; then
                rm -rf $HOME/.$bn
                ln -s `pwd`/$f  $HOME/.$bn
                echo ln -s `pwd`/$f  $HOME/.$bn
            fi
        done
    else
        rm -rf $HOME/$ext/$name
        ln -s `pwd`/$x  $HOME/$ext/$name
        if [ "$ext" = 'conf'  ] ; then
            for f in $x/* ; do
                [ -e "$f" ] || break
                bn=$(basename $f)
                rm -rf $HOME/.$bn
                ln -s `pwd`/$f  $HOME/.$bn
            done
        fi

    fi
}
done

cd -
