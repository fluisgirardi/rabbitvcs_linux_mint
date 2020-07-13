#!/bin/bash
sudo apt install git subversion python-svn python-simplejson meld caja python-caja python-dbus python-dulwich python-git python-tk gir1.2-gtkspell3-3.0
cd /tmp
git clone https://github.com/rabbitvcs/rabbitvcs.git
cd rabbitvcs
sudo python setup.py install --install-layout=deb
if [ ! -d /usr/share/caja-python/extensions ]; then
  sudo mkdir /usr/share/caja-python/extensions;
fi
sudo cp clients/caja/RabbitVCS.py /usr/share/caja-python/extensions

caja -q
pgrep -f service.py | xargs kill
nohup caja > /dev/null &
