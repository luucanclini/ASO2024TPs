#!/bin/bash

echo "¡Bienvenido a 'Piedra Papel o Tijera'! hecho por Lucía Canclini"
echo "¡El mejor de tres gana!"
numero_a_opcion() 
{
    case $1 in
        1) echo "Piedra" ;;
        2) echo "Papel" ;;
        3) echo "Tijera" ;;
        *) echo "Opción desconocida" ;;
    esac
}

VictoriasJugador=0
VictoriasMaquina=0

while [ $VictoriasJugador -lt 3 ] &&  [ $VictoriasMaquina -lt 3 ];
 do

    echo "Ingrese el numero del elemento que va a utilizar:"
    echo "1) Piedra"
    echo "2) Papel"
    echo "3) Tijera"
    read OpcionElegida

    if [[ $OpcionElegida -lt 1 || $OpcionElegida -gt 3 ]]; then
        echo "Opción no válida, por favor ingrese 1, 2 o 3."
        continue
    fi

    OpcionJugador=$OpcionElegida
    NumeroAleatorio=$((RANDOM % 3 + 1))
    OpcionMaquina=$NumeroAleatorio

    OpcionJugadorTexto=$(numero_a_opcion $OpcionJugador)
    OpcionMaquinaTexto=$(numero_a_opcion $OpcionMaquina)

    echo "Tú elegiste: $OpcionJugadorTexto"
    echo "La máquina eligió: $OpcionMaquinaTexto"

    if [ $OpcionJugador -eq $OpcionMaquina ]; then
        echo "Empate!"
    elif [ $OpcionJugador -eq 1 ] && [ $OpcionMaquina -eq 3 ]; then

       	((VictoriasJugador++))
	echo "Ganaste esta ronda! Piedra es mejor que Tijera."

    elif [ $OpcionJugador -eq 2 ] && [ $OpcionMaquina -eq 1 ]; then

        ((VictoriasJugador++))
	echo "Ganaste esta ronda! Papel es mejor que Piedra."

    elif [ $OpcionJugador -eq 3 ] && [ $OpcionMaquina -eq 2 ]; then

        ((VictoriasJugador++))
	echo "Ganaste esta ronda! Tijera es mejor que Papel."

    else

	((VictoriasMaquina++))
        echo "Perdiste esta ronda!"

    fi

 echo "Marcador: Usted $VictoriasJugador - Maquina $VictoriasMaquina "
done
