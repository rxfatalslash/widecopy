# 🗳️ Instalación
## 🖱️ Uso
⚠️Este script está diseñado para distribuciones Linux⚠️
<br><br>
** Desde la terminal ejecuta los siguientes comandos**
* Descarga el script
´´´
curl https://raw.githubusercontent.com/rxfatalslash/widecopy/main/copyfile.sh -o $HOME/copyfile.sh
```
* Concede permisos de ejecución
```
chmod +x $HOME/copyfile.sh
```
* Ejecuta el script pasándole dos argumentos, el primero es el archivo que quieres enviar y el segundo es la carpeta destino de los equipos a los que quieres mandarlo
```
./copyfile.sh
```
## Modificación
** El script comprende un rango de IP desde la 10 hasta la 150, teniendo en cuenta que tu red es 192.168.1.0/24.
<br>
Si tu red tiene una máscara distinta modifica la variable _devices_
<br>
Si quieres modificar el rango de IP modifica el rango del bucle for para la variable _octeto_