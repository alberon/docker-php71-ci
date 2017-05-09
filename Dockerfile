FROM php:7.1

# Add APT repositories
RUN bash -c 'curl -sL https://deb.nodesource.com/setup_6.x | bash -'
RUN bash -c 'curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -'
RUN bash -c 'echo "deb https://dl.yarnpkg.com/debian/ stable main" > /etc/apt/sources.list.d/yarn.list'

# Update and install dependencies
RUN apt-get install apt-transport-https

RUN apt-get update -yqq && \
    apt-get install -yqq \
        bzip2 \
        chromium \
        git \
        libaspell-dev \
        libbz2-dev \
        libcurl4-gnutls-dev \
        libexpat1-dev \
        libfontconfig1 \
        libfontconfig1-dev \
        libfreetype6 \
        libfreetype6-dev \
        libgmp3-dev \
        libicu-dev \
        libjpeg-dev \
        libldap2-dev \
        libmcrypt-dev \
        libpcre3-dev \
        libpng-dev \
        libpq-dev \
        libsnmp-dev \
        libsqlite3-dev \
        libtidy-dev \
        libvpx-dev \
        libxml2-dev \
        libxpm-dev \
        nodejs \
        unixodbc-dev \
        wget \
        xvfb \
        yarn \
        zlib1g-dev

# Install PhantomJS - no longer required as we switched to Chromium
#RUN /usr/bin/wget https://cnpmjs.org/mirrors/phantomjs/phantomjs-1.9.8-linux-x86_64.tar.bz2 && \
#    tar xvjf phantomjs-1.9.8-linux-x86_64.tar.bz2 && \
#    mv phantomjs-1.9.8-linux-x86_64 /usr/local/share && \
#    ln -sf /usr/local/share/phantomjs-1.9.8-linux-x86_64/bin/phantomjs /usr/local/bin

# Add PHP extensions
RUN docker-php-ext-install mbstring mcrypt pdo_mysql curl json intl gd xml zip bz2 opcache

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer
