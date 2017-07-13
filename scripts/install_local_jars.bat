mvn install:install-file -Dfile=..\lib\XCloudJDBC_2_0_6.jar -DgroupId=com.bonc -DartifactId=xcloud -Dversion=2.0.6 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\bonc-commons-core-2.5.1.jar -DgroupId=com.bonc -DartifactId=bonc-commons-core -Dversion=2.5.1 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\bonc-jdbc-0.0.1.jar -DgroupId=com.bonc.jdbc -DartifactId=bonc-jdbc -Dversion=0.0.1 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\bonc-security-base-1.0.3-SNAPSHOT.jar -DgroupId=com.bonc -DartifactId=bonc-security-base -Dversion=1.0.3-SNAPSHOT -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\bonc-sso-client-2.2.2.jar -DgroupId=com.bonc -DartifactId=bonc-sso-client -Dversion=2.2.2 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\bonc-static-commons-0.0.1.jar -DgroupId=com.bonc.static -DartifactId=bonc-static-commons -Dversion=0.0.1 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\c3p0-0.9.1.2.jar -DgroupId=c3p0 -DartifactId=c3p0 -Dversion=0.9.1.2 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\c3p0-oracle-thin-extras-0.9.0.2.jar -DgroupId=c3p0 -DartifactId=c3p0-oracle-thin-extras -Dversion=0.9.0.2 -Dpackaging=jar
mvn install:install-file -Dfile=..\lib\json-lib-2.4-jdk15.jar -DgroupId=net.sf.json -DartifactId=json-lib -Dversion=2.4 -Dpackaging=jar


 exit /b