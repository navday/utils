#!/bin/bash -eu

# Function to start Apache Sling in the background
start_sling() {
    # Start Apache Sling Launcher as a background process and redirect output to /dev/null
    nohup java -jar ../sling-org-apache-sling-starter/target/dependency/org.apache.sling.feature.launcher.jar -f ../sling-org-apache-sling-starter/target/slingfeature-tmp/feature-app.json > /dev/null 2>&1 &
}

# Call the start_sling function
start_sling

echo "Apache Sling Launcher started in the background."