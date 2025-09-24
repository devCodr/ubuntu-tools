# Conky

### Se debe tener una carpeta ".conky"

/home/chris/.conky

y dentro poner los .conf

### Crea un script en tu home, por ejemplo:

```
nano ~/conky-start.sh
```

### Pega esto dentro:

```
#!/bin/bash
sleep 10
conky -c /home/chris/.conky/reloj.conf &
conky -c /home/chris/.conky/baterias.conf &
conky &
```

### El sleep 10 es para darle tiempo a que cargue el escritorio antes de lanzar Conky.

Hazlo ejecutable:

```
chmod +x ~/conky-start.sh
```

### Ahora agrega este script en Startup Applications con el comando:

```
/home/chris/conky-start.sh
```
