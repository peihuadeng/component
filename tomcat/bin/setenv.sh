#!/bin/sh
#Tomcat命令脚本,应放置在${CATALINA_BASE}/bin目录下

#JAVA_HOME= #jdk路径，一般应设置为全局
#JAVA_OPTS= #jvm参数设置(包括启动、停止等)，一般设置CATALINA_OPTS即可

CATALINA_PID=${CATALINA_BASE}/logs/catalina.pid #tomcat实例pid文件存储路径
CATALINA_OPTS="
-server
-Xms128m
-Xmx768m
-XX:PermSize=64m
-XX:MaxPermSize=256m
-XX:MetaspaceSize=64m
-XX:MaxMetaspaceSize=256m
-XX:+UseParNewGC
-XX:+UseConcMarkSweepGC
-XX:+PrintClassHistogram
-XX:+PrintGCDetails
-XX:+PrintGCTimeStamps
-XX:+PrintHeapAtGC
-Xloggc:${CATALINA_BASE}/logs/gc.log
-XX:+HeapDumpOnOutOfMemoryError 
-XX:HeapDumpPath=${CATALINA_BASE}/logs" #tomcat jvm启动参数设置（仅start、run、debug）