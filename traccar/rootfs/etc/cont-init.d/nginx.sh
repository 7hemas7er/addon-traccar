#!/usr/bin/with-contenv bashio
# ==============================================================================
# Community Hass.io Add-ons: Traccar
# Configures NGINX for use with the Traccar server
# ==============================================================================
declare certfile
declare keyfile
declare port

bashio::config.require.ssl

if bashio::config.true 'ssl'; then
    rm /etc/nginx/nginx.conf
    mv /etc/nginx/nginx-ssl.conf /etc/nginx/nginx.conf

    certfile=$(bashio::config 'certfile')
    keyfile=$(bashio::config 'keyfile')

    sed -i "s/%%certfile%%/${certfile}/g" /etc/nginx/nginx.conf
    sed -i "s/%%keyfile%%/${keyfile}/g" /etc/nginx/nginx.conf
fi

port=$(bashio::addon.port 8072)
sed -i "s/%%port%%/${port}/g" /etc/nginx/nginx.conf
