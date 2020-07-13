#!/bin/bash
sudo apt install git subversion nemo-python python3-svn python3-simplejson meld nemo python3-dbus python3-dulwich python3-git python3-tk gir1.2-gtkspell3-3.0
cd /tmp
git clone https://github.com/rabbitvcs/rabbitvcs.git
cd rabbitvcs
sudo python setup.py install --install-layout=deb
if [ ! -d /usr/share/nemo-python/extensions ]; then
  sudo mkdir /usr/share/nemo-python/extensions;
fi
sudo cp clients/nemo/RabbitVCS.py /usr/share/nemo-python/extensions

nemo -q
pgrep -f service.py | xargs kill
nohup nemo > /dev/null &
