#Automize the debian WM/DE setup

#Arguments 1:WM(i3,hlw,b2wm) 2:basic DE(n,y) 3:basic X system(n,y) 4:julia(n,y)

#Basic X system
if [ $3 == 'y' ]; then
 echo "Intstalling Xorg..."
 sudo apt-get install Xorg
 touch ~/.xsession
fi

#WM
if [ $1 == 'i3' ]; then
	echo $1
fi

if [ $1 == 'hlw' ]; then
  echo "Installing HLW..."
	sudo apt-get install herbstluftwm
	sleep 5
	mkdir -p ~/.config/herbstluftwm
	cp /etc/xdg/herbstluftwm/autostart ~/.config/herbstluftwm
	echo "exec herbstluftwm --locked" >> ~/.xsession
fi

#Basic DE
if [ $2 == 'y' ]; then
	echo "Installing basic DE..."
	sudo apt-get install suckless-tools
	
	sudo apt-get install xbindkeys
	echo "xbindkeys &" >> ~/.xsession
	xbindkeys -d > ~/.xbindkeysrc
	
	echo '"exec dmenu_run"' >> ~/.xbindkeysrc
	echo " alt + d" >> ~/.xbindkeysrc
	
	echo '"amixer set Front 10%+"' >> ~/.xbindkeysrc
        echo " alt + q" >> ~/.xbindkeysrc	
	echo '"amixer set Front 10%-"' >> ~/.xbindkeysrc
	echo " alt + w" >> ~/.xbindkeysrc 

	echo '"exec dwb"' >> ~/.xbindkeysrc 
	echo " alt + b" >> ~/.xbindkeysrc 

	echo '"exec vim"' >> ~/.xbindkeysrc
	echo " alt + v" >> ~/.xbindkeysrc 

	sudo apt-get update
	sudo apt-get install alsa-utils
	sudo apt-get install dwb
	sudo apt-get install vim
	sudo apt-get install ranger
	sudo apt-get install iceweasel

	echo "deb ftp://ftp.debian.org/debian stable main contrib non-free" >> /etc/apt/sources.list
	sudo apt-get update
	sudo apt-get install flashplugin-nonfree
fi

#Make julia
if [ $4 == 'y' ]; then
 echo "Building julia from source..."
 sudo apt-get install gfortran gcc g++ ncurses-dev
 git clone git://github.com/JuliaLang/julia
 cd julia
 sleep 5
 make
fi

