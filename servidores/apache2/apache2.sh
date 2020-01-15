#!/usr/bin/env bash
echo "Instalando o servidor Apache2 ..."
apk install apache2
rc-service apache2 start
