## Installation de i3

i3 est un gestionnaire de fenetres oriente "Window tiling", libre, leger et super customizable.

### La base
`apt-get install i3`

Ce paquet comprend :
- **i3-wm**: le gestionnaire de fenêtre lui même.
- **i3lock**: permet de verouiller l'ecran.
- **i3bar**: une barre horizontale permettant d'afficher des infos systemes et les workspaces.
- **i3status**: utilitaire permettant d'afficher les informations dans i3bar.
- **i3-msg**: utilitaire permettant d'envoyer des commandes à i3 sans pour autant modifier le fichier de configuration.
- **suckless-tools**: ce paquet est requis pour l'utilitaire dmenu (launcher).

### i3-gaps
i3-gaps ajoute des features telles que des marges entre les windows.

Quelques libs necessaires (sans trop savoir ce qu'elles font exactement)
```
sudo apt install libxcb1-dev libxcb-keysyms1-dev libpango1.0-dev libxcb-util0-dev libxcb-icccm4-dev libyajl-dev libstartup-notification0-dev libxcb-randr0-dev libev-dev libxcb-cursor-dev libxcb-xinerama0-dev libxcb-xkb-dev libxkbcommon-dev libxkbcommon-x11-dev autoconf xutils-dev libtool
```
Recuperation des source :
```
cd /tmp
git clone https://www.github.com/Airblader/i3 i3-gaps
cd i3-gaps
git checkout gaps && git pull
```
Build & Install :
```
autoreconf --force --install
rm -rf build
mkdir build
cd build
../configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
```
