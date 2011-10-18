#!/bin/sh


ver=$(head -1 CHANGES.txt | awk '{ print $3 }')

full=$(basename `pwd`)
name=${full%.*}

release="${name}-${ver}"

echo "[ ${release}.tar.gz ]( ${release}.tar.gz )" >> README.txt

rm -rf ../$release
rm -rf ../release
mkdir ../release

cp -R `pwd` ../$release
cd ..
tar cfvz ${release}.tar.gz ${release}
mv $release.tar.gz release/

cd -

md2html README.txt > ../release/index.html
