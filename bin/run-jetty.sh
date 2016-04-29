echo 'jetty start running.......'
cd ..

set MAVEN_OPTS=$MAVEN_OPTS -Xms256m -Xmx512m -XX:PermSize=128m -XX:MaxPermSize=256m
mvn jetty:run 

cd bin
echo 'jetty end running.......'
