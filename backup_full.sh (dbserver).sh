#!/bin/bash

#help
if ["$1" = "-h" ]; then
	echo "Ha ingresado al menú de ayuda"
	echo "Formato: $0 <dir_orig> <dir_destino>"
	exit 1
fi

#comprobar argumentos
if [$# -ne 2] ; then
	echo "ERROR -h para ingresar al menú de ayuda"
	echo "Formato: $0 <dir_orig> <dir_destino>"
	exit 1
fi

#variables
FECHA= $(date "+%Y%m%d")
BACKUP_ORIG= $1
BACKUP_DESTINO= $2
NOMBRE_ARCHIVO= "$(basename $BACKUP_ORIG) _bkp_$FECHA.tar.gz"

tar -cpzvf $BACKUP_ORIG.tar.gz /$BACKUP_ORIG
cp $BACKUP_ORIG.tar.gz /$BACKUP_DESTINO

if [$? -eq 0] ; then
	echo "Backup realizado exitosamente"
else	
	echo "Ha ocurrido un error"
fi

