sh label: '', ''''rm -rf docker
mkdir docker
cp /var/lib/jenkins/workspace/pipeline/target/JavaHelloWorldApp.war .
touch dockerfile
cat <<EOT>> Dockerfile
FROM Tomcat
ADD JavaHelloWorldApp.war /usr/local/tomcat/webapps/
CMD ["catalina.sh", "run"]
EXPOSE 8080
EOT
sudo docker build -t webimage:$BUILD_NUMBER .
sudo docker run -itd --name webserver -p 8080:9090 webimage:$BUILD_NUMBER'''

FROM tomcat:9.0
ADD target/.*war /usr/local/tomcat/webapps/
EXPOSE 8080
CMD [“catalina.sh”, “run”]
 docker run -p 80:8080 mywebapp
