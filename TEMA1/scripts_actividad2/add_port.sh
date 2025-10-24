#!/bin/bash




if [ -z "$1" ]; then
  echo "Error: debes indicar un puerto."
  echo "Uso: sudo $0 <puerto>"
  exit 1
fi

PUERTO=$1
FICHERO="/etc/apache2/ports.conf"



if grep -q "Listen $PUERTO" "$FICHERO"; then
  echo "El puerto $PUERTO ya está configurado en Apache."
  exit 0
fi



echo "Añadiendo puerto $PUERTO al archivo $FICHERO..."
echo "Listen $PUERTO" | sudo tee -a "$FICHERO" > /dev/null



echo "Reiniciando el servicio de Apache..."
sudo systemctl restart apache2


if [ $? -eq 0 ]; then
  echo "Puerto $PUERTO añadido correctamente y Apache reiniciado."
else
  echo "Hubo un problema al reiniciar Apache. Revisa la configuración."
fi
