#!/bin/bash

# Clean and build the project using Maven
mvn clean package

# List the contents of the target directory with detailed information
ls -alh service/target

# Copy the generated JAR file to the specified directory
cp service/target/service-0.22.5.jar ~/Public/workspace/wintouch/dev_wintouch8/WebContent/WEB-INF/lib
