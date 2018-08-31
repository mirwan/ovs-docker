# Copyright 2018 Cisco Systems Inc. All rights reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# OVS Docker image

FROM alpine:3.7
LABEL maintainer "Cisco Contiv (https://contiv.github.io)"

RUN mkdir -p /etc/openvswitch \
 && echo 'http://dl-cdn.alpinelinux.org/alpine/v3.4/main' >> /etc/apk/repositories \
 && apk --no-cache add \
      openvswitch=2.5.0-r0 ca-certificates bash
ENV OVSVSWITCHD_EXTRA_FLAGS "-v"
ENV OVSDBSERVER_EXTRA_FLAGS ""
COPY runtime-scripts/ /scripts/
