# docker-tomcat8
Tomcat 8 with necessary environment

Folders
=======

* `cacerts` - put CA certificates which you need to this folder
* `xslt` - put `*.xsl` files here. They will be applied to appropriate configuration files on `docker build`
* `wrapper` - put `*.conf` (wrapper paramenters) and `*.properties` (Java properties) files here. They will be applied to `wrapper.conf` and to `wrapper-additional.conf`.
* `/root/prerun/` - put `*.sh` files here. They will be run on every start of container.
