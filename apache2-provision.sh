#
# Copiar ficheros de configuración de apache2 que incluyen:
#
# - apache2.conf,
# - apolo.olimpo.test.conf
# - atenea.olimpo.test.conf
#

#!/bin/bash

echo "[+] Copiando archivos de configuración de Apache..."

# Copiar apache2.conf
cp -v /vagrant/files/mercurio.olimpo.test/apache2.conf /etc/apache2/apache2.conf

#Copiar archivo hurl para probar

cp -v /vagrant/files/mercurio.olimpo.test/weblab-1-en.hurl /home/weblab-1-en.hurl

# Copiar virtual hosts
cp -v /vagrant/files/mercurio.olimpo.test/apolo.olimpo.test.conf /etc/apache2/sites-available/
cp -v /vagrant/files/mercurio.olimpo.test/atenea.olimpo.test.conf /etc/apache2/sites-available/

# Habilitar los servidores virtuales
#
echo "[+] Habilitando sitios..."
a2ensite apolo.olimpo.test.conf
a2ensite atenea.olimpo.test.conf

echo "[+] Deshabilitando el sitio por defecto..."
a2dissite 000-default.conf

echo "[+] Activando módulos necesarios..."
a2enmod rewrite
#
# Reiniciar el servicio
#
echo "[+] Reiniciando Apache..."
systemctl restart apache2
systemctl status apache2 --no-pager
