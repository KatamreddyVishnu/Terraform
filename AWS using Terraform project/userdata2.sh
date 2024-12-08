#!/bin/bash
# Update and install necessary packages
apt-get update -y
apt-get install -y apache2 curl

# Get the public IP of the EC2 instance
INSTANCE_IP=$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4)

# Create an HTML page
cat <<EOF > /var/www/html/index.html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>EC2 Instance Website</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 50px;
            background-image: linear-gradient(0deg, rgba(0, 0, 0, 0.1), rgba(0, 0, 0, 0.1)), url('');
            color: #333;
        }
        h1 {
            font-size: 3em;
        }
        .background-text {
            position: fixed;
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%) rotate(0deg);
            font-size: 10em;
            color: rgba(200, 200, 200, 0.2);
            z-index: -1;
        }
    </style>
</head>
<body>
    <h1>Welcome to EC2 Instance</h1>
    <h2>Your instance public IP is: $INSTANCE_IP</h2>
    <div class="background-text">VISHNU VARDHAN</div>
</body>
</html>
EOF

# Restart Apache to apply changes
systemctl restart apache2
