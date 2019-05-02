FROM debian:testing

# Instalar apache, php y librerías necesarias.

RUN apt-get update && \
    apt-get install -y apache2  && \
    apt-get install -y php php-mysql php-curl php-gd php-mbstring php-xml && \
    apt-get install -y libapache2-mod-php


# Instalar algunos utilitarios.
RUN apt-get install -y curl unzip git && \
    apt-get install -y vim nano apt-utils


# Habilitar mods de apache.
RUN a2enmod rewrite

# Exponer apache.
EXPOSE 80

# Actualice el sitio de apache predeterminado con la configuración que creamos.

ADD apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN service apache2 restart

CMD /usr/sbin/apache2ctl -D FOREGROUND
