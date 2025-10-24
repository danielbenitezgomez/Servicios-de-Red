#!/bin/bash



if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Error: debes indicar una IP y un dominio."
  echo "Uso: sudo $0 <ip> <dominio>"
  exit 1
fi

IP=$1
DOMINIO=$2
FICHERO="/etc/hosts"


if grep -q "$DOMINIO" "$FICHERO"; then
  echo "El dominio '$DOMINIO' ya existe en el archivo $FICHERO."
  exit 0
fi


echo "Añadiendo '$IP $DOMINIO' al archivo $FICHERO..."
echo "$IP $DOMINIO" | sudo tee -a "$FICHERO" > /dev/null


if grep -q "$DOMINIO" "$FICHERO"; then
  echo "Dominio añadido correctamente."
else
  echo "Error: no se pudo añadir el dominio."
fi
