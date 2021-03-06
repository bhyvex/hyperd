#!/bin/bash

OS=`uname`

if [ "x$OS" == "xDarwin" ] ; then
    cd /tmp
    curl -sSL https://github.com/google/protobuf/releases/download/v3.1.0/protoc-3.1.0-osx-x86_64.zip -o protoc-3.1.0-osx-x86_64.zip
    unzip protoc-3.1.0-osx-x86_64.zip
    sudo mv bin/protoc /usr/local/bin/protoc
else
    which yum>/dev/null
    if [[ $? != 0 ]]; then
      sudo apt-get install -y unzip
    else
      sudo yum install -y unzip
    fi


    # Install protoc
    cd /tmp
    curl -sSL https://github.com/google/protobuf/releases/download/v3.1.0/protoc-3.1.0-linux-x86_64.zip -o protoc-3.1.0-linux-x86_64.zip
    unzip protoc-3.1.0-linux-x86_64.zip
    sudo mv bin/protoc /usr/bin/protoc
fi

echo "protoc installed success."
