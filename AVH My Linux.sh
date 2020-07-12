#!/bin/bash
#**************************
# CLH - CHECK LINUX HACKED
# by Angel J. Reynoso ~ kp01
# kp01aj@gmail.com
# Date: July 11 2020
#**************************

# Description.
##############
# Attackers who compromise a system take precautions while performing illegal activities and always
# try to hide their movements. The attacker always installs some variant of backdoor on the compromised
# system to maintain access.

# Each incident leaves some evidence. If a team is compromised, it will definitely behave differently.
# In this script some checks will be executed to generate a report that will help you know if your team
# has been compromised.


# Step 1
# VERIFY SIGN IN CURRENT SESSION
# Verifying you are currently logged into the server.
w

# Paso 2
# VERIFICAR EL ÚLTIMO INICIO DE SESIÓN
# Los servidores Linux registran los detalles de inicio de sesión con la dirección IP. 
# Para saber quién inició sesión en el servidor, use el comando “last” que nos mostrará
# los detalles de inicio de sesión con la dirección IP y la hora.

last

# Paso 3
# VER HISTORIAL DE MANDOS
# Linux almacena los comandos que usamos en el terminal en un historial. Al emitir el comando
# “history”, podemos ver la lista de comandos ejecutados por el usuario en el terminal.

history

# Paso 4
# COMPROBAR LOS PROCESOS DEL CPU
# La mayoría de los hackers ejecutan un proceso para implantar un backdoor en el sistema objetivo;
# este es un proceso que puede consumir altos recursos del CPU, por lo que podemos usar el comando “top”
# para verificar la lista de procesos que mayores recursos consumen.

top

# Aquí tenemos que identificar el proceso más alto que se está ejecutando actualmente en el kernel de Linux
# y ahora también podemos usar el comando “strace” para rastrear las llamadas y señales del sistema. Este 
# comando interpretará  registrará las llamadas al sistema realizadas por los procesos. El comando depura y
# soluciona los problemas en el sistema operativo.

# Primero tenemos que instalar el paquete “apt install strace”. Después de instalar strace, podemos usar este
# comando para depurar “strace -d -p <PID Number>”.

strace -d -p 1

# Paso 5
# VERIFICAR PROCESOS DEL SISTEMA
# Ahora tenemos que verificar los procesos del sistema en ejecución. Use el comando “ps auxf” para obtener más
# información sobre los procesos en ejecución.

ps axuf

# Podemos matar el proceso usando este comando “kill -9 <PID>”.

# Paso 6
# VERIFICAR TRÁFICO DE RED
# Ahora, tenemos que verificar el tráfico de la red usando el comando “iftop”, esto nos proporcionará detalles
# sobre el envío y la recepción de los datos de la red junto con el origen y el objetivo.

# Primero, tenemos que instalar el paquete usando el comando “apt install iftop”. La salida se mostrará de esta manera.

apt install iftop

# Paso 7
# VERIFICAR PUERTOS LISTENER
# Hacker instala programas de puerta trasera si ha comprometido el servidor Linux. Y todos los backdoors se ejecutan
# en segundo plano, lo que se puede identificar utilizando puertos abiertos. Podemos usar el comando “netstat -plunt”.
# Este comando enumerará todas las conexiones de red en nuestro sistema.

netstat -plunt

# También podemos usar el comando “lsof -I”, que enumerará todos los archivos abiertos en nuestro sistema y podemos
# verificar que el archivo se abre mediante qué proceso

    # Lsof: lista de archivos abiertos
    # -I: seleccionar archivos IPV

# También podemos usar esto para enumerar el proceso “lsof -

lsof -p

# Paso 8
#COMPROBAR ROOTKIT

# Ahora, podemos verificar cualquier rootkit instalado en el servidor o no. Primero tenemos que instalar el paquete
# rootkit usando el comando “apt install chrootkit”.

# Después de instalar el paquete, escriba el comando “chrootkit”. Esto depurará cualquier rootkit que se inyecte en
# nuestros archivos del sistema.

apt install chrootkit
chrootkit

# REPORT.
###########
# Así que estudiamos comandos básicos para auditar nuestro sistema Linux y averiguar si nuestro servidor Linux está
# comprometido o no. Hay muchas más herramientas disponibles para auditar su sistema de una vez, que abordaremos en
# las próximas publicaciones.