#!/bin/bash

read -p "Ingrese un nombre para saber su género: " Nombre

Resultado=$(curl -s "https://api.genderize.io/?name=${Nombre}")

# Verificar si la solicitud fue exitosa y si se encontró el nombre en la respuesta
if echo "$Resultado" | grep -q "\"name\":\"${Nombre}\""; then
    # Extraer el género y la probabilidad del JSON usando herramientas de Bash
    Genero=$(echo "$Resultado" | grep -o '"gender":"[^"]*' | sed 's/"gender":"//')
    Probabilidad=$(echo "$Resultado" | grep -o '"probability":[0-9.]*' | sed 's/"probability"://')

    # Mostrar el resultado
    echo "El nombre '${Nombre}' tiene género '${Genero}' con una probabilidad del ${Probabilidad}%."
else
    echo "No se pudo determinar el género para el nombre '${Nombre}'."
fi

