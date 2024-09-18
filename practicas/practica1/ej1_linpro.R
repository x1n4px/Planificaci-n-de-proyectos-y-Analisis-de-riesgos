# PROBLEMA 1

#Un pastelero dispone de 150 kg de harina, 22 kg de azúcar y 27.5 kg de mantequilla para elaborar
#los tipos de pasteles (A y B). Cada caja de pasteles de tipo A requiere 3 kg de harina, 1 kg de azúcar
#y 1 kg de mantequilla y su venta le reporta un beneficio de 20 euros. Cada caja de pasteles de tipo B
#requiere 6 kg de harina, 0.5 kg de azúcar y 1 kg de mantequilla y su venta le reporta un beneficio de
#30 euros.¿Cuántas cajas de cada tipo debe elaborar el pastelero de manera que se maximicen sus
#ganancias? (Se supone en principio que también puede elaborar cajas incompletas, es decir, que no
#            se trata de un problema de programación entera.). Define un modelo de PL y resuelve el problema
#con R (paquetes lpSolve y linprog) y PHPSimplex (http://www.phpsimplex.com/). 



library(linprog)


install.packages("lpSolve")
library(lpSolve)

# Coeficientes de la función objetivo (beneficios)
objetivo <- c(20, 30)

# Matriz de coeficientes de las restricciones
restricciones <- matrix(c(3, 6,   # Harina
                          1, 0.5, # Azúcar
                          1, 1),  # Mantequilla
                        nrow=3, byrow=TRUE)

# Lado derecho de las restricciones (recursos disponibles)
derecho <- c(150, 22, 27.5)

# Tipos de restricciones (todas son <=)
direccion <- c("<=", "<=", "<=")



# Solución óptima 

optimo <- solveLP(objetivo,derecho, restricciones, maximum = TRUE, direccion)
optimo$opt
optimo$solution[1]
optimo$solution[2]
cat("Ganancia máxima: ", optimo$opt)
cat("Cantidad de cajas del tipo A: ", optimo$solution[1])
cat("Cantidad de cajas del tipo B: ", optimo$solution[2])
