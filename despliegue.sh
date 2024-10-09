#!/bin/bash

# Agrega los cambios al repositorio git
git add *
git commit -m "$1"
git push origin main

# Elimina el directorio public
sudo rm -r ./docs

# Genera el sitio con Hugo
hugo -d docs

# Sincroniza los archivos al servidor remoto usando rsync con puerto SSH 22123
rsync -avz -e "ssh -p 22123" ./docs/ admin@web.infenlaces.com:web/web.infenlaces.com/public_html/despliegue/
