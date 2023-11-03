Prima di definire cosa siano o perché si utilizzino bisogna introdurre un grosso problema e risolverlo poiché da lì andremo poi a definire tutto. 

## Problemi Integrazione
Siccome non tutti gli integrali possono essere calcolati in modo esplicito si ricorre a *metodi numerici di integrazione*. Supponiamo di avere una funzione che sappiamo essere integrabile in un intervallo definito e come  *prima idea* per calcolare l'integrale ci rifacciamo alla definizione di integrale di Riemann ossia l'approccio con infiniti rettangoli sotto la curva. Si può anche migliorare col metodo dei trapezi che fa meno approssimazione con l'area. Ci sono tanti metodi e sono tutti deterministici.  Una seconda idea è il **Metodo Montecarlo**

# Metodo Montecarlo Semplice

Sia $X$ una vc con pdf il cui supporto di $f(\bullet)$  è $\mathbb{R}$, allora $$\mathbb{E}[g(X)]=\int_{\mathbb{R}}g(x)f(x)dx$$Che poi è la definizione di media per $X$ quando è continua. 
Diciamo che vogliamo approssimare un integrale semplice per avere un esempio chiaro $$I=\int_0^1g(x)\,dx=\int_0^1g(x)*1\,dx$$Ho esplicitato quel $1$ poiché adesso voglio che venga visto come se fosse la pdf di una $U\sim \mathcal{U}(0,1)$. Quindi, siccome sto integrando fra zero e uno e ho una uniforme di mezzo posso vedere il mio integrale $I$ così $$I=\int_0^1g(x)dx=\mathbb{E}[g(U)]=\Theta$$Quindi ho trovato il parametro incognito che vogliamo stimare, ossia vogliamo stimare una media teorica di $g(U)$ e sappiamo che per stimare una media teorica mi serve la media campionaria e ricordiamo essere corretto come visto in [[TLC e LGN#Legge dei Grandi Numeri|Legge dei Grandi Numeri]]. 

### Esempio con esponenziale
$$I=\theta=\int_0^1e^{-x}dx=-e^{-x}\bigg|_0^1=-e^{-1}+e^0=1-{1\over e}$$Ora che abbiamo l'integrale $I$ definito e calcolato nell'insieme di integrazione $[0,1]$ come mostrato sopra possiamo definire l'algoritmo, ricordando che $\Theta$ abbiamo detto prima essere il valore atteso della funzione integrata con la variabile riscritta come uniforme. 
**ALGORITMO**
1. Genero $U_1,...,U_n$ iid come $\mathcal{U}(0,1)$
2. $\hat \Theta={1\over m}\sum_{i=1}^me^{-U_i}$

Ecco il codice del **Lab 03**
```R
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
c(theta, theta.hat.mean)
# 4. Confronto grafico
theta.hat.mean <- cumsum(exp(-uniformi))/(1:taglia.campionaria)
  # cumsum() mi permette di vedere l'andamento man mano che procedo
  # con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col=2, lwd=2)
```
Con esempio di esperimento realizzato ![[Metodi Montecarlo - Realizzazione MC Semplice.png]]

### Esempio con Cambio variabili
Supponiamo che ora il mio $I$ abbia estremi di integrazione differenti $$I = \int_2^4e^{-x}dx$$Posso risolvere il problema e ricondurmi alla situazione precedente semplicemente cambiando le variabili $$\begin{align} 
y = {x-a\over b-a}&\quad a=2,\,b=4\\
x = a+y(b-a)&\quad dx=(b-a)dy\\
\end{align}$$Sostituendo nell'integrale $I$ ottengo $$I = \int_0^1e^{(2+y(4-2))}\,(4-2)dy = \int_0^1e^{(-2+2y)}\,2dy$$ $$I = \mathbb{E}[2e^{(-2+2U)}]$$Per trovare $\Theta$ devo risolvere l'integrale e ottengo come risultato $\theta = -e^{-(2+2y)}\bigg|_0^1 = e^{-2}-e^{-4}$. Visto che conosco il mio pollo (IO), $\int _{\:}^{\:}e^{-\left(2+2x\right)}\:dx=-{1\over 2}e^{-(2+2x)}$, ma se ho una costante moltiplicativa $2$ al $dx$ che posso portare fuori va poi a semplificarsi con $1\over2$. 
```R
#### Metodo montecarlo con estremi integrazione differenti

## Primo Metodo: Cambio variabile integrale
# 1. Genero un insieme di uniformi iid come U(0,1)
taglia.campionaria <- 1000
uniformi <- runif(taglia.campionaria)
# 2. definisco theta come la soluzione analitica 
#    dell'integrale in [0,1] ma con variabili cambiate
theta <- exp(-2)-exp(-4)
# 3. calcolo theta cappello. 
theta.hat <- mean(exp(-(2+2*uniformi)))
c(theta, theta.hat)

theta.hat.mean <- 2*cumsum(exp(-(2+2*uniformi)))/(1:taglia.campionaria)
# cumsum() mi permette di vedere l'andamento man mano che procedo
# con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col="RED", lwd=2)
```

### Esempio con U(2,4)
Posso anche pensare di non manipolare l'integrale e di cambiare la mia uniforme in una $U\sim \mathcal{U}(2,4)$. Attenzione ad una cosa, l'area di una uniforme è di fatto un rettangolo quindi deve sempre valere che $b*h=1$. Nella $\mathcal{0,1}$ ho un rettangolo con lato di base che vale 1, quindi anche l'altezza lo è per forza. Con una $\mathcal{U}(2,4)$ invece la base vale $2$ e di conseguenza l'altezza deve per forza valere $1\over2$. Questa precisazione forse ovvia è importante perché nel Metodo Montecarlo io utilizzo l'idea che ho una pdf di una $\mathcal{U}(0,1)$ che vale $1$ inserita come membro nell'integrale. D'altronde se moltiplico e divido per $1$ l'integrale non varia. Qui devo usare $1\over2$ che andrà quindi corretto esternamente con un $2$.$$I = 2\int_2^4{1\over2}e^{-x}dx = 2\mathbb{E}[e^{-U}] \text{ dove } U\sim \mathcal{U}(2,4)$$
```R
## Secondo Metodo: Utilizzo uniforme U(2,4)
# 1. Genero un insieme di uniformi iid come U(2,4)
taglia.campionaria <- 1000
uniformi <- runif(taglia.campionaria, min=2, max=4)
# 2. definisco theta come la soluzione analitica dell'integrale in [0,1] 
theta <- exp(-2)-exp(-4)
# 3. calcolo theta cappello. 
theta.hat <- mean(exp(-(uniformi)))
theta.hat.mean <- 2*cumsum(exp(-(uniformi)))/(1:taglia.campionaria)
# cumsum() mi permette di vedere l'andamento man mano che procedo
# con l'esperimento, altrimenti avrei un plot con un punto solo
plot(theta.hat.mean)
abline(h=theta, col="RED", lwd=2)
```
