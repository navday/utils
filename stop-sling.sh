#!/bin/bash -eu

# Function to gracefully stop Apache Sling
stop_sling() {
    # Find the PID of the Java process running Apache Sling Launcher
    PID=$(ps -ef | grep java | grep "org.apache.sling.feature.launcher.jar" | awk '{print $2}')

    if [ -z "$PID" ]; then
        echo "Apache Sling Launcher is not running."
    else
        echo "Stopping Apache Sling Launcher (PID: $PID)..."
        kill -INT "$PID"
    fi
}

# Call the stop_sling function
stop_sling
Make the script executable:

bash
Copy code
chmod +x stop-sling.sh
Now, you can run the script with ./stop-sling.sh, and it will gracefully stop the Apache Sling Launcher instance running on the server by sending the SIGINT signal to the Java process.

Please ensure that the script has the necessary permissions and that you are running it with appropriate privileges to access process information and stop the Apache Sling Launcher. Also, consider placing the script in a location accessible to your user or adding it to the system's PATH so that you can execute it conveniently. As always, test the script to ensure it works as expected before using it in a production environment.




User
Can you also give me a start script to launch apache sling launcher as background service so I don't see any output in terminal window and the service doesn't stop if I close the terminal window.
ChatGPT
Certainly! Below is a script that allows you to start the Apache Sling Launcher as a background service on a Linux server. This script redirects the output to /dev/null so that you don't see any output in the terminal window, and it uses the nohup command to prevent the service from stopping when the terminal is closed.

Create a new file, for example, start-sling.sh, and add the following content:

bash
Copy code
#!/bin/bash

# Function to start Apache Sling in the background
start_sling() {
    # Change to the directory containing the Apache Sling Launcher JAR file
    cd /path/to/sling/directory

    # Start Apache Sling Launcher as a background process and redirect output to /dev/null
    nohup java -jar org.apache.sling.feature.launcher.jar -f target/slingfeature-tmp/feature-oak_tar.json > /dev/null 2>&1 &
}

# Call the start_sling function
start_sling

echo "Apache Sling Launcher started in the background."
Replace /path/to/sling/directory with the actual path to the directory containing the Apache Sling Launcher JAR file and make sure the path is correct.

Make the script executable:

bash
Copy code
chmod +x start-sling.sh
Now, you can run the script with ./start-sling.sh, and it will start the Apache Sling Launcher as a background service. You won't see any output in the terminal window, and the service will continue running even if you close the terminal.

Please ensure that the script has the necessary permissions and that you are running it with appropriate privileges to access the Apache Sling Launcher and start it as a background process. As always, test the script to ensure it works as expected before using it in a production environment.








# Function to start Apache Sling in the background
start_sling() {
    # Start Apache Sling Launcher as a background process and redirect output to /dev/null
    nohup java -jar ../sling-org-apache-sling-starter/target/dependency/org.apache.sling.feature.launcher.jar -f ../sling-org-apache-sling-starter/target/slingfeature-tmp/feature-app.json > /dev/null 2>&1 &
}

# Call the start_sling function
start_sling

echo "Apache Sling Launcher started in the background."