#!/bin/sh
rm -rf /root/output/*
rm -rf ./20*
rm -rf ./vanilla*
curl -s https://api.github.com/repos/vanilla/vanilla/releases/latest \
		| grep "zipball_url.*," \
		| cut -d : -f 2,3 \
		| tr -d '", ' \
		| xargs wget
unzip -q $(ls .|head -n 1)
cd $(ls|sort -r|head -n 1)
composer require --no-update moontoast/math
composer install --prefer-dist

cp -r addons /root/output
cp -r applications /root/output
cp -r cache /root/output
cp -r conf /root/output
cp -r dist /root/output
cp -r js /root/output
cp -r library /root/output
cp -r locales /root/output
cp -r plugins /root/output
cp -r resources /root/output
cp -r themes /root/output
cp -r uploads /root/output
cp -r vendor /root/output
cp .htaccess.dist /root/output
cp LICENSE /root/output
cp README.md /root/output
cp bootstrap.php /root/output
cp environment.php /root/output
cp index.php /root/output
cp preload.php /root/output
cp version.json /root/output

tar -zcvf vanilla-forums.tar.gz /root/output/
mv vanilla-forums.tar.gz /root/output

