#!/bin/bash
# Update package list
sudo apt-get update

# Install Nginx
echo "Installing Nginx..."
sudo apt-get install -y nginx

# Deploy a simple index.html file to verify deployment
echo "Deploying custom index.html..."
cat << EOF | sudo tee /var/www/html/index.nginx-debian.html
<!DOCTYPE html>
<html>
<head>
<title>Nginx Deployment Success</title>
<style>
    body { font-family: Arial, sans-serif; background-color: #f0f0f0; text-align: center; padding-top: 50px; }
    h1 { color: #333; }
    p { color: #555; }
</style>
</head>
<body>
<h1>Nginx Deployed Successfully via GitHub Actions!</h1>
<p>VM Name: $(hostname)</p>
<p>Deployment Time: $(date)</p>
</body>
</html>
EOF

# Start Nginx service
echo "Starting Nginx service..."
sudo systemctl start nginx
sudo systemctl enable nginx

echo "Nginx setup complete."