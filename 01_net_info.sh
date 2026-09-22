#!/bin/bash
#limpiar pantalla
clear_screen() {
	clear
	echo "NET INFO"
	echo "======================================="
}

#1. Checar conexion a internet
check_internet() {
	clear_screen
	echo "Verificando conexion a internet"
	#Ping al dns de google con 3 paquetes
	if ping -c 3 8.8.8.8 &> /dev/null; then
		echo "Conexion IP activa: ping 8.8.8.8 Exitoso"
		#Resolucion de nombres dns
		if ping -c 2 google.com &> /dev/null; then
			echo "Resolucion DNS correcta"
		else 
			echo "Hay IP pero no Resolucion DNS"
		fi
	else
		echo "Sin Internet"
	fi
	read -p "Presiona Enter para continuar"
}
#2. Mostar IPs
show_ips() {
	clear_screen
	echo "Obteniendo direcciones IP"
	echo "-------------------------------------"

	#IP privada con "ip"
	echo "Interfaces - IP local"
	ip -br addr show | grep -v "127.0.0.1"
	echo "-------------------------------------"
	#IP publica api externa 
	echo "IP publica"
	ip_publica=$(curl -s https://ifconfig.me)
	if [ -n "$ip_publica" ]; then
		echo "IP publica: $ip_publica"
	else
		echo "No se pudo obtener!"
	fi
	read -p "Presiona Enter para continuar"
}
#3.Escanear puertos locales abiertos
check_ports() {
	clear_screen
	echo "Escaneando puertos locales activos"
	echo "-------------------------------------"

	#ss -tulpn: t=TCP, u=UDP, l=Listening, p=Procesos, n=Numérico
	ss -tulpn | grep -v "IdNet"
	read -p "Presiona Enter para continuar"}

#Bucle para menu
while true; do
	clear_screen
	echo "1. Conexion a internet"
	echo "2. Interfaces e IPs"
	echo "3, Puertos locales"
	echo "4. Salir"
	read -p "Selecciona una opcion 1-4: " opcion

	case $opcion in
		1) check_internet ;;
		2) show_ips ;;
		3) check_ports ;;
		4) clear; echo "Saliendo..."; exit 0 ;;
		*) echo "Opcion no valida" ;;
	esac
done

