#!/usr/bin/env bash

# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

function usage {
    echo "$0 - 同步Apache http指定的目录"
    echo ""
    echo "Usage: $0 https://mirrors.aliyun.com/centos/7/os/x86_64/repodata/"
    exit 1
}

function get_url() {
    curl $BASE_DIR > $log_file




#    rm -rf $log_file
}

if [ "$1" = "-h" ]; then
    usage
fi

BASE_DIR="$1"
log_file=html.log

if [ "$BASE_DIR" = "" ]; then
    usage
fi

get_url