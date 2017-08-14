#!/bin/sh

if [ ! -f /subversion/config/subversion.conf ]; then
    cp /docker/subversion.conf /subversion/config/subversion.conf
    cp /docker/authz.conf /subversion/config/authz.conf
    htpasswd -bc /subversion/config/passwd.conf svn password
    svnadmin create /repos/project_test
    mkdir -p /subversion/template/{trunk,branches,tags}
    svn import /subversion/template file:///repos/project_test -m "Initial commit"
fi

sed -i 's/#ServerName www.example.com:80/ServerName 0.0.0.0:80/g' /etc/httpd/conf/httpd.conf
    
rm -rf /etc/httpd/conf.d/subversion.conf
rm -rf /var/run/httpd/httpd.pid

cp /subversion/config/subversion.conf /etc/httpd/conf.d/subversion.conf

/usr/sbin/httpd -D FOREGROUND
