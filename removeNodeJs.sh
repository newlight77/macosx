
brew uninstall node;
brew prune;

rm -fr ~/.npm
rm -fr ~/.node-gyp

lsbom -f -l -s -pf /var/db/receipts/org.nodejs.pkg.bom | while read f; do sudo rm /usr/local/${f}; done
sudo rm -rf /usr/local/include/node
sudo rm -rf /usr/local/lib/node
sudo rm -fr /usr/local/lib/node_modules
sudo rm -fr /var/db/receipts/org.nodejs.*


#sudo rm -rf /usr/local/bin/npm
#sudo rm -rf /usr/local/lib/node
#sudo rm -rf /usr/local/lib/include/node
#sudo rm -rf /usr/local/lib/node_modules
#sudo rm -rf /usr/local/lib/dtrace/node.d
#sudo rm -rf /usr/local/share/man/man*/node*
#sudo rm -rf /usr/local/share/man/man*/npm*
#sudo rm -rf /var/db/receipts/org.nodejs.*
#sudo rm -fr /usr/local/share/doc/node
