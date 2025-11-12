#Demografía
#Código para el laboratorio 2
#Municipio de Chicoloapan, Estado de México
#*******************************************************************

#Eliminar objetos existentes
rm(list=ls())

#Limpia la consola
cat("\14")

#Seleccionar el directorio de trabajo
ruta <- choose.dir()

ruta

#ponemos la ruta que ocuparemos
setwd(ruta)

#Nos dice que archivos hay
list.files()

library(tidyverse)

#Usamos est librería de R para hacer 
#nuestras pirámides de población

library(pyramid)

####################################################################################################################
#Pirámides de Población
####################################################################################################################

#*****************************************************************************
#Pirámide de Población 2010
#*****************************************************************************

#Aqui tomamos la informacion de la pob corregida por 1/16 
Quinquenios2010_2 <- read.csv("Correccion2010_cuadratura.csv", header = TRUE)

View(Quinquenios2010_2)

#notamos que hay una columna extra que no debería ir, enonces
#la eliminamos
Quinquenios2010_2 <- Quinquenios2010_2[, -1]

#para la piramide redondeamos la Polación Corregida por 1/16
Quinquenios2010_2[, 2:3] <- round(Quinquenios2010_2[, 2:3])

#Cambiamos de lugar las columnas
PiramidePob2010 <- Quinquenios2010_2[, c(2,3,1)] # Hombres, mujeres, edad

#Cambiamos de lugar las columnas
PiramidePob2010[, 1:2] <- PiramidePob2010[, 1:2] / sum(PiramidePob2010[, 1:2]) * 100

#ahora si creamos la piramide
pyramid(PiramidePob2010, Llab="Hombres", Rlab="Mujeres", Clab="Edad", Rcol="#FF69B4",
        Lcol="#7FFFD4", AxisFM="d", main="Chicoloapan 2010, Estado de México")


#*****************************************************************************
#Pirámide de Población 2020
#*****************************************************************************

#Aqui tomamos la informacion de la pob corregida por 1/16 
Quinquenios2020_2 <- read.csv("Correccion2020_cuadratura.csv", header = TRUE)

View(Quinquenios2020_2)

#notamos que hay una columna extra que no debería ir, enonces
#la eliminamos
Quinquenios2020_2 <- Quinquenios2020_2[, -1]

#para la piramide redondeamos la Polación Corregida por 1/16
Quinquenios2020_2[, 2:3] <- round(Quinquenios2020_2[, 2:3])

#Cambiamos de lugar las columnas
PiramidePob2020 <- Quinquenios2020_2[, c(2,3,1)] # Hombres, mujeres, edad

#Cambiamos de lugar las columnas
PiramidePob2020[, 1:2] <- PiramidePob2020[, 1:2] / sum(PiramidePob2020[, 1:2]) * 100

#ahora si creamos la piramide
pyramid(PiramidePob2020, Llab="Hombres", Rlab="Mujeres", Clab="Edad", Rcol="#BF3EFF",
        Lcol="#1C86EE", AxisFM="d", main="Chicoloapan 2020, Estado de México")

####################################################################################################################
#Crecimiento poblacional
####################################################################################################################

#A partir del crecimiento geometrico y exponencial se llevara a mitad de año 2015 y 2020, 
#a la poblacion de hombres y de mujeres en cada grupo de edad menores de 1, 1 a 4, 5 a 9,...,80 a 84, 85 y mas años de edad.

#Cargamos las bases de Datos

Correccion2010_cuadratura <- read.csv("Correccion2010_cuadratura.csv", header =  TRUE)
Correccion2020_cuadratura <- read.csv("Correccion2020_cuadratura.csv", header = TRUE)

Pob2010_Prorrateo <- read.csv("Pob2010_Prorrateo.csv", header = TRUE)
Pob2020_Prorrateo <- read.csv("Pob2020_Prorrateo.csv", header = TRUE)

View(Pob2010_Prorrateo)
View(Pob2020_Prorrateo)

#notamos que hay una columna extra que no debería ir, enonces
#la eliminamos
Pob2010_Prorrateo <- Pob2010_Prorrateo[, -1]
Pob2020_Prorrateo <- Pob2020_Prorrateo[, -1]

View(Correccion2010_cuadratura)
View(Correccion2020_cuadratura)

#notamos que hay una columna extra que no debería ir, enonces
#la eliminamos
Correccion2010_cuadratura <- Correccion2010_cuadratura[, -1]
Correccion2020_cuadratura <- Correccion2020_cuadratura[, -1]


#*****************************************************************************
#2010
#*****************************************************************************

#Vamos a separar al quienquenio de 0 a 4 años en 2:
#menor de 1 año y de 1 a 4 años

#vamos a poner a la pob menor a 1 año en población corregida
#y esta irá en la primera fila
Correccion2010_cuadratura = rbind(Pob2010_Prorrateo[1,],Correccion2010_cuadratura)

Correccion2010_cuadratura[1,1] = c("Menor a 1 año")

#Ahora la 2da fila tendra la pob de 1-4 años, pero hay que restarle
#la población menor a 1 año
Correccion2010_cuadratura[2,2:3] = Correccion2010_cuadratura[2,2:3] - Correccion2010_cuadratura[1,2:3]

#nombre a la segunda fila
Correccion2010_cuadratura[2,1] = c("1 a 4 años"); Correccion2010_cuadratura

#nos generamos un csv con la información
write.csv(Correccion2010_cuadratura,"Correccion2010_cuadratura_2.csv")

#*****************************************************************************
#2020
#*****************************************************************************

#Vamos a separar al quienquenio de 0 a 4 años en 2:
#menor de 1 año y de 1 a 4 años

#vamos a poner a la pob menor a 1 año en población corregida
#y esta irá en la primera fila
Correccion2020_cuadratura = rbind(Pob2020_Prorrateo[1,],Correccion2020_cuadratura)

Correccion2020_cuadratura[1,1] = c("Menor a 1 año")

#Ahora la 2da fila tendra la pob de 1-4 años, pero hay que restarle
#la población menor a 1 año
Correccion2020_cuadratura[2,2:3] = Correccion2020_cuadratura[2,2:3] - Correccion2020_cuadratura[1,2:3]

#nombre a la segunda fila
Correccion2020_cuadratura[2,1] = c("1 a 4 años"); Correccion2020_cuadratura

#nos generamos un csv con la información
write.csv(Correccion2020_cuadratura,"Correccion2020_cuadratura_2.csv")


#Observaciones importantes:
#Censo 2010, fecha de referencia: 12 junio 2010
#Censo 2020, fecha de referencia: 15 marzo 2020

f1 <- as.Date(c("2010-06-12", "2020-03-15"))
#Numero de días 
dias = as.numeric(f1[2]-f1[1]) 
#Numero de años 
n = dias/365; n 

#*****************************************************************************
#Crecimiento geométrico
#*****************************************************************************

r_Geom = Correccion2020_cuadratura 
r_Geom$Hombres = ((Correccion2020_cuadratura$Hombres/Correccion2010_cuadratura$Hombres)^(1/n))-1
r_Geom$Mujeres = ((Correccion2020_cuadratura$Mujeres/Correccion2010_cuadratura$Mujeres)^(1/n))-1
View(r_Geom)

#*****************************************************************************
#Crecimiento Exponencial
#*****************************************************************************

r_Exp = Correccion2020_cuadratura
r_Exp$Hombres = log(Correccion2020_cuadratura$Hombres/Correccion2010_cuadratura$Hombres)/n
r_Exp$Mujeres = log(Correccion2020_cuadratura$Mujeres/Correccion2010_cuadratura$Mujeres)/n
View(r_Exp)

####################################################################################################################
#Proyección de población:
####################################################################################################################

#*****************************************************************************
#Crecimiento geométrico
#*****************************************************************************

#llevamos a mitad de año (30/junio/t) a los hombres y a las mujeres para el 2015 y 2020

#fechas
f2 <- as.Date(c("2010-06-12", "2015-06-30"))
f3 <- as.Date(c("2020-03-15", "2020-06-30"))

#sacamos cuanta diferencia hay entre el 12/jun/2010 y el 30/jun/2015
n1 = as.numeric(f2[2]-f2[1])/365  
n1
#sacamos cuanta diferencia hay entre el 15/marzo/2020 y el 30/jun/2020
n2 = as.numeric(f3[2]-f3[1])/365  
n2

#Ahora pasamos la pob del 12/jun/2010 al 30/jun/2015 
Pob_Mitad2015_Geom = Correccion2010_cuadratura
Pob_Mitad2015_Geom$Hombres = Correccion2010_cuadratura$Hombres*(1+r_Geom$Hombres)^(n1)
Pob_Mitad2015_Geom$Mujeres = Correccion2010_cuadratura$Mujeres*(1+r_Geom$Mujeres)^(n1)

#Ahora pasamos la pob del 15/marzo/2020 al 30/jun/2015
Pob_Mitad2020_Geom = Correccion2020_cuadratura
Pob_Mitad2020_Geom$Hombres = Correccion2020_cuadratura$Hombres*(1+r_Geom$Hombres)^(n2)
Pob_Mitad2020_Geom$Mujeres = Correccion2020_cuadratura$Mujeres*(1+r_Geom$Mujeres)^(n2)

#nos generamos csv's con la información
write.csv(r_Geom, "Tasa_Geométrica.csv")
write.csv(Pob_Mitad2015_Geom, "Población_Mitad2015_Geom.csv")
write.csv(Pob_Mitad2020_Geom, "Población_Mitad2020_Geom.csv")

#*****************************************************************************
#Crecimiento exponencial
#*****************************************************************************

#llevamos a mitad de año (30/junio/t) a los hombres y a las mujeres para el 2015 y 2020: 

#Ahora pasamos la pob del 12/jun/2010 al 30/jun/2015 
Pob_Mitad2015_Exp = Correccion2010_cuadratura
Pob_Mitad2015_Exp$Hombres = Correccion2010_cuadratura$Hombres*(exp(r_Exp$Hombres*n1))
Pob_Mitad2015_Exp$Mujeres = Correccion2010_cuadratura$Mujeres*(exp(r_Exp$Mujeres*n1))
View(Pob_Mitad2015_Exp)

#Ahora pasamos la pob del 15/marzo/2020 al 30/jun/2015
Pob_Mitad2020_Exp = Correccion2020_cuadratura
Pob_Mitad2020_Exp$Hombres = Correccion2020_cuadratura$Hombres*(exp(r_Exp$Hombres*n2))
Pob_Mitad2020_Exp$Mujeres = Correccion2020_cuadratura$Mujeres*(exp(r_Exp$Mujeres*n2))
View(Pob_Mitad2020_Exp)

#nos generamos csv's con la información
write.csv(r_Exp, "Tasa_Exponencial.csv")
write.csv(Pob_Mitad2015_Exp, "Población_Mitad2015_Exp.csv")
write.csv(Pob_Mitad2020_Exp, "Población_Mitad2020_Exp.csv")