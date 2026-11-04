#!/bin/bash
set -e

export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
export HADOOP_HOME=/opt/hadoop
export HADOOP_CONF_DIR=$HADOOP_HOME/etc/hadoop
export PATH="$PATH:$HADOOP_HOME/bin:$HADOOP_HOME/sbin"

cd /opt/hadoop/share/hadoop/mapreduce

JAR="hadoop-mapreduce-examples-3.3.6.jar"
BASE="/tmp/equipo1"

# Ejemplo introductorio: cinco palabras
rm -rf "$BASE/salida_mean" "$BASE/salida_median"
hadoop jar "$JAR" wordmean "$BASE/datos/palabras.txt" "$BASE/salida_mean"
hadoop jar "$JAR" wordmedian "$BASE/datos/palabras.txt" "$BASE/salida_median"

# Demostracion principal: centros de datos
rm -rf "$BASE/salida_noticia_mean" "$BASE/salida_noticia_median"
hadoop jar "$JAR" wordmean "$BASE/datos/tecnologia.txt" "$BASE/salida_noticia_mean"
hadoop jar "$JAR" wordmedian "$BASE/datos/tecnologia.txt" "$BASE/salida_noticia_median"

# Mini ejercicio: ciberseguridad
rm -rf "$BASE/ejercicio/salida_mean" "$BASE/ejercicio/salida_median"
hadoop jar "$JAR" wordmean "$BASE/ejercicio/ciberseguridad.txt" "$BASE/ejercicio/salida_mean"
hadoop jar "$JAR" wordmedian "$BASE/ejercicio/ciberseguridad.txt" "$BASE/ejercicio/salida_median"