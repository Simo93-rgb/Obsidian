######
#### Metodo Montecalo Sempice con esponenziale

# 1. Genero un insieme di uniformi iid come U(0,1)
taglia.campionaria <- 1000
uniformi <- runif(taglia.campionaria)
# 2. definisco theta come la soluzione analitica dell'integrale in [0,1]
theta <- 1-exp(-1)
# 3. calcolo theta cappello. 
theta.hat.sum <- taglia.campionaria^-1 * sum(exp(-uniformi))
theta.hat.mean <- mean(exp(-uniformi))
  # Quì per curiosità ho calcolato sia come sommatoria che come media
# 4. Confronto grafico
theta.hat.mean <- cumsum(exp(-uniformi))/(1:taglia.campionaria)
  # cumsum() mi permette di vedere l'andamento man mano che procedo
  # con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col=2, lwd=2)

#####