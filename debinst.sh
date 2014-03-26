# post install setup of debian

#Sudo
apt-get install sudo
sleep 3
adduser petter sudo
su - petter
sleep 3

#Pull files from github
mkdir -p ~/.gitfiles
cd ~/.gitfiles
sleep 3
git clone git://github.com/petternygren/dots/Xdefaults
sleep 3
git clone git://github.com/petternygren/dots/autostart
sleep 3
\cd

#WM hlwm
sudo apt-get install herbstluftwm
mkdir -p ~/.config/herbstluftwm
#cp /etc/xdg/herbstluftwm/autostart ~/.config/herbstluftwm #for default config
cp ~/.gitfiles/autostart ~/.config/herbstluftwm
#Terminal
cp ~/.gitfiles/Xdefaults ~/.Xdefaults

echo "exec herbstluftwm --locked" >> ~/.xsession
sleep 3
#Sublime
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3047_amd64.deb
sudo dpkg -i sublime-text_build-3047_i386.deb

#Flash
echo "deb ftp://ftp.debian.org/debian stable main contrib non-free" >> add to /etc/apt/sources.list
sleep 3
sudo apt-get update
sudo apt-get install flashplugin-nonfree

#Sound
sudo apt-get install alsa-utils
#amixer set Front 10%+