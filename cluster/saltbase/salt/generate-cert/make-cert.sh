#!/bin/bash

# Copyright 2014 Google Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

cert_dir=/srv/kubernetes
cert_file_owner=apiserver.apiserver

openssl req -new -newkey rsa:4096 -days 365 -nodes -x509 \
  -subj "/CN=kubernetes.invalid/O=Kubernetes" \
  -keyout "${cert_dir}/server.key" -out "${cert_dir}/server.cert"
chown $cert_file_owner "${cert_dir}/server.key" "${cert_dir}/server.cert"