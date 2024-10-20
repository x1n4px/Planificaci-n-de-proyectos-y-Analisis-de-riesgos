# PROBLEMA 4




library(boot)

enj <- c(100, 115, 80, 105)
vitx <- c(4, 6, 5, 9)
vity <- c(8, 7, 9, 4)
vitz <- c(7, 8, 7, 6)

simplex(a = enj, A1 = rbind(vitx, vity, vitz), b1 = c(100, 200, 150), maxi = TRUE)