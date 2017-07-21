#!/bin/bash

PROJECT=makelocalliferay

echo "Make the project if it doesn't exist"

test -d $PROJECT || \
	mvn archetype:generate \
		-DarchetypeGroupId=org.codehaus.mojo.archetypes \
		-DarchetypeArtifactId=pom-root \
		-DarchetypeVersion=RELEASE \
		-DgroupId=nl.ou.dlwo \
		-DartifactId=makelocalliferay \
		-Dversion=1.0-SNAPSHOT \
		-Dpackage=nl.ou.dlwo \
		-DinteractiveMode=false

pushd $PROJECT

mvn clean compile -Dticket.number=YL-1234

popd
