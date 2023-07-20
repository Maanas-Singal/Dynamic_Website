#!/bin/bash

# Check if the script is running with root privileges
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root."
   exit 1
fi

# Update package list and install Apache
yum update
yum install -y httpd

# Start Apache service
systemctl start httpd

# Enable Apache to start on boot
systemctl enable httpd

# Directory to store website files
WEBSITE_DIR="/var/www/html"

# Create the directory if it doesn't exist
mkdir -p $WEBSITE_DIR

# Place your website files into the website directory
# For example, you can use 'wget' to download a sample website
# Replace the 'your-website-url' with the actual URL of your website files.
wget -qO- your-website-url | tar xvz -C $WEBSITE_DIR

# Set proper permissions for the website directory
chown -R apache:apache $WEBSITE_DIR
chmod -R 755 $WEBSITE_DIR

# Display Apache status
systemctl status httpd

echo "Apache web server has been installed, started, and configured with your website files."

## Save the above script to a file, for example, "install_apache_rhel.sh". 
## To run the script, make it executable using the following command: "chmod +x install_apache_rhel.sh"
## Then, execute the script with root privileges: "sudo ./install_apache_rhel.sh".
## The script will update the package list, install Apache, start the Apache service, enable it to start on boot, 
## create the directory to store website files, download and extract your website files into the specified directory, 
## set proper permissions for the website directory, and display the status of the Apache service. 
## Make sure to replace 'your-website-url' with the actual URL of your website files or modify the script accordingly if you already have the website files available locally.
