#!/bin/bash
# Inicia un servidor local para abrir la pagina.
# Se escucha en todas las interfaces de red (0.0.0.0) para que otros
# dispositivos de la red local tambien puedan acceder.
cd "$(dirname "$0")" || exit 1

PUERTO=8082
LOG="/tmp/inventario-servidor.log"
IP_LOCAL=$(ipconfig getifaddr en0 2>/dev/null || ipconfig getifaddr en1 2>/dev/null || hostname -I 2>/dev/null | awk '{print $1}' || echo 'tu-ip-local')

exec >"$LOG" 2>&1
set -x

echo "=== $(date) ==="
echo "Reiniciando servidor local si ya estaba corriendo..."
kill -9 $(lsof -t -i :${PUERTO}) 2>/dev/null || true
sleep 1

echo "Abriendo servidor local..."
echo "  - Desde esta Mac: http://localhost:${PUERTO}"
echo "  - Desde red local: http://${IP_LOCAL}:${PUERTO}"

echo "Iniciando servidor..."
python3 -m http.server ${PUERTO} --bind 0.0.0.0 &
SERVER_PID=$!
sleep 2

if ps -p $SERVER_PID > /dev/null 2>&1; then
  echo "Servidor iniciado correctamente (PID: $SERVER_PID)"
  osascript -e "display notification \"Accede en http://${IP_LOCAL}:${PUERTO}\" with title \"Inventario listo\""
else
  echo "ERROR: No se pudo iniciar el servidor"
  osascript -e "display notification \"Revisa /tmp/inventario-servidor.log\" with title \"Error servidor inventario\""
fi

# Mantener la ventana abierta para que el usuario vea el log
echo ""
echo "El servidor esta corriendo. Cierra esta ventana para detenerlo."
read -r -p "Presiona Enter para detener el servidor..."
kill $SERVER_PID 2>/dev/null || true
