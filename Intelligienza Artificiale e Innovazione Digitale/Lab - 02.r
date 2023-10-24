# LAB-2
## 

# confrontiamo distribuzione t-student con N(0,1)
#####
xx <- seq(-3,3 , 0.01)
yy <- dt(xx, df = 5)
plot(xx, yy, type = "l", col = 2, lwd = 3, ylim = c(0, 0.5))

yy.norm <- dnorm(xx)
# sicome plot apre una nuova pagina uso lines per sovrascrivere il plot precedente
lines(xx, yy.norm, col = 1, lwd = 3)

legend(-3, 0.3, legend = c("t-student", "N(0,1)"), col = c(2,1), lwd = 3 )

#####
# rappresentare la Legge dei grandi numeri (LGN)
#####
# Voglio stimare la media di X ossia E[x] usando la media campionaria
# costruisco l'esperimento del lancio del dado
Omega <- 1:6 # il mio dado
n <- 1000 # il numero di lanci
x <- sample(Omega, size = n, replace = TRUE)  # vettore di lunghezza "size" contenente i lanci del dado

media <- cumsum(x)/1:n   # "cumsum" effettua somme cumulate e la divisione viene 
# fatta componente per componente
plot(media, xlab = "taglia campionaria", ylab = "media campionaria", 
     main = "media campionaria al variare di n",
     ylim = c(1,6) )
abline(h=3.5, col = 2, lwd = 2)

#####
# rappresentare TLC
#IDEA: simulo tante volte Z e disegno l'istogramma delle Z sovraposto alla pdf di una N(0,1)
#####
n <- 1000  # taglia delle X
m <- 1000 # taglia delle Z
# Se per simulare Z ho bisogno di n vc X alora per m Z ho bisogno di un numero 
# m*n di X
x <- sample(1:6, size = m*n, replace = TRUE) 
A <- matrix(x, ncol = n)  # contiene tutte le estrazioni fatte. dim = m x n .
dim(A)
medie.camp <- apply(A,1,mean) # applica la funzione "mean" a ciascuna riga della matrice A
# apply mi evita di fare un ciclo for
length(medie.camp)
# dobbiamo standardizzare, serve calcolare media e varianza teorica:
media.teo <- 1:6 %*% rep(1/6, 6)  
# "rep" ripete il valore 1/6 in una sequenza con 6 elementi. In questo caso è il vettore delle probabilità
# %*%  calcola il prodotto scalare tra vettori, ossia somma dei prodotti componente per componente

var.teo <- (1:6 - media.teo)^2 %*% rep(1/6, 6) #sfrutta la sottrazione vettore per scalare che R ci consente di fare 
var.teo <- (1:6 - rep(media.teo,6))^2 %*% rep(1/6, 6) #ortodosso 

z <- (medie.camp - media.teo)/ sqrt(var.teo/n)
length(z)
hist(z, freq = FALSE, breaks = 25)  # L'opzione freq = FALSE genera l'istogramma con le densita' di frequenza 
# (aree dei rettangoli possono essere interpretate come probabilita')
lines(xx, dnorm(xx), col = 2, lwd =2)

#####
# METODO di inversione PER GENERARE VARIABILI CASUALI
#####
# osserviamo che i numeri sono PSEUDO-casuali
set.seed(123)
runif(1)

# generiamo esponenziale di parametro lambda
lambda <- 1
n <- 1000
u <- runif(n)
x <- -1/lambda * log(1-u)
hist(x, freq = F)
xx <- seq(0.01,6, 0.01)
lines(xx, dexp(xx, rate = 1), col = 2, lwd = 2)

rexp(100, rate = 1) # generare variabili casuali esponenziali usando R

# genero Bernoulli di parametro pi.teo
pi.teo <- 0.3
(runif(100) < pi.teo)*1  # esiti di bernoulli di parametro 0.3
