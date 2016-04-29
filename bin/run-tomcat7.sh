echo 'tomcat7 starting....'
cd ..
set MAVEN_OPTS=$MAVEN_OPTS -Xms256m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m
mvn tomcat7:run
cd bin
