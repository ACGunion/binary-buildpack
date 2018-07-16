#!/bin/bash
set -euo pipefail
PHP_VERSION="7.2.7"
NGINX_VERSION="1.14.0"

echo "--------------------> Download PHP${PHP_VERSION} From SourceForge"

curl -s -L --retry 15 --retry-delay 2 https://sourceforge.net/projects/bkunger-luemix-buildpack/files/Bluemix_PHP/PHP_FPM/PHP_${PHP_VERSION}.zip/download -o /tmp/PHP_${PHP_VERSION}.zip

echo "--------------------> Download NGINX${NGINX_VERSION}(Kunger's Bluemix Web Server) From SourceForge"

curl -s -L --retry 15 --retry-delay 2 https://sourceforge.net/projects/bkunger-luemix-buildpack/files/Bluemix_PHP/NGINX/NGINX_${NGINX_VERSION}.zip/download -o /tmp/NGINX_${NGINX_VERSION}.zip

echo "--------------------> Download PHP${PHP_VERSION} Deps FROM SourceForge"

curl -s -L --retry 15 --retry-delay 2 https://sourceforge.net/projects/bkunger-luemix-buildpack/files/Bluemix_PHP/PHP_DEP/PHP_${PHP_VERSION}_DEPS.zip/download -o /tmp/PHP_${PHP_VERSION}_DEPS.zip

echo "--------------------> Download Completed"

echo "--------------------> Extracting Data"
unzip -q /tmp/PHP_${PHP_VERSION}.zip -d /tmp/app
echo "--------------------> PHP Extract Completed"
unzip -q /tmp/NGINX_${NGINX_VERSION}.zip -d /tmp/app
echo "--------------------> NGINX Extract Completed"
unzip -q /tmp/PHP_${PHP_VERSION}_DEPS.zip -d /tmp/app
echo "--------------------> PHP_DEPS Extract Completed"

echo "--------------------> Web Folder Pretreatment"

curl -s -L --retry 15 --retry-delay 2 https://sourceforge.net/projects/bkunger-luemix-buildpack/files/Bluemix_PHP/htdocs.zip/download -o /tmp/htdocs.zip
unzip -q /tmp/htdocs.zip -d /tmp/app
echo "It Works!" >> /tmp/app/htdocs/index.html

echo "--------------------> Install Completed"
