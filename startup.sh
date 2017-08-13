#!/bin/sh

if [ ! -f /subversion/config/vhost.conf ]; then
    cp /docker/subversion.conf /subversion/config/subversion.conf
    cp /docker/authz.conf /subversion/config/authz.conf
    htpasswd -bc /subversion/config/passwd.conf svn password
    sed -i 's/#ServerName www.example.com:80/ServerName 0.0.0.0:80/g' /etc/httpd/conf/httpd.conf
    svnadmin create /repos/project_test
    mkdir -p /subversion/template/{trunk,branches,tags}
    svn import /subversion/template file:///repos/project_test -m "Initial commit"
fi

rm -rf /etc/httpd/conf.d/subversion.conf

cp /subversion/config/subversion.conf /etc/httpd/conf.d/subversion.conf

/usr/sbin/httpd -D FOREGROUND
