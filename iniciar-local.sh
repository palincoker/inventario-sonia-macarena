#!/bin/bash
# Inicia un servidor local para abrir la página desde http://localhost:8080
# (necesario para que la sincronización con Firebase funcione en la copia local).
cd "$(dirname "$0")"
echo "Abriendo servidor local en http://localhost:8080"
echo "Cierra esta ventana cuando termines."
python3 -m http.server 8080
