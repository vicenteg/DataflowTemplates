package com.google.cloud.teleport.v2.templates;

import org.apache.beam.runners.dataflow.options.DataflowPipelineOptions;
import org.apache.beam.sdk.options.Description;
import org.apache.beam.sdk.options.PipelineOptions;

/**
 * Interface providing options for Kafka clusters. Additional options are passed in a properties
 * file, which can be pulled from a Cloud Storage path.
 */
public interface KafkaSecurityOptions extends PipelineOptions, DataflowPipelineOptions {
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
