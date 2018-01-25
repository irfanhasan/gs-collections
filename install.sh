#!/bin/bash
mvn install -DskipTests=true -Dmaven.javadoc.skip=true -Drat.skip=true -B -V
