# 
# MIT License
#
# Copyright (c) 2018 Saniya Tech Inc.
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this software and
# associated documentation files (the "Software"), to deal in the Software without restriction, 
# including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
# and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so,
# subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies or substantial
# portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT
# LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
# WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
# 
# 


FROM openjdk:8-jdk

MAINTAINER Saniya Tech <saniyatech@gmail.com>

##### Update repositories; install openssh #####
RUN apt-get update \
      && apt-get install -y openssh-server \
      && rm -rf /var/cache/apt/*

##### Setup password-less ssh (needed by Spark) #####
WORKDIR /root/.ssh

RUN set -x \
      && ssh-keygen -t rsa -f id_rsa -N "" \
      && cat "id_rsa.pub" >> "authorized_keys"

##### Spark Environment Vars #####
ENV INSTALL_DIR /usr/local
ENV SPARK_HOME $INSTALL_DIR/spark
ENV SPARK_VERSION 2.3.2
ENV HADOOP_VERSION 2.7
ENV SPARK_TGZ_URL https://www.apache.org/dist/spark/spark-$SPARK_VERSION/spark-$SPARK_VERSION-bin-hadoop$HADOOP_VERSION.tgz

##### Install Spark with HDFS #####
RUN set -x \
      && cd "$INSTALL_DIR" \
      && curl -fSL "$SPARK_TGZ_URL" -o spark.tgz \
      && tar -xzf spark.tgz \
      && mv spark-* spark \
      && rm spark.tgz

WORKDIR "$SPARK_HOME"

##### Expose ports #####
EXPOSE 22 4040 6066 7077 7078 8080 8081 8888
