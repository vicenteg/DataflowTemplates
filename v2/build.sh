source ./template_env.sh

# Build and push image to GCR
mvn clean package -Dimage="${TARGET_GCR_IMAGE}" \
                  -Dbase-container-image="${BASE_CONTAINER_IMAGE}" \
                  -Dbase-container-image.version="${BASE_CONTAINER_IMAGE_VERSION}" \
                  -Dapp-root="${APP_ROOT}" \
                  -Dcommand-spec="${COMMAND_SPEC}" \
                  -am -pl "${TEMPLATE_MODULE}" && \
  gcloud dataflow flex-template build $TEMPLATE_IMAGE_SPEC \
    --image-gcr-path "$TARGET_GCR_IMAGE" \
    --sdk-language "JAVA"  \
    --flex-template-base-image JAVA8  \
    --metadata-file "kafka-to-bigquery/metadata.json"  \
    --jar "kafka-to-bigquery/target/kafka-to-bigquery-1.0-SNAPSHOT.jar"  \
    --env FLEX_TEMPLATE_JAVA_MAIN_CLASS="com.google.cloud.teleport.v2.templates.KafkaToBigQuery"
