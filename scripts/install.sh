#!/bin/bash
if [ $(id -u) -eq 0]; then
  echo "Do not run as root!"
  exit 1
fi

# unlock rpmfusion
sudo dnf install \
	https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
	https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

# synchronize package database
sudo dnf upgrade -y 

# install packages
cat ./pkglist/pkglist.txt | xargs sudo dnf -y -allowerasing install

# install flatpak
sudo flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
while read -r line; do
    yes | sudo flatpak install $line
done < ./pkglist/flatpak.txt
