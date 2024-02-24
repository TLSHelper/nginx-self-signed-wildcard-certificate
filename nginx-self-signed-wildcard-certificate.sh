#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <server_FQDN>"
    exit 1
fi

SERVER_FQDN=$1

# subjectAltName
SAN="DNS:$SERVER_FQDN,DNS:*.$SERVER_FQDN"

# Generate Root Key and Certificate
openssl genrsa -out root.key
openssl req -x509 -new -key root.key -days 7300 -out root.crt -subj "/O=nginx/OU=nginx/CN=RootCA"

# Generate Server Key
openssl genrsa -out server.key

# Generate Certificate Signing Request (CSR)
openssl req -new -key server.key -out server.csr -subj "/C=XX/ST=XX/O=nginx/OU=nginx/CN=$SERVER_FQDN"

# Sign the CSR with the Root CA
openssl x509 -req -extfile <(printf "subjectAltName=$SAN") -days 3650 -in server.csr -CA root.crt -CAkey root.key -CAcreateserial -out server.crt

# Create Full Chain Certificate
cat server.crt root.crt > fullchain.crt

# Cleanup 
rm root.srl
rm server.csr
rm server.crt

echo "Certificates generated successfully in the $CERT_DIR directory:"
echo "  Root Certificate: root.crt"
echo "  Server Key: server.key"
echo "  Full Chain Certificate: fullchain.crt"
echo ""
echo "  fullchain.crt & server.key go into nginx configuration file"
echo "  Install root.crt on client systems"
