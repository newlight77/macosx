#!/bin/bash

DIR=${0%/*}
echo "current dir: " $DIR

if [ ! -d "$DIR" ]; then DIR="$PWD"; fi

. "$DIR/installSystemTools.sh"
. "$DIR/installDevTools.sh"

# Installing System Tools
addRepository
configureTime
installHomeBrew
installNodejs

# Installing Dev Tools
createAppsDir
installCassandra
#installCassandraAdmin
installMaven
installTomcat
#installVSCode
installDevCenter
#installNetbeans
installIdea
installEclipse
installScala
installSbt
installGradle
installPacker
installMongo
installGrails
installAnt
customizeNpm
addToPath
changeAppsRights
