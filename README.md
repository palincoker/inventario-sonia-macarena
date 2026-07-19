# Control de Inventario Sonia Macarena

Página web para control de inventario con sincronización en la nube mediante Firebase.

## Acceso online

https://palincoker.github.io/inventario-sonia-macarena/

## Acceso local (misma red WiFi)

Para que la copia local se sincronice con Firebase, no abras el archivo HTML directamente. En su lugar, inicia un servidor local:

### Opción 1: doble clic

Haz doble clic en `iniciar-local.command`.

Si macOS muestra una advertencia de seguridad, ve a **Preferencias del Sistema → Seguridad y Privacidad → General** y permite la ejecución.

### Opción 2: Terminal

Abre Terminal en esta carpeta y ejecuta:

```bash
python3 -m http.server 8082 --bind 0.0.0.0
```

Luego abre en el navegador:

- Desde esta Mac: http://localhost:8082
- Desde cualquier dispositivo en la red: http://192.168.1.150:8082

> La dirección IP puede cambiar. Para saber la IP actual de la Mac, ejecuta en Terminal: `ipconfig getifaddr en0`

## Sincronización

Los datos se guardan en Firebase Realtime Database. Cualquier cambio que hagas en la versión online o en la local (por localhost) se refleja en las demás en pocos segundos.

Si abres el archivo HTML directamente (`file://...`), la página funciona pero **no se sincroniza** con Firebase; usa solo el almacenamiento local del navegador.

## Archivos

- `index.html` — página principal.
- `iniciar-local.command` — inicia el servidor local con doble clic (macOS).
- `iniciar-local.sh` — inicia el servidor local desde Terminal.
