Vagrant.configure("2") do |config|
  config.vm.box = "ubuntu/jammy64"
  config.vm.hostname = "lucee-dev"

  # Porta 80 VM -> 8080 host
  config.vm.network "forwarded_port", guest: 80, host: 8080
  # Porta 21 FTP
  config.vm.network "forwarded_port", guest: 21, host: 2121
  # Porte passive FTP (range consigliato)
  config.vm.network "forwarded_port", guest: 30000, host: 30000
  config.vm.network "forwarded_port", guest: 30001, host: 30001
  config.vm.network "forwarded_port", guest: 3306, host: 3306

  # Cartella condivisa
  config.vm.synced_folder "./www", "/var/www/html"

  config.vm.provider "virtualbox" do |vb|
    vb.memory = 2048
    vb.cpus = 2
  end

  config.vm.provision "shell", inline: <<-SHELL
    # Aggiorna pacchetti
    apt-get update -y

    # Installa Java 17
    apt-get install -y software-properties-common wget gnupg2
    add-apt-repository ppa:openjdk-r/ppa -y
    apt-get update -y
    apt-get install -y openjdk-17-jre-headless

    # Imposta Java 17
    update-alternatives --set java /usr/lib/jvm/java-17-openjdk-amd64/bin/java

    # Apache + MySQL
    DEBIAN_FRONTEND=noninteractive apt-get install -y apache2 mysql-server

    # Lucee
    wget -O lucee-installer.run https://cdn.lucee.org/lucee-6.2.1.122-linux-x64-installer.run
    chmod +x lucee-installer.run
    ./lucee-installer.run --mode unattended --luceepass admin
    rm -f lucee-installer.run

    # Apache config
    a2enmod proxy proxy_http rewrite
    cat > /etc/apache2/sites-available/000-default.conf <<EOF
<VirtualHost *:80>
  ServerName localhost
  DocumentRoot /var/www/html

  <Directory /var/www/html>
    Options Indexes FollowSymLinks
    AllowOverride All
    Require all granted
  </Directory>

  ProxyPassMatch ^/(.+\\.cf[cm]) http://127.0.0.1:8080/$1
</VirtualHost>
EOF

    systemctl restart apache2

    # MySQL root senza password
    mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY ''; FLUSH PRIVILEGES;"

    # === FTP Server ===
    apt-get install -y vsftpd

    # Crea utente ftpuser senza shell
    useradd -m ftpuser -s /usr/sbin/nologin
    echo "ftpuser:ftp123" | chpasswd

    # Imposta home dell'utente a /var/www/html
    usermod -d /var/www/html ftpuser
    chown ftpuser:ftpuser /var/www/html

    # Configura vsftpd
    cp /etc/vsftpd.conf /etc/vsftpd.conf.orig
    cat > /etc/vsftpd.conf <<EOF
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
chroot_local_user=YES
allow_writeable_chroot=YES
local_umask=022
pasv_enable=YES
pasv_min_port=30000
pasv_max_port=30001
user_sub_token=\$USER
local_root=/var/www/html
seccomp_sandbox=NO
EOF

    systemctl restart vsftpd
  SHELL
end
