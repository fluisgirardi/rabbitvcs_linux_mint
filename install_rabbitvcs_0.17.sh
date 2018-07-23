#!/bin/bash
sudo apt install git subversion nemo-python python-svn python3-svn python-simplejson python3-simplejson meld nemo nemo-python python-dbus python-dulwich python3-dulwich python-git python3-git
cd /tmp
git clone https://github.com/rabbitvcs/rabbitvcs.git
cd rabbitvcs
sudo python setup.py install --install-layout=deb
if [ ! -d /usr/share/nemo-python/extensions ]; then
  sudo mdkir /usr/share/nemo-python/extensions;
fi
sudo cp clients/nemo/RabbitVCS.py /usr/share/nemo-python/extensions

nemo -q
pgrep -f service.py | xargs kill
nohup nemo > /dev/null &