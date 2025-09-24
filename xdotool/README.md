# 📖 Redimensionar y mover la ventana activa con `xdotool` (Ubuntu)

Guía rápida para configurar atajos de teclado que cambian tamaño y posición de la ventana activa usando `xdotool`.

---

## 1) Instalar `xdotool`

```
sudo apt update
sudo apt install xdotool
```

---

## 2) Crear el script

Crea el archivo `~/resize_active.sh` y pega el contenido. El script acepta un parámetro que define el modo:

```
#!/bin/bash
active=$(xdotool getactivewindow)

case $1 in
  d)
    xdotool windowmove $active 0 0
    xdotool windowsize $active 1920 1080
    ;;
  t)
    xdotool windowmove $active 100 100
    xdotool windowsize $active 768 1024
    ;;
  m)
    xdotool windowmove $active 200 200
    xdotool windowsize $active 1080 768
    ;;
  *)
    echo "Usage: $0 {d|t|m}"
    exit 1
    ;;
esac
```

Dar permisos de ejecución:

```
chmod +x ~/resize_active.sh
```

---

## 3) Probar en la terminal

```
~/resize_active.sh d
~/resize_active.sh t
~/resize_active.sh m
```

---

## 4) Crear atajos de teclado

1.  Abre **Configuración → Teclado → Atajos personalizados**.
2.  Añade un atajo por modo:
    - **Nombre:** Resize D — **Comando:** `/home/usuario/resize_active.sh d` — **Teclas:** Alt+Shift+D
    - **Nombre:** Resize T — **Comando:** `/home/usuario/resize_active.sh t` — **Teclas:** Alt+Shift+T
    - **Nombre:** Resize M — **Comando:** `/home/usuario/resize_active.sh m` — **Teclas:** Alt+Shift+M

Sugerencia: reemplaza `/home/usuario` por tu ruta real de usuario. Evita colisiones con atajos del sistema ya existentes.

---

## 5) Agregar más modos (opcional)

Edita el script y añade otro caso. Ejemplo modo `x`:

```
  x)
    xdotool windowmove $active 50 50
    xdotool windowsize $active 1366 768
    ;;
```

Luego crea un atajo: Alt+Shift+X con el comando `/home/usuario/resize_active.sh x`.

---

## 6) Solución de problemas

- Si no funciona, verifica que la ventana tenga foco antes de usar el atajo.
- Algunas aplicaciones con decoraciones especiales pueden limitar redimensionado; prueba con otras ventanas para aislar el problema.
- En Wayland, `xdotool` tiene limitaciones. Si usas Wayland, inicia sesión en Xorg o considera alternativas como _wmctrl_ o extensiones del shell.
