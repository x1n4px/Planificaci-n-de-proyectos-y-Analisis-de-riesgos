# PROBLEMA 3

# Resolver el problema (paquetes lpSolve) de transporte definido por los siguientes datos: 

  
# Las filas corresponden a los lugares de origen y las columnas a los lugares de destino. Los valores de
# la matriz son los costes de transporte desde cada origen a cada destino. El último elemento de cada
# fila es la oferta de producto en cada origen. El último elemento de cada columna es la demanda
# total en cada destino.

library(lpSolve)

# Definir la función objetivo (costos)
costos <- c(3, 4, 6, 8, 9, 
            2, 2, 4, 5, 5, 
            2, 2, 2, 3, 3, 
            3, 3, 2, 4, 2)


rhs_capacidades <- c(30, 80, 10, 60)  # Capacidades máximas

rhs_demandas <- c(10, 50, 20, 80, 20)  # Demandas mínimas

# Definir las restricciones de capacidad (desigualdades)
capacidades <- matrix(c(1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,  # A1
                        0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0,  # A2
                        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1), # A3
                      nrow = 3, byrow = TRUE)

# Definir las restricciones de demanda (igualdades)
demandas <- matrix(c(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0,  # F1
                     0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0,  # F2
                     0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0,  # F3
                     0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0,  # F4
                     0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1),  # F5
                   nrow = 5, byrow = TRUE)


# Unir todas las restricciones
restricciones <- rbind(capacidades, demandas)

# Definir los sentidos de las restricciones ("<=", "=", etc.)
sentidos <- c(rep("<=", 5), rep("=", 5))

# Resolver el problema de PL
resultado <- lp(direction = "min", objective.in = costos, const.mat = restricciones, 
                const.dir = sentidos, const.rhs = c(rhs_capacidades, rhs_demandas))

# Mostrar los resultados
print(paste("Costo mínimo total:", resultado$objval))
print("Piezas transportadas desde cada almacén a cada fábrica:")
print(matrix(resultado$solution, nrow = 3, byrow = TRUE))







