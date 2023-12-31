#!/bin/bash -eu
# Remember to make this scrip executable by running command chmod +x stop-sling.sh
# Function to gracefully stop Apache Sling
stop_sling() {
    # Find the PID of the Java process running Apache Sling Launcher
    PID=$(pgrep -f "org.apache.sling.feature.launcher")
    # PID=$(ps -ef | grep java | grep "org.apache.sling.feature.launcher" | awk '{print $2}')
    echo PID=$PID

    if [ -z "$PID" ]; then
        echo "Apache Sling Launcher is not running."
    else
        echo "Stopping Apache Sling Launcher (PID: $PID)..."
        kill -INT "$PID"
    fi
}

# Call the stop_sling function
stop_sling
