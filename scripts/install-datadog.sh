
# Install the Datadog Agent using a secure install script
DD_API_KEY=$1 DD_SITE="datadoghq.com" bash -c "$(curl -L https://s3.amazonaws.com/dd-agent/scripts/install_script.sh)"

# Enable and start the agent
systemctl enable datadog-agent
systemctl start datadog-agent
