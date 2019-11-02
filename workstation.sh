#!/bin/bash
echo "Iniciando atualizacao do sistema"
sleep 1
clear
sudo dnf update
clear
echo "Iniciando instalacao dos aplicativos"
sleep 1
clear
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak install flathub com.skype.Client
flatpak install flathub org.telegram.desktop
flatpak install flathub com.slack.Slack
flatpak install flathub org.kde.krita
flatpak install flathub com.spotify.Client

#Ambiente de desenvolvimento
flatpak install flathub com.anydesk.Anydesk
flatpak install flathub io.dbeaver.DBeaverCommunity
flatpak install flathub com.jetbrains.DataGrip
flatpak install flathub org.filezillaproject.Filezilla
flatpak install flathub com.visualstudio.code
flatpak install flathub com.sublimetext.three

sudo dnf install git
sudo dnf -y install php  php-cli php-fpm php-mysqlnd php-zip php-devel php-gd php-mcrypt php-mbstring php-curl php-xml php-pear php-bcmath php-json
clear
echo "Iniciando instalacao do composer"
sleep 1
clear
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === 'a5c698ffe4b8e849a443b120cd5ba38043260d5c4023dbf93e1558871f1f07f58274fc6f4c93bcfd858c6bd0775cd8d1') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

sudo mv composer.phar /usr/bin/composer
clear
echo "Iniciando instalacao do docker"
sleep 1
clear
sudo dnf install docker-ce docker-ce-cli containerd.io
sudo usermod -aG docker $USER
clear
sudo dnf -y install docker-compose
clear
echo "Instalacao finalizada com sucesso!"