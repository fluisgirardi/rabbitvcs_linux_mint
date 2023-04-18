#!/bin/bash
sudo apt install git subversion nemo-python python3-svn python3-simplejson meld nemo python3-dbus python3-dulwich python3-git python3-tk gir1.2-gtkspell3-3.0 python3-setuptools
cd /tmp
git clone https://github.com/rabbitvcs/rabbitvcs.git
cd rabbitvcs
sudo python3 setup.py install install
if [ ! -d /usr/share/nemo-python/extensions ]; then
  sudo mkdir /usr/share/nemo-python/extensions;
fi

if [ ! -d /usr/share/rabbitvcs ]; then
  sudo mkdir /usr/share/rabbitvcs;
fi

sudo cp rabbitvcs/util/configspec/configspec.ini /usr/share/rabbitvcs

sudo cp clients/nemo/RabbitVCS.py /usr/share/nemo-python/extensions

sudo cp -rf data/icons/hicolor /usr/share/icons/
echo FOI
nemo -q
pgrep -f service.py | xargs kill
nohup nemo > /dev/null &

