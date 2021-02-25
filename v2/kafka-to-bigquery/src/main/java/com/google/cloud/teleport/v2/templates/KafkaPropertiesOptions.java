/*
 * Copyright (C) 2021 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.google.cloud.teleport.v2.templates;

import org.apache.beam.runners.dataflow.options.DataflowPipelineOptions;
import org.apache.beam.sdk.options.Description;
import org.apache.beam.sdk.options.PipelineOptions;

/**
 * Interface providing options for Kafka clusters. Additional options are passed in a properties
 * file, which can be pulled from a Cloud Storage path.
 */
public interface KafkaPropertiesOptions extends PipelineOptions, DataflowPipelineOptions {
  @Description("GCS path to properties file to be passed to the Kafka consumer.")
  String getKafkaConsumerProperties();
  void setKafkaConsumerProperties(String pathToProperties);

  @Description("GCS path to properties file to be passed to the Kafka producer.")
  String getKafkaProducerProperties();
  void setKafkaProducerProperties(String pathToProperties);

  @Description("GCS path to properties to be passed to the JVM in workers.")
  String getSystemProperties();
  void setSystemProperties(String pathToProperties);
}
