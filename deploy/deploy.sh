#!/usr/bin/env bash

#ref. http://stackoverflow.com/a/246128/248616
SCRIPT_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

appConf=hello.conf
appDaemon=hello-app

echo "Setup daemon process info..."
sudo adduser $appDaemon --disabled-password -q
echo "Setup daemon process info...DONE"

echo "Un-register site..."
sudo a2dissite $appConf
echo "Un-register site... DONE"

echo "Register site..."
sitesAvailable=/etc/apache2/sites-available
sudo cp $SCRIPT_HOME/$appConf $sitesAvailable
sudo a2ensite $appConf -q
echo "Register site... DONE"

echo "Reload apache..."
sudo service apache2 --full-restart
echo "Reload apache... DONE"
