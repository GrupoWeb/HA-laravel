FROM debian:testing

MAINTAINER jjolon version 1

# Instalar apache, php y librerías necesarias.

RUN apt-get update && \
    apt install apache2 libapache2-mod-php && \
    apt install mysql-server && \
    apt install php-mysql php-xml php-mbstring 

    
# Instalar algunos utilitarios.
RUN apt-get install -y curl unzip git && \
    apt-get install -y nano


# Habilitar mods de apache.
RUN a2enmod rewrite

# Exponer apache.
EXPOSE 80

# Actualice el sitio de apache predeterminado con la configuración que creamos.

ADD apache.conf /etc/apache2/sites-enabled/000-default.conf

RUN service apache2 restart

CMD /usr/sbin/apache2ctl -D FOREGROUND
