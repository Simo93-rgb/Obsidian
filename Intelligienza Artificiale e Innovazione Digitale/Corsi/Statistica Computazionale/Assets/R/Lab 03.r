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
rm(list = ls()) # svuoto environment
#### Metodo montecarlo con estremi integrazione differenti
#### Ci sono due modi e li vedremo entrambi

## Primo Metodo: Cambio variabile integrale
# 1. Genero un insieme di uniformi iid come U(0,1)
taglia.campionaria <- 1000
uniformi <- runif(taglia.campionaria)
# 2. definisco theta come la soluzione analitica 
#    dell'integrale in [0,1] ma con variabili cambiate
theta <- exp(-2)-exp(-4)
# 3. calcolo theta cappello. 
theta.hat <- mean(exp(-(2+2*uniformi)))
theta.hat.mean <- 2*cumsum(exp(-(2+2*uniformi)))/(1:taglia.campionaria)
# cumsum() mi permette di vedere l'andamento man mano che procedo
# con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col="RED", lwd=2)

#####
rm(list = ls()) # svuoto environment
## Secondo Metodo: Utilizzo uniforme U(2,4)
# 1. Genero un insieme di uniformi iid come U(2,4)
taglia.campionaria <- 1000
uniformi <- runif(taglia.campionaria, min=2, max=4)
# 2. definisco theta come la soluzione analitica 
#    dell'integrale in [0,1] ma con variabili cambiate
theta <- exp(-2)-exp(-4)
# 3. calcolo theta cappello. 
theta.hat <- mean(exp(-(uniformi)))
theta.hat.mean <- 2*cumsum(exp(-(uniformi)))/(1:taglia.campionaria)
# cumsum() mi permette di vedere l'andamento man mano che procedo
# con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col="RED", lwd=2)

#####
rm(list = ls()) # svuoto environment
#### Metodo analitico per l'approssimazione della phi della normale
# 1. fisso x ma lo faccio con una sequenza di numeri che scelgo casuali
x.seq <-  runif(25) #seq(.1, 2.5, .1)
# 2. Fisso la taglia campionaria
taglia.campionaria <- 1000
# 3. Genero le m uniformi iid come U(0,x)
# 4. Calcolo theta.hat 
theta.hat.analitico <- NULL
for (i in 1:length(x.seq)) {
  uniformi <- runif(taglia.campionaria, min = 0, max = x.seq[i]) # 3
  theta.hat.analitico[i] <- 0.5 + mean((x.seq[i] / sqrt(2 * pi)) * exp(-(uniformi^2 / 2)))
}
cdf.teo <- pnorm(x.seq)
# calcolo lo standard error
se.theta.hat.analitico <- sqrt(theta.hat.analitico * (1-theta.hat.analitico) / taglia.campionaria)
cbind(x.seq, cdf.teo, theta.hat.analitico, se.theta.hat.analitico)

#####
#### Metodo Montecarlo hit-or-miss
rm(list = ls()) # svuoto environment
# 1. fisso x ma lo faccio con una sequenza di numeri che scelgo casuali
 x.seq <- seq(.1, 2.5, .1)
# 2. Fisso la taglia campionaria
taglia.campionaria <- 1000
# 3. Genero le m normali iid come N(0,1)
# 4. Calcolo theta.hat
theta.hat.H.o.M <- NULL
for (i in 1:length(x.seq)) {
  normali <- rnorm(taglia.campionaria)
  theta.hat.H.o.M[i] <- mean(normali <= x.seq[i])
}
cdf.teo <- pnorm(x.seq)
# calcolo lo standard error
se.theta.hat.H.o.M <- sqrt(theta.hat.H.o.M * (1-theta.hat.H.o.M) / taglia.campionaria)


#####
rm(list = ls()) # svuoto environment
# Inizializzo parametri comuni
x.seq <-  seq(.1, 2.5, .1)
taglia.campionaria <- 1000
theta.hat.analitico <- NULL
theta.hat.H.o.M <- NULL

#eseguo un solo ciclo per entrambi i casi
for (i in 1:length(x.seq)) {
  uniformi <- runif(taglia.campionaria, min = 0, max = x.seq[i]) 
  theta.hat.analitico[i] <- 0.5 + mean((x.seq[i] / sqrt(2 * pi)) * exp(-(uniformi^2 / 2)))
  
  normali <- rnorm(taglia.campionaria)
  theta.hat.H.o.M[i] <- mean(normali <= x.seq[i])
}
# definisco gli standard error dei due casi
cdf.teo <- pnorm(x.seq)
se.theta.hat.analitico <- sqrt(theta.hat.analitico * (1-theta.hat.analitico) / taglia.campionaria)
se.theta.hat.H.o.M <- sqrt(theta.hat.H.o.M * (1-theta.hat.H.o.M) / taglia.campionaria)

# bindo insieme per un confronto
cbind(x.seq, cdf.teo, theta.hat.analitico, se.theta.hat.analitico, theta.hat.H.o.M, se.theta.hat.H.o.M)































