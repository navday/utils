#!/bin/bash -eu
# Remember to make this scrip executable by running command chmod +x start-sling.sh
# Function to start Apache Sling in the background
start_sling() {
    cd ../sling-org-apache-sling-starter
    # Start Apache Sling Launcher as a background process and redirect output to /dev/null
    #nohup java -jar target/dependency/org.apache.sling.feature.launcher/bin/launcher -f target/slingfeature-tmp/feature-oak_tar.json > /dev/null 2>&1 &
    target/dependency/org.apache.sling.feature.launcher/bin/launcher -f target/slingfeature-tmp/feature-oak_tar.json > /dev/null 2>&1 &

}

# Call the start_sling function
start_sling

echo "Apache Sling Launcher started in the background."