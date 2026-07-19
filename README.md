# Control de Inventario Sonia Macarena

Página web para control de inventario con sincronización en la nube mediante Firebase, diseño moderno en tonos rosas y lilas.

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

## Funciones principales

- **Escaneo QR/cámara y pistola escáner**
- **Control de stock** con entradas, salidas y ajustes
- **Foto del producto**, categoría, ubicación estructurada, precios y fecha de vencimiento
- **Dashboard** con resumen, alertas y gráfico de stock por categoría
- **Informe descargable** en HTML con un clic
- **Sincronización Excel** automática cada 5 minutos
- **Alertas por iMessage** de stock bajo, sin stock y productos por vencer

## Alertas por iMessage

Para recibir alertas diarias en tu iMac al número +56991584529:

1. Asegúrate de tener **Messages** configurado con tu cuenta de Apple.
2. El envío automático está programado todos los días a las **09:00**.
3. Para probar manualmente:
   ```bash
   cd "/Users/familiasanjuanibanez/Desktop/Lulu Inventario"
   python3 alertas_imessage.py
   ```
4. Para ver el estado del servicio:
   ```bash
   launchctl list | grep com.lulu.inventario.alertas
   ```

> Las alertas solo se envían si hay productos con stock bajo, sin stock o por vencer.

## Archivos

- `index.html` — página principal.
- `logo.png`, `logo-128.png`, `favicon.png` — logo generado desde tu foto.
- `iniciar-local.command` — inicia el servidor local con doble clic (macOS).
- `iniciar-local.sh` — inicia el servidor local desde Terminal.
