#!/usr/bin/env bash

echo 'The following Maven command installs your Maven-built Java applic>echo 'into the local Maven repository, which will ultimately be stored >echo 'Jenkins''s local Maven repository (and the "maven-repository" Doc>echo 'volume).'
set -x
mvn jar:jar install:install help:evaluate -Dexpression=project.name
set +x

echo 'The following complex command extracts the value of the <name/> e>echo 'within <project/> of your Java/Maven project''s "pom.xml" file.'
set -x
NAME=`mvn help:evaluate -Dexpression=project.name | grep "^[^\[]"`
set +x

echo 'The following complex command behaves similarly to the previous o>echo 'extracts the value of the <version/> element within <project/> in>set -x
VERSION=`mvn help:evaluate -Dexpression=project.version | grep "^[^\[]"`set +x

echo 'The following command runs and outputs the execution of your Java'echo 'application (which Jenkins built using Maven) to the Jenkins UI.'
set -x
java -jar target/${NAME}-${VERSION}.jar

echo 'Waiting for 1 minute...'
sleep 1m

echo 'Ending the application execution...'
exit 0
