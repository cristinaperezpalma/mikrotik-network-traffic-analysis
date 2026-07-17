
#!/bin/bash

# Pedir al usuario la ruta donde se creará el archivo

# Ejecutar nfcapd en el puerto 5022 y guardar los registros en la ruta especificada

nfcapd -w -D -p 5022 -l /home/operador/Escritorio/nfcapd -t 60
