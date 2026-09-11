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
	read -p "Presiona Enter para continuar"

}
#2. Mostar IPs
show_ips() {
	clear_screen
	echo "Obeteniendo IPs"	
	read -p "Presiona Enter para continuar"

}
#3.Escanear puertos locales abiertos
check_ports() {
	clear_screen
	echo "Escaneando puertos locales activos"
	read -p "Presiona Enter para continuar"
}

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

