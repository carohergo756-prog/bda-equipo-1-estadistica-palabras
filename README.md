# Estadística de palabras I — Equipo 1

## Descripción:

En este proyecto se utilizan dos ejemplos de MapReduce de Hadoop 3.3.6: wordmean y wordmedian, los cuales permiten analizar la longitud de las palabras de un texto.

- WordMean: Calcula la longitud promedio de las palabras.
- WordMedian: Obtiene la mediana de las longitudes de las palabras.

Para demostrar su funcionamiento se utiliza un ejemplo introductorio de cinco palabras y una noticia sobre centros de datos. Además, se incluye un mini ejercicio de ciberseguridad para que otros compañeros puedan practicar.

## Requisitos

- Docker Desktop.
- Un contenedor Debian 12 llamado hadoop.
- Java 17 y Hadoop 3.3.6 instalados y configurados.
- Los archivos incluidos en la carpeta datos/ de este repositorio.

## Integrantes

- Enríquez Ramírez Oneida
- Hernández Gómez Carolina
- Ramírez Hernández Luz Ignacio




## Preparación del entorno

Antes de ejecutar los ejemplos, es necesario tener funcionando el contenedor Debian 12 con Hadoop 3.3.6, utilizado en la práctica anterior.

### Paso 1. Iniciar el contenedor

Desde la terminal de tu computadora (PowerShell en Windows o terminal en Linux):
(En este caso el equipo utilizó PowerShell)

```powershell

docker start hadoop

```

### Paso 2. Preparar las carpetas dentro del contenedor

Desde PowerShell:

```powershell

docker exec -u root hadoop mkdir -p /tmp/equipo1/datos /tmp/equipo1/ejercicio

```

### Paso 3. Copiar los archivos de entrada

Desde la carpeta del repositorio en PowerShell:

```powershell

docker cp datos/palabras.txt hadoop:/tmp/equipo1/datos/

docker cp datos/tecnologia.txt hadoop:/tmp/equipo1/datos/

docker cp datos/ciberseguridad.txt hadoop:/tmp/equipo1/ejercicio/

```

### Paso 4. Copiar el script y ajustar permisos

```powershell

docker cp scripts/ejecutar.sh hadoop:/tmp/equipo1/ejecutar.sh

docker exec -u root hadoop chown -R hadoop:hadoop /tmp/equipo1

```

Con estos pasos quedarán preparados los archivos de entrada y el script para ejecutar los ejemplos de WordMean y WordMedian.




## Ejecución de los ejemplos

Una vez copiados los archivos al contenedor, podemos ejecutar los programas de WordMean y WordMedian.

### Paso 1. Entrar al contenedor

Desde la terminal de nuestra computadora (Windows o Linux):

```bash

docker exec -it -u hadoop hadoop bash

```

### Paso 2. Ejecutar los programas

Dentro del contenedor:

```bash

bash /tmp/equipo1/ejecutar.sh

```

El script ejecuta los dos programas con tres conjuntos de datos:

- Ejemplo introductorio: cinco palabras de diferentes longitudes.
- Demostración principal: noticia sobre centros de datos.
- Mini ejercicio: texto sobre ciberseguridad.

Antes de cada ejecución, el script elimina las carpetas de salida anteriores para evitar errores al volver a ejecutar Hadoop.

### Paso 3. Consultar los resultados

Dentro del contenedor:

### Ejemplo introductorio

```bash

cat /tmp/equipo1/salida_mean/part-r-00000

cat /tmp/equipo1/salida_median/part-r-00000

```

### Demostración principal

```bash

cat /tmp/equipo1/salida_noticia_mean/part-r-00000

cat /tmp/equipo1/salida_noticia_median/part-r-00000

```

### Mini ejercicio

```bash

cat /tmp/equipo1/ejercicio/salida_mean/part-r-00000

cat /tmp/equipo1/ejercicio/salida_median/part-r-00000

```

## Resultados esperados

| Actividad | WordMean | WordMedian |
|---|---:|---:|
| Cinco palabras | 6.00 | 5 |
| Noticia de centros de datos | 5.51 | 5 |
| Ciberseguridad | 5.64 | 5 |

WordMean muestra la longitud promedio de las palabras, mientras que WordMedian obtiene un valor central de sus longitudes.

En el ejercicio de ciberseguridad, Hadoop muestra 5 como mediana, aunque el cálculo estadístico convencional para los 22 datos da 5.5.