#!/bin/sh

if [ ! -f /subversion/config/subversion.conf ]; then
  cp /docker/subversion.conf /subversion/config/subversion.conf
  cp /docker/authz.conf /subversion/config/authz.conf
  htpasswd -bc /subversion/config/passwd.conf svn password
  svnadmin create /repos/project_test
  mkdir -p /subversion/template/{trunk,branches,tags}
  svn import /subversion/template file:///repos/project_test -m "Initial commit"
fi
    
ln -sf /subversion/config/subversion.conf /etc/httpd/conf.d/subversion.conf

if [ ! -f /run/httpd/httpd.pid ]; then
  rm -rf /run/httpd/httpd.pid
fi
exec /usr/sbin/httpd -DFOREGROUND
