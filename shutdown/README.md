# Apagar Ubuntu

##🔹 Paso 1: Probar el comando

Primero, abre una terminal y ejecuta:

```
gnome-session-quit --power-off
```


👉 Te debe salir el modal de apagado/reinicio.
Si funciona, seguimos.

##🔹 Paso 2: Crear el archivo .desktop

Crea el archivo en la carpeta de accesos de usuario:

```
nano ~/.local/share/applications/poweroff-dialog.desktop
```


Y pega dentro:

```
[Desktop Entry]
Name=Apagar
Comment=Abrir el diálogo de apagado del sistema
Exec=gnome-session-quit --power-off
Icon=system-shutdown
Terminal=false
Type=Application
Categories=System;

```


Guarda con Ctrl+O y sal con Ctrl+X.

##🔹 Paso 3: Hacerlo visible

Actualiza permisos para que sea ejecutable:

```
chmod +x ~/.local/share/applications/poweroff-dialog.desktop
```

##🔹 Paso 4: Buscarlo en el menú

Ahora deberías poder buscar “Apagar” en el menú de aplicaciones.
Cuando lo abras, debería mostrarte el mismo modal de apagado.

##🔹 Paso 5: Anclar al dock

Abre el menú, busca Apagar.

Haz clic derecho sobre el icono.

Selecciona “Añadir a favoritos”.

👉 Quedará fijo en el dock como si fuera un botón de apagado propio.
