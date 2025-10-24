#!/bin/bash

# Esto crea una pagina HTML, se pide titulo, cabecera y mensaje al usuario.

# 1. Pedir los datos al usuario
echo "Introduce el título de la página:"
read TITULO

echo "Introduce el texto de la cabecera (h1):"
read CABECERA

echo "Introduce el mensaje principal:"
read MENSAJE

# 2. Crear la carpeta si no existe
mkdir -p ~/mi_pagina_web

# 3. Crear el archivo HTML
RUTA="~/mi_pagina_web/index.html"

# Usamos comillas dobles para que las variables se expandan correctamente
cat <<EOF > ~/mi_pagina_web/index.html
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>$TITULO</title>
</head>
<body>
    <h1>$CABECERA</h1>
    <p>$MENSAJE</p>
</body>
</html>
EOF

# 4. Avisar al usuario
echo "Página web creada correctamente en ~/mi_pagina_web/index.html"
echo "Puedes abrirla con tu navegador o moverla a /var/www/html si usas Apache."
