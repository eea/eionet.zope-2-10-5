Zope 2.10.5 installation
========================

This Dockerfile installs Python 2.4.4, MySQL database connector, Python LDAP
and Zope 2.10.5 from source packages. For convenience the packages are in
the directory, as they are 10 years old.

The installation expects the Zope instance to be located in /var/local/website
in the container namespace. This can then be mapped to whatever you want in the
docker-compose.yml file.

The Python interpreter is installed in /usr/local/python and zope in /usr/local/zope

If the container doesn't find an etc/zope.conf file, then it creates a new instance
in /var/local/website.

You can set the user id to run zope as by setting the environment variable USERID to
a numeric value. If not set, then it defaults to 600.

Configuration
-------------
In the etc/zope.conf set the port of the embedded HTTP service to 8080 and the INSTANCE
and ZOPE definitions.
```
<http-server>
  # valid keys are "address" and "force-connection-close"
  address 8080
  # force-connection-close on
</http-server>
```
In the scripts under bin, make sure that the Python interpreter is /var/local/python235/bin/python
and ZOPE_HOME is /var/local/zope272

Sources
-------
* https://www.python.org/download/releases/2.4.4/
* http://old.zope.org/Products/Zope/2.10.5/

Building
--------

The build the container locally do `docker-compose build`. When you push the changes to GitHub,
then the Docker Hub will build and publish at eeacms/zope-2-10-5:latest
