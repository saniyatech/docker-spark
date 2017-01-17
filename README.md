# docker-spark

### Docker Image for Apache Spark

[![GitHub version](https://badge.fury.io/gh/saniyatech%2Fdocker-spark.svg)](https://badge.fury.io/gh/saniyatech%2Fdocker-spark) ![License: MIT][MIT-License]

#### Overview

The image is built on top of OpenJDK (8-jdk). The latest version (2.1.0) of Apache Spark is installed in this image. Additionally, ssh has been installed and set-up to be executed password-less. For Apache Spark to be deployed in cluster mode, password-less ssh setup is mandatory.

#### Running in Local mode:

Apache Spark can be executed in local mode without any additional setup.

Start the Docker image by executing the Docker `run` command passing `/bin/sh` command option to start an interactive shell session.

```shell
docker run -it docker-spark /bin/sh
```

Once an interactive shell session has been established for the Docker container, Spark shell can be started to execute code against Spark in local mode using Scala programming language as follows:

```shell
$SPARK_HOME/bin/spark-shell --master local[2]
```

#### Running in Cluster mode:

Coming soon via a blog post. Stay tuned!

#### Supported Apache Spark Versions:

##### Apache Spark latest [v2.1.0]

[Dockerfile for Apache Spark v2.1.0](https://github.com/saniyatech/docker-spark/tree/v2.1.0)


[MIT-License]: https://img.shields.io/badge/License-MIT-yellow.svg "MIT License"
