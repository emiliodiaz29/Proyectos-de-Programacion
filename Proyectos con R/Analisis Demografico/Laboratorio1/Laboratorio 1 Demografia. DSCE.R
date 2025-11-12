#Demografía
#Código para el laboratorio 1
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

#Leer la fuente de información de la Poblacion en 2010
Pob2010 <- read.csv("Pob Chicoloapan 2010.csv", header=TRUE)
str(Pob2010)
Pob2010[is.na(Pob2010)] <- 0
#Nuestro data frame original
View(Pob2010)

#Leer la fuente de información de la Poblacion en 2020
Pob2020 <- read.csv("Pob Chicoloapan 2020.csv", header=TRUE)
str(Pob2020)
Pob2020[is.na(Pob2020)] <- 0
#Nuestro data frame original
View(Pob2020)

####################################################################################################################
#Índice Naciones Unidas (INU)
####################################################################################################################

#*****************************************************************************
#Índice de naciones Unidas 2010
#*****************************************************************************
#Creamos un data frame con 3 columnas y 15 filas y sin datos
Pob_Quinquenios2010 <- data.frame(Edad = rep(NA,15),
                                  Hombres = rep(NA,15),
                                  Mujeres = rep(NA, 15))
#este ciclo es para llenar el data frame, con la pob correspondiente
#a cada quinquenio
for(i in 1:15) {
  Pob_Quinquenios2010[i, 1] <- paste0(5*(i-1), "-", 5*i-1)
  Pob_Quinquenios2010[i, 2:3] <- colSums(Pob2010[(5*i-4):(5*i),2:3])
}

View(Pob_Quinquenios2010)

#Comprobación
colSums(Pob_Quinquenios2010[ ,2:3]) == colSums(Pob2010[1:75, 2:3])

#Índice Hombre

I_H2010 <- 0

for(i in 2:14){
  num_2010 <- 2*Pob_Quinquenios2010[i, 2]
  den_2010 <- Pob_Quinquenios2010[i-1, 2] + Pob_Quinquenios2010[i+1, 2]
  I_H2010 <- I_H2010 + 100*abs(num_2010/den_2010 -1)/13
}

I_H2010

#Índice Mujer

I_M2010 <- 0

for(i in 2:14){
  num_2010 <- 2*Pob_Quinquenios2010[i, 3]
  den_2010 <- Pob_Quinquenios2010[i-1, 3] + Pob_Quinquenios2010[i+1, 3]
  I_M2010 <- I_M2010 + 100*abs(num_2010/den_2010 -1)/13
}
I_M2010

# indice ambos sexos
I_S2010 <- 0
for(i in 2:14){
  coc1_2010 <- Pob_Quinquenios2010[i, 2] / Pob_Quinquenios2010[i, 3]
  coc2_2010 <- Pob_Quinquenios2010[i+1, 2] / Pob_Quinquenios2010[i+1, 3]
  I_S2010 <- I_S2010 + 100 * abs(coc1_2010 -coc2_2010) / 13
}
I_S2010

#Indice Naciones Unidas

(I_NU2010 <- I_H2010 + I_M2010 + 3*I_S2010)

#*****************************************************************************
#Índice de naciones Unidas 2020
#*****************************************************************************
#Creamos un data frame con 3 columnas y 15 filas y sin datos
Pob_Quinquenios2020 <- data.frame(Edad = rep(NA,15),
                                  Hombres = rep(NA,15),
                                  Mujeres = rep(NA, 15))
#este ciclo es para llenar el data frame, con la pob correspondiente
#a cada quinquenio
for(i in 1:15) {
  Pob_Quinquenios2020[i, 1] <- paste0(5*(i-1), "-", 5*i-1)
  Pob_Quinquenios2020[i, 2:3] <- colSums(Pob2020[(5*i-4):(5*i),2:3])
}

View(Pob_Quinquenios2020)

#Comprobación
colSums(Pob_Quinquenios2020[ ,2:3]) == colSums(Pob2020[1:75, 2:3])

#Índice Hombre

I_H2020 <- 0

for(i in 2:14){
  num_2020 <- 2*Pob_Quinquenios2020[i, 2]
  den_2020 <- Pob_Quinquenios2020[i-1, 2] + Pob_Quinquenios2020[i+1, 2]
  I_H2020 <- I_H2020 + 100*abs(num_2020/den_2020 -1)/13
}

I_H2020

#Índice Mujer

I_M2020 <- 0

for(i in 2:14){
  num_2020 <- 2*Pob_Quinquenios2020[i, 3]
  den_2020 <- Pob_Quinquenios2020[i-1, 3] + Pob_Quinquenios2020[i+1, 3]
  I_M2020 <- I_M2020 + 100*abs(num_2020/den_2020 -1)/13
}
I_M2020

# indice ambos sexos
I_S2020 <- 0
for(i in 2:14){
  coc1_2020 <- Pob_Quinquenios2020[i, 2] / Pob_Quinquenios2020[i, 3]
  coc2_2020 <- Pob_Quinquenios2020[i+1, 2] / Pob_Quinquenios2020[i+1, 3]
  I_S2020 <- I_S2020 + 100 * abs(coc1_2020 -coc2_2020) / 13
}
I_S2020

#Indice Naciones Unidas

(I_NU2020 <- I_H2020 + I_M2020 + 3*I_S2020)

####################################################################################################################
#Indice de masculinidad
####################################################################################################################

#*****************************************************************************
#iNDICE DE MASCULINIDAD 2010 (I_M2010)
#*****************************************************************************

#Creamos un data frame de 3 columnas y 18 filas, sin datos
Quinquenios2010 <- data.frame(Edad = rep(NA,18),
                              Hombres = rep(NA,18),
                              Mujeres = rep(NA,18))
#ponemos lainformacion en el data frame con los quinqeunios que corresponda

for(i in 1:17){
  Quinquenios2010[i, 1] <- paste0(5*(i-1), "-", 5*i-1)
  Quinquenios2010[i, 2:3] <- colSums(Pob2010[(5*i-4):(5*i), 2:3])
}
Quinquenios2010[18, 1] <- "85 y más"
Quinquenios2010[18, 2:3] <- colSums(Pob2010[86:101, 2:3])

View(Quinquenios2010)

#Comprobacion 2010
colSums(Quinquenios2010[ ,2:3]) == colSums(Pob2010[1:101, 2:3])

#IM2010
IM2010 <- round(Quinquenios2010[ , 2] / Quinquenios2010[ , 3]*100, 0)

#Tabla de presentacion 2010
#Aqui ponemos los data frmaes juntos, tanto el de hombres como el de muejres
T_IM2010 <- cbind (Quinquenios2010, IM2010)

View(T_IM2010)

#*****************************************************************************
#iNDICE DE MASCULINIDAD 2020 (I_M2020)
#*****************************************************************************

#Creamos un data frame de 3 columnas y 18 filas, sin datos
Quinquenios2020 <- data.frame(Edad = rep(NA,18),
                              Hombres = rep(NA,18),
                              Mujeres = rep(NA,18))
#ponemos lainformacion en el data frame con los quinqeunios que corresponda

for(i in 1:17){
  Quinquenios2020[i, 1] <- paste0(5*(i-1), "-", 5*i-1)
  Quinquenios2020[i, 2:3] <- colSums(Pob2020[(5*i-4):(5*i), 2:3])
}
Quinquenios2020[18, 1] <- "85 y más"
Quinquenios2020[18, 2:3] <- colSums(Pob2020[86:101, 2:3])

View(Quinquenios2020)

#Comprobacion 2020
colSums(Quinquenios2020[ ,2:3]) == colSums(Pob2020[1:101, 2:3])

#IM2020
IM2020 <- round(Quinquenios2020[ , 2] / Quinquenios2020[ , 3]*100, 0)

#Tabla de presentacion 2020
#Aqui ponemos los data frmaes juntos, tanto el de hombres como el de muejres
T_IM2020 <- cbind (Quinquenios2020, IM2020)

View(T_IM2020)

###################################################################################################################
#Indice Myers
####################################################################################################################

#*****************************************************************************
#Indice Myers 2010
#*****************************************************************************
# Para la poblacion de mujeres: 
#creamos una matriz con 1 filas y 1 columna,sin datos, la cual nos dira cuanto valen
#las Mj
Mm_2010 <- matrix(NA,10,1)
#Aqui se calcula cuanto vale el num de las Mj
for (j in 0:9) {
  #sumamos las edades cada 10 años desde los 10 alos 60
  Pj1_Mujeres_2010 <- sum(Pob2010$Mujeres[seq(11+j,61+j, by=10)]); Pj1_Mujeres_2010
  #sumamos las edades cada 10 años desde los 20 alos 60
  Pj2_Mujeres_2010 <- sum(Pob2010$Mujeres[seq(21+j,71+j, by=10)]); Pj2_Mujeres_2010
  Mm_2010[j+1] <- (j+1)*Pj1_Mujeres_2010+(9-j)*Pj2_Mujeres_2010
}

m3_2010 = sum(Mm_2010)
Mj_Mujeres_2010 <- matrix(NA,10,1)
#aqui se calcula el valor de las Mj, para ponerlas en la matriz
for (i in 1:10) {
  Mj_Mujeres_2010[i] <- (Mm_2010[i]/m3_2010)-0.10
}
Mj_Mujeres_2010 <- Mj_Mujeres_2010*100; Mj_Mujeres_2010 

# Indice de Myers Resumido Mujeres:
Myers_Mujeres_2010 <- sum(abs(Mj_Mujeres_2010)); Myers_Mujeres_2010


# Para la poblacion de hombres:
#creamos una matriz con 1 filas y 1 columna,sin datos, la cual nos dira cuanto valen
#las Mj
Mh_2010 <- matrix(NA, 10, 1)
#Aqui se calcula cuanto vale el num de las Mj
for (j in 0:9) {
  #sumamos las edades cada 10 años desde los 10 alos 60
  Pj1_Hombres_2010 <- sum(Pob2010$Hombres[seq(11+j,61+j, by=10)]); Pj1_Hombres_2010
  #sumamos las edades cada 10 años desde los 20 alos 60
  Pj2_Hombres_2010 <- sum(Pob2010$Hombres[seq(21+j,71+j, by=10)]); Pj2_Hombres_2010
  Mh_2010[j+1] <- (j+1)*Pj1_Hombres_2010+(9-j)*Pj2_Hombres_2010
}

m2_2010 = sum(Mh_2010)
Mj_Hombres_2010 <- matrix(NA, 10 ,1)
#aqui se calcula el valor de las Mj, para ponerlas en la matriz
for (i in 1:10) {
  Mj_Hombres_2010[i] <- (Mh_2010[i]/m2_2010)-0.10
}
Mj_Hombres_2010 <- Mj_Hombres_2010*100; Mj_Hombres_2010

# Indide de Myers Resumido Hombres:
Myers_Hombres_2010 <- sum(abs(Mj_Hombres_2010)); Myers_Hombres_2010

#*****************************************************************************
#Indice Myers 2020
#*****************************************************************************
# Para la poblacion de mujeres: 
#creamos una matriz con 1 filas y 1 columna,sin datos, la cual nos dira cuanto valen
#las Mj
Mm_2020 <- matrix(NA,10,1)
#Aqui se calcula cuanto vale el num de las Mj
for (j in 0:9) {
  #sumamos las edades cada 10 años desde los 10 alos 60
  Pj1_Mujeres_2020 <- sum(Pob2020$Mujeres[seq(11+j,61+j, by=10)]); Pj1_Mujeres_2020
  #sumamos las edades cada 10 años desde los 20 alos 60
  Pj2_Mujeres_2020 <- sum(Pob2020$Mujeres[seq(21+j,71+j, by=10)]); Pj2_Mujeres_2020
  Mm_2020[j+1] <- (j+1)*Pj1_Mujeres_2020+(9-j)*Pj2_Mujeres_2020
}

m3_2020 = sum(Mm_2020)
Mj_Mujeres_2020 <- matrix(NA,10,1)
#aqui se calcula el valor de las Mj, para ponerlas en la matriz
for (i in 1:10) {
  Mj_Mujeres_2020[i] <- (Mm_2020[i]/m3_2020)-0.10
}
Mj_Mujeres_2020 <- Mj_Mujeres_2020*100; Mj_Mujeres_2020 

# Indice de Myers Resumido Mujeres:
Myers_Mujeres_2020 <- sum(abs(Mj_Mujeres_2020)); Myers_Mujeres_2020


# Para la poblacion de hombres:
#creamos una matriz con 1 filas y 1 columna,sin datos, la cual nos dira cuanto valen
#las Mj
Mh_2020 <- matrix(NA, 10, 1)
#Aqui se calcula cuanto vale el num de las Mj
for (j in 0:9) {
  #sumamos las edades cada 10 años desde los 10 alos 60
  Pj1_Hombres_2020 <- sum(Pob2020$Hombres[seq(11+j,61+j, by=10)]); Pj1_Hombres_2020
  #sumamos las edades cada 10 años desde los 20 alos 60
  Pj2_Hombres_2020 <- sum(Pob2020$Hombres[seq(21+j,71+j, by=10)]); Pj2_Hombres_2020
  Mh_2020[j+1] <- (j+1)*Pj1_Hombres_2020+(9-j)*Pj2_Hombres_2020
}

m2_2020 = sum(Mh_2020)
Mj_Hombres_2020 <- matrix(NA, 10 ,1)
#aqui se calcula el valor de las Mj, para ponerlas en la matriz
for (i in 1:10) {
  Mj_Hombres_2020[i] <- (Mh_2020[i]/m2_2020)-0.10
}
Mj_Hombres_2020 <- Mj_Hombres_2020*100; Mj_Hombres_2020

# Indide de Myers Resumido Hombres:
Myers_Hombres_2020 <- sum(abs(Mj_Hombres_2020)); Myers_Hombres_2020

####################################################################################################################
#Indice Whipple
####################################################################################################################

#*****************************************************************************
#Indice de whipple 2010
#*****************************************************************************
#Whipple Hombres
w1_2010= sum(Pob2010$Hombres[seq(26,61, by=5)])
w2_2010= sum(Pob2010$Hombres[seq(24,63)])
Whipple_Hombres_2010=(5*w1_2010/w2_2010)*100;Whipple_Hombres_2010

#Whipple Mujeres
w3_2010= sum(Pob2010$Mujeres[seq(26,61, by=5)])
w4_2010= sum(Pob2010$Mujeres[seq(24,63)])
Whipple_Mujeres_2010=(5*w3_2010/w4_2010)*100;Whipple_Mujeres_2010

#*****************************************************************************
#indice de Whipple 2020
#*****************************************************************************
#Hombres
w1_2020= sum(Pob2020$Hombres[seq(26,61, by=5)])
w2_2020= sum(Pob2020$Hombres[seq(24,63)])
Whipple_Hombres_2020=(5*w1_2020/w2_2020)*100;Whipple_Hombres_2020

#Mujeres
w3_2020= sum(Pob2020$Mujeres[seq(26,61, by=5)])
w4_2020= sum(Pob2020$Mujeres[seq(24,63)])
Whipple_Mujeres_2020=(5*w3_2020/w4_2020)*100;Whipple_Mujeres_2020


####################################################################################################################
#Razon de dependencia
####################################################################################################################

#*****************************************************************************
#Razon de dependencia 2010
#*****************************************************************************
#razon de dep para hombres
#redondeamos la razon de dep para hombres
(RD_H2010 <- round(sum(Quinquenios2010[c(1:3, 14:18), 2]) / sum(Quinquenios2010[4:13, 2])*100))

#razon de dep para muejres
#redondeamos la razon de dep para mujeres
(RD_M2010 <- round(sum(Quinquenios2010[c(1:3, 14:18), 3]) / sum(Quinquenios2010[4:13, 3])*100))

#razon de dep general
#redondeamos la razon de dep en general
(RD_2010 <- round(sum(Quinquenios2010[c(1:3, 14:18), 2:3]) / sum(Quinquenios2010[4:13, 2:3])*100))

#*****************************************************************************
#Razon de dependencia 2020
#*****************************************************************************
#razon de dep para hombres
#redondeamos la razon de dep para hombres
(RD_H2020 <- round(sum(Quinquenios2020[c(1:3, 14:18), 2]) / sum(Quinquenios2020[4:13, 2])*100))

#razon de dep para muejres
#redondeamos la razon de dep para mujeres
(RD_M2020 <- round(sum(Quinquenios2020[c(1:3, 14:18), 3]) / sum(Quinquenios2020[4:13, 3])*100))

#razon de dep general
#redondeamos la razon de dep en general
(RD_2020 <- round(sum(Quinquenios2020[c(1:3, 14:18), 2:3]) / sum(Quinquenios2020[4:13, 2:3])*100))

####################################################################################################################
#Prorrateo
####################################################################################################################

#*****************************************************************************
#Prorrateo 2010
#*****************************************************************************

#porcentaje de concentracion de la poblacion no especificada
Pob_Total_Hombres_2010 <- sum(Pob2010$Hombres)
Pob_NE_Hombres_2010 <- Pob2010$Hombres[length(Pob2010$Edad)]
#Se encuentran los no especificados
alfa_Hombres_2010 = (Pob_NE_Hombres_2010 / (Pob_Total_Hombres_2010 - Pob_NE_Hombres_2010)); alfa_Hombres_2010

Pob_Total_Mujeres_2010 <- sum(Pob2010$Mujeres)
Pob_NE_Mujeres_2010 <- Pob2010$Mujeres[length(Pob2010$Edad)]
#Se encuentran los no especificados
alfa_Mujeres_2010 = (Pob_NE_Mujeres_2010 / (Pob_Total_Mujeres_2010 - Pob_NE_Mujeres_2010)); alfa_Mujeres_2010

#se crea una matriz para la pob prorrateada
#con 3 columnas, 1 fila y sin datos
Pob2010_Prorrateo <- matrix(NA, length(Pob2010$Edad)-1,3)
#nombres de las columnas
colnames(Pob2010_Prorrateo) <- c("Edad", "Hombres", "Mujeres")
#se convierte en data frame
Pob2010_Prorrateo = data.frame(Pob2010_Prorrateo)
Pob2010_Prorrateo$Edad = Pob2010$Edad[-length(Pob2010$Edad)]

#Prorrateo
#para hombres
#queremos ver si prorrateamos o no por eso preguntamos si
#el porcentaje es mayor al 5%
if(alfa_Hombres_2010>=0.05){
  for(i in 1:(length(Pob2010$Edad)-1)){
    Pob2010_Prorrateo$Hombres[i] = Pob2010$Hombres[i] + Pob2010$Hombres[i]*alfa_Hombres_2010
  }
}else{
  #si no fue mayor, solo eliminamos la fila de la pob
  #no especificada
  Pob2010_Prorrateo$Hombres = Pob2010$Hombres[-length(Pob2010$Edad)]
}
#para mujeres
#queremos ver si prorrateamos o no por eso preguntamos si
#el porcentaje es mayor al 5%
if(alfa_Mujeres_2010>=0.05){
  for(i in 1:(length(Pob2010$Edad)-1)){
    Pob2010_Prorrateo$Mujeres[i] = Pob2010$Mujeres[i] + Pob2010$Mujeres[i]*alfa_Mujeres_2010
  }
}else{
  #si no fue mayor, solo eliminamos la fila de la pob
  #no especificada
  Pob2010_Prorrateo$Mujeres = Pob2010$Mujeres[-length(Pob2010$Edad)]
}
#Comprobacion

sum(Pob2010_Prorrateo$Hombres) == sum(Pob2010$Hombres[1:length(Pob2010$Edad)-1])
sum(Pob2010_Prorrateo$Mujeres) == sum(Pob2010$Mujeres[1:length(Pob2010$Edad)-1])

View(Pob2010_Prorrateo)
#creamos un csv, por si se ocupa
#write.csv(Pob2010_Prorrateo, "C:\\Users\\Emilio\\Documents\\Demografia\\Pob2010_Prorrateo.csv")
#*****************************************************************************
#Prorrateo 2020
#*****************************************************************************

#porcentaje de concentracion de la poblacion no especificada
Pob_Total_Hombres_2020 <- sum(Pob2020$Hombres)
Pob_NE_Hombres_2020 <- Pob2020$Hombres[length(Pob2020$Edad)]
#Se encuentran los no especificados
alfa_Hombres_2020 = (Pob_NE_Hombres_2020 / (Pob_Total_Hombres_2020 - Pob_NE_Hombres_2020)); alfa_Hombres_2020

Pob_Total_Mujeres_2020 <- sum(Pob2020$Mujeres)
Pob_NE_Mujeres_2020 <- Pob2020$Mujeres[length(Pob2020$Edad)]
#Se encuentran los no especificados
alfa_Mujeres_2020 = (Pob_NE_Mujeres_2020 / (Pob_Total_Mujeres_2020 - Pob_NE_Mujeres_2020)); alfa_Mujeres_2020

#se crea una matriz para la pob prorrateada
#con 3 columnas, 1 fila y sin datos
Pob2020_Prorrateo <- matrix(NA, length(Pob2020$Edad)-1,3)
#nombres de las columnas
colnames(Pob2020_Prorrateo) <- c("Edad", "Hombres", "Mujeres")
#se convierte en data frame
Pob2020_Prorrateo = data.frame(Pob2020_Prorrateo)
Pob2020_Prorrateo$Edad = Pob2020$Edad[-length(Pob2020$Edad)]

#Prorrateo
#para hombres
#queremos ver si prorrateamos o no por eso preguntamos si
#el porcentaje es mayor al 5%
if(alfa_Hombres_2020>=0.05){
  for(i in 1:(length(Pob2020$Edad)-1)){
    Pob2020_Prorrateo$Hombres[i] = Pob2020$Hombres[i] + Pob2020$Hombres[i]*alfa_Hombres_2020
  }
}else{
  #si no fue mayor, solo eliminamos la fila de la pob
  #no especificada
  Pob2020_Prorrateo$Hombres = Pob2020$Hombres[-length(Pob2020$Edad)]
}
#para mujeres
#queremos ver si prorrateamos o no por eso preguntamos si
#el porcentaje es mayor al 5%
if(alfa_Mujeres_2020>=0.05){
  for(i in 1:(length(Pob2020$Edad)-1)){
    Pob2020_Prorrateo$Mujeres[i] = Pob2020$Mujeres[i] + Pob2020$Mujeres[i]*alfa_Mujeres_2020
  }
}else{
  #si no fue mayor, solo eliminamos la fila de la pob
  #no especificada
  Pob2020_Prorrateo$Mujeres = Pob2020$Mujeres[-length(Pob2020$Edad)]
}
#Comprobacion

sum(Pob2020_Prorrateo$Hombres) == sum(Pob2020$Hombres[1:length(Pob2020$Edad)-1])
sum(Pob2020_Prorrateo$Mujeres) == sum(Pob2020$Mujeres[1:length(Pob2020$Edad)-1])

View(Pob2020_Prorrateo)
#creamos un csv, por si se ocupa
#write.csv(Pob2020_Prorrateo, "C:\\Users\\Emilio\\Documents\\Demografia\\Pob2020_Prorrateo.csv")
####################################################################################################################
#Metodo de 1/16
####################################################################################################################

#*****************************************************************************
#Metodo de 1/16 2010
#*****************************************************************************
#Generamos un dataframe para alojar los grupos quinquenales
quinquenios2010 <- data.frame(NA,18,3)

for (i in seq(5,85,by = 5)) {
  #se suman edades desplegadas
  quinquenios2010[(i/5),2:3] <- cumsum(Pob2010_Prorrateo[(i-4):i,2:3])[5,]
  
}
quinquenios2010[18,2:3] <- cumsum(Pob2010_Prorrateo[86:101,2:3])[16,]
colnames(quinquenios2010) <- c("Edad", "Hombres", "Mujeres")
quinquenios2010$Edad <- c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", 
                          "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80-84","85 y mas")
#se enumeran los renglones
rownames(quinquenios2010) <- c(seq(1:18))
View(quinquenios2010)

Correccion2010 <- quinquenios2010 
for (i in 3:15) {
  Correccion2010[i,2:3] <- (1/16)*(-1*Quinquenios2010[i+2,2:3]+4*quinquenios2010[i+1,2:3]+
                                     10*quinquenios2010[i,2:3]+4*quinquenios2010[i-1,2:3]-1*quinquenios2010[i-2,2:3])
  
}
Correccion2010

fac_cuadratura = Correccion2010
fac_cuadratura$Hombres = Correccion2010$Hombres/sum(Correccion2010$Hombres)
fac_cuadratura$Mujeres = Correccion2010$Mujeres/sum(Correccion2010$Mujeres)
Correccion2010_cuadratura = Correccion2010
Correccion2010_cuadratura$Hombres = sum(Pob2010_Prorrateo$Hombres)*fac_cuadratura$Hombres
Correccion2010_cuadratura$Mujeres = sum(Pob2010_Prorrateo$Mujeres)*fac_cuadratura$Mujeres

#Corroborar:
sum(Pob2010_Prorrateo$Hombres) == sum(Correccion2010_cuadratura$Hombres)
sum(Pob2010_Prorrateo$Mujeres) == sum(Correccion2010_cuadratura$Mujeres)
View(Correccion2010_cuadratura)

#Redondear
#Creamos una nueva variable para no sobre escribir Correccion2010_cuadratura
Correccion2010_cuadratura_redondeada = Correccion2010_cuadratura
Correccion2010_cuadratura_redondeada[ ,2:3] = round(Correccion2010_cuadratura_redondeada[ ,2:3]);Correccion2010_cuadratura_redondeada
rownames(Correccion2010_cuadratura) <- C(seq(1:18))
View(Correccion2010_cuadratura_redondeada)

#creamos los csv que nos serviran para graficar con mas facilidad en excel

#write.csv(Correccion2010_cuadratura, "C:\\Users\\Emilio\\Documents\\Demografia\\Correccion2010_cuadratura.csv")
#write.csv(Correccion2010_cuadratura_redondeada, "C:\\Users\\Emilio\\Documents\\Demografia\\Correccion2010_cuadratura_redondeada.csv")

#*****************************************************************************
#Metodo de 1/16 2020
#*****************************************************************************

#Generamos un dataframe para alojar los grupos quinquenales
quinquenios2020 <- data.frame(NA,18,3)

for (i in seq(5,85,by = 5)) {
  #se suman edades desplegadas
  quinquenios2020[(i/5),2:3] <- cumsum(Pob2020_Prorrateo[(i-4):i,2:3])[5,]
  
}
quinquenios2020[18,2:3] <- cumsum(Pob2020_Prorrateo[86:101,2:3])[16,]
colnames(quinquenios2020) <- c("Edad", "Hombres", "Mujeres")
quinquenios2020$Edad <- c("0-4", "5-9", "10-14", "15-19", "20-24", "25-29", "30-34", "35-39", "40-44", "45-49", 
                          "50-54", "55-59", "60-64", "65-69", "70-74", "75-79", "80-84","85 y mas")
#se enumeran los renglones
rownames(quinquenios2020) <- c(seq(1:18))
View(quinquenios2020)

Correccion2020 <- quinquenios2020 
for (i in 3:15) {
  Correccion2020[i,2:3] <- (1/16)*(-1*Quinquenios2020[i+2,2:3]+4*quinquenios2020[i+1,2:3]+
                                     10*quinquenios2020[i,2:3]+4*quinquenios2020[i-1,2:3]-1*quinquenios2020[i-2,2:3])
  
}
Correccion2020

fac_cuadratura = Correccion2020
fac_cuadratura$Hombres = Correccion2020$Hombres/sum(Correccion2020$Hombres)
fac_cuadratura$Mujeres = Correccion2020$Mujeres/sum(Correccion2020$Mujeres)
Correccion2020_cuadratura = Correccion2020
Correccion2020_cuadratura$Hombres = sum(Pob2020_Prorrateo$Hombres)*fac_cuadratura$Hombres
Correccion2020_cuadratura$Mujeres = sum(Pob2020_Prorrateo$Mujeres)*fac_cuadratura$Mujeres

#Corroborar:
sum(Pob2020_Prorrateo$Hombres) == sum(Correccion2020_cuadratura$Hombres)
sum(Pob2020_Prorrateo$Mujeres) == sum(Correccion2020_cuadratura$Mujeres)
View(Correccion2020_cuadratura)

#Redondear
#Creamos una nueva variable para no sobre escribir Correccion2020_cuadratura
Correccion2020_cuadratura_redondeada = Correccion2020_cuadratura
Correccion2020_cuadratura_redondeada[ ,2:3] = round(Correccion2020_cuadratura_redondeada[ ,2:3]);Correccion2020_cuadratura_redondeada
rownames(Correccion2020_cuadratura) <- C(seq(1:18))
View(Correccion2020_cuadratura_redondeada)

#creamos los csv que nos serviran para graficar con mas facilidad en excel

#write.csv(Correccion2020_cuadratura, "C:\\Users\\Emilio\\Documents\\Demografia\\Correccion2020_cuadratura.csv")
#write.csv(Correccion2020_cuadratura_redondeada, "C:\\Users\\Emilio\\Documents\\Demografia\\Correccion2020_cuadratura_redondeada.csv")