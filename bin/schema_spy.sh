#!/bin/sh

set -e

echo "===============================================================================================================
If you don't already have Java installed, paste this command into your terminal and install the dmg:
--------------------------------------------------------------------------------------------------------------
curl -L -b 'oraclelicense=a' http://download.oracle.com/otn-pub/java/jdk/9.0.1+11/jdk-9.0.1_osx-x64_bin.dmg -O
--------------------------------------------------------------------------------------------------------------
==============================================================================================================="

cd "$HOME" ;
curl -O https://github.com/schemaspy/schemaspy/releases/download/v6.0.0-rc2/schemaspy-6.0.0-rc2.jar ;
curl -O https://jdbc.postgresql.org/download/postgresql-42.1.4.jar ;
curl -O https://graphviz.gitlab.io/pub/graphviz/stable/SOURCES/graphviz.tar.gz ;
tar -zxvf graphviz.tar.gz ;
cd graphviz-2.40.1 ;
./configure ;
make ;
make install ;
java -jar schemaspy-6.0.0-rc2.jar -t pgsql -s public -db commonlit_development -u gandalf -host localhost -o "$HOME" -dp "$HOME"/postgresql-42.1.4.jar ;

echo "Open ~/index.html to view SchemaSpy."
