
#### Go to the site http://www.oracle.com/technetwork/topics/linuxx86-64soft-092277.html

#### Downloads package to this folder:

* oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
* oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm
* oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm

#### Convert packages to .deb:

```
alien oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm
alien oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm
alien oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm
```
#### Rename packages
```
mv oracle-instantclient12.2-basic-12.2.0.1.0-1.x86_64.rpm oracle-instantclient-basic.deb
mv oracle-instantclient12.2-sqlplus-12.2.0.1.0-1.x86_64.rpm oracle-instantclient-sqlplus.deb
mv oracle-instantclient12.2-devel-12.2.0.1.0-1.x86_64.rpm oracle-instantclient-devel.deb
```
