#!/bin/bash

# Wazuh Manager IP Address (replace with your Wazuh Manager IP or hostname)
WAZUH_MANAGER_IP="your_wazuh_manager_ip"

# Update the system and install required dependencies
echo "Updating system and installing dependencies..."
apt-get update && apt-get install -y curl apt-transport-https lsb-release

# Download and install the Wazuh repository
echo "Adding Wazuh repository..."
curl -s https://packages.wazuh.com/key/GPG-KEY-WAZUH | apt-key add -
echo "deb https://packages.wazuh.com/4.x/apt/ stable main" > /etc/apt/sources.list.d/wazuh.list

# Update apt repositories
echo "Updating apt repositories..."
sudo apt-get update

# Install the Wazuh agent
echo "Installing Wazuh agent..."
sudo apt-get install -y wazuh-agent

# Configure the Wazuh agent
echo "Configuring Wazuh agent..."
sed -i "s/^server = .*$/server = $WAZUH_MANAGER_IP/" /etc/wazuh-agent/configuration.yml

# Start the Wazuh agent service
echo "Starting Wazuh agent..."
sudo systemctl enable wazuh-agent
sudo systemctl start wazuh-agent

# Check if the agent is running
echo "Checking Wazuh agent status..."
sudo systemctl status wazuh-agent

echo "Wazuh agent setup completed successfully!"
