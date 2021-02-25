#!/bin/bash
# Copyright (C) 2021 Google Inc.
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#     http://www.apache.org/licenses/LICENSE-2.0
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Set environment variables here to configure the build and running of the
# Kafka to BigQuery flex template.

export PROJECT="${PROJECT:-$(gcloud config get-value project)}"
export BUCKET_NAME="${BUCKET_NAME:-gs://${PROJECT}-dataflow}"

# No need to change these.
export IMAGE_NAME="kafka-to-bigquery-flex-template"
export TARGET_GCR_IMAGE="gcr.io/${PROJECT}/${IMAGE_NAME}"
export BASE_CONTAINER_IMAGE=gcr.io/dataflow-templates-base/java8-template-launcher-base
export BASE_CONTAINER_IMAGE_VERSION=latest
export TEMPLATE_MODULE=kafka-to-bigquery
export APP_ROOT="/template/${TEMPLATE_MODULE}"
export COMMAND_SPEC="${APP_ROOT}/resources/${TEMPLATE_MODULE}-command-spec.json"
export TEMPLATE_IMAGE_SPEC="${BUCKET_NAME}/images/${TEMPLATE_MODULE}-image-spec.json"
