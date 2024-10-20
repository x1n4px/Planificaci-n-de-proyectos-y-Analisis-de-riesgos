# PROBLEMA 4




library(boot)

enj <- c(20, 30)
vitx <- c(3, 6)
vity <- c(1, 0.5)
vitz <- c(1, 1)

simplex(a = enj, A1 = rbind(vitx, vity, vitz), b1 = c(150, 22, 27.5), maxi = TRUE)
