# Testo 10.2
Write a function to compute the two-sample Cramér–von Mises statistic.
The Cramér–von Mises distance between distributions is $$\omega^2 = \int\int\big(F(x)-G(y)\big)^2dH(x,y)$$where $H(x,y)$ is the joint CDF of X and Y . For a test of equal distributions,
the corresponding test statistic is based on the joint empirical
distributions, so it is a function of the ranks of the data. First,
compute the ranks $r_i$ of the $X$ sample, $i = 1,...,n$ and the ranks $s_j$ of the $Y$ sample $j=1,...,m$ (see rank function). compute $$U=n\sum_{i=1}^n(r_i-i)^2 + m\sum{j=1}^m(s_j-j)^2$$
Note that $U$ can be vectorized and evaluated in one line of R code. Then
the Cramér–von Mises two-sample statistic is $$W^2 = {U \over nm(n+m)}-{{4nm-1}\over6(m+n)}$$
Large values of $W^2$ are significant.

## Tradotto
Scrivere una funzione per calcolare la statistica di Cramér-von Mises a due campioni.
La distanza di Cramér-von Mises tra distribuzioni è $$\omega^2 = \int\int\big(F(x)-G(y)\big)^2dH(x,y)$$dove $H(x,y)$ è la CDF congiunta di X e Y . Per un test di uguaglianza delle distribuzioni,
la statistica del test corrispondente si basa sulle distribuzioni empiriche
distribuzioni empiriche congiunte, quindi è una funzione dei ranghi dei dati. Per prima cosa,
calcolare i ranghi $r_i$ del campione $X$, $i = 1,...,n$ e i ranghi $s_j$ del campione $Y$ $j=1,...,m$ (vedi funzione rank). calcolare $$U=n\sum_{i=1}^n(r_i-i)^2 + m\sum{j=1}^m(s_j-j)^2$$
Si noti che $U$ può essere vettorializzato e valutato in una sola riga di codice R. Allora
la statistica a due campioni di Cramér-von Mises è $$W^2 = {U \over nm(n+m)}-{{4nm-1}\over6(m+n)}$$
Valori elevati di $W^2$ sono significativi.

## Cramér-Von Mises
La statistica di cmv restituisce un valore che misura la distanza fra due cdf ma questo valore da solo non dice niente e deve essere utilizzato insieme ad altro per poter essere significativo di qualcosa. In casi specifici è possibile definire un *valore critico* e di solito accade quando si ha esperienza sul campo di utilizzo, altrimenti serve un p-value; $W^2$ sappiamo che più è grande più le cdf sono lontane ma l'importanza della distanza è appunto data dalla presenza di un p-value. 

## Implementazione 
```R
cramer_von_mises <- function(sample_x, sample_y) {  
  # Lunghezza del campione X  
  n <- length(sample_x)  
  # Lunghezza del campione Y  
  m <- length(sample_y)  
  
  # Creazione del rango di X e di Y  
  # Per fare i ranghi si guarda la posizione dei valori di un vettore ordinato   # ma questo è temporaneo, non va a cambiare la posizione originale degli  
  # elementi. Quindi, io so che i primi n elementi sono tutti i ranghi di X e    # gli ultimi m elementi sono tutti elementi di Y  
  ranked_sample <- rank(c(sample_x, sample_y))  
  rank_x <- ranked_sample[1:n]  
  rank_y <- ranked_sample[(n+1):(n+m)]  
  

  # Rappresenta la differenza fra i ranghi osservati e quelli teorici  
  U <- n * sum( (rank_x-(1:n))^2 ) + m * sum( (rank_y-(1:m))^2 )  
  
  # Distanza delle distribuzioni  
  W_squared <- U / ( n*m*(n+m) ) - ( (4*n*m) -1 ) / ( 6*(n+m) )  
  
  return (W_squared)  
}
```

# Testo 10.3
Implementare il test di Cramér-von Mises a due campioni per distribuzioni uguali
come test di permutazione utilizzando $$W^2 = {U \over nm(n+m)}-{{4nm-1}\over6(m+n)}$$Applicare la statistica a soybean e linseed del dataset chickwts.
## Commento
Andando a lavorare col test di permutazioni posso ottenere un p-value che mi darà la probabilità che la mia ipotesi nulla non sia falsa. Breve cenno: $$\text{p-value}=\mathbb{P}(|T|>\text{t.oss}|H_0)$$
Quindi se io pongo un livello di significatività $\alpha=0.05$ e ottengo $\text{p-value}>\alpha$ significa che ho probabilità con significatività alpha di non dover rifiutare l'ipotesi nulla. Quindi:
1. dico che $H_0: CDF(X)=CDF(Y)$ 
2. Misuro $W^2$ 
3. Costruisco un test con permutazioni dove misuro tanti $(W^*)^2$ 
4. Calcolo il $\text{p-value}$
Confrontando il $\text{p-value}$ con $\alpha$ ho due possibilità:
1. $\text{p-value}>\alpha\rightarrow\text{accetto }H_0$
2. $\text{p-value}\leq\alpha\rightarrow\text{rifiuto }H_0$

## Implementazione
```R
# Definizione della funzione Cramér-von Mises con simulazione di permutazione  
cvm_permutation_test <- function(sample_x, sample_y, n_permutations = 999) {  
  
  # Calcolo della statistica W^2 osservata  
  W_squared_observed <- cramer_von_mises(sample_x, sample_y)  
  
  # Preparazione per la simulazione di permutazione  
  combined_samples <- c(sample_x, sample_y)  
  n_x <- length(sample_x)  
  n_y <- length(sample_y)  
  W_squared_permutations <- NULL  
  
  # Esecuzione delle permutazioni e calcolo di W^2 per ciascuna  
  for (i in 1:n_permutations) {  
    permuted_samples <- sample(combined_samples, replace = FALSE)  
    permuted_x <- permuted_samples[1:n_x]  
    permuted_y <- permuted_samples[(n_x + 1):(n_x + n_y)]  
    W_squared_permutations[i] <- cramer_von_mises(permuted_x, permuted_y)  
  }  
  
  # Calcolo del p-value  
  
  W_squared_tot <- c(W_squared_observed, W_squared_permutations)  
  # non ho usato mean perché mi piace vedere una rappresentazione simile a quella  
  # matematica vista a lezione  p_value <- sum(W_squared_tot >= W_squared_observed) / (n_permutations + 1)  
  
  # Visualizzazione dei risultati  
  hist(W_squared_permutations, freq=FALSE, main = "Distribuzione di W^2 permutato",  
       xlab = "W^2",  col = "skyblue", xlim = c(0, 10), ylim = c(0,1))  
  abline(v = W_squared_observed, col = "red", lwd = 2)  
  legend("topright", legend = c(paste("W^2 osservato =", round(W_squared_observed, 4)),  
                                paste("p-value =", round(p_value, 4))),  
         col = c("red", "black"), lwd = 2)  
  
  # Output dei risultati  
  list(W_squared_observed = W_squared_observed, p_value = p_value)  
}
```

### Risultato
##### Premessa
- **Ipotesi Nulla ($H_0$)**: Le due distribuzioni campionarie sono identiche. Questo significa che qualsiasi differenza osservata tra i campioni può essere attribuita al caso.
    
- **Ipotesi Alternativa ($H_1$)**: Esiste una differenza tra le due distribuzioni campionarie. Questo indica che le differenze osservate tra i campioni non sono dovute al caso, ma riflettono piuttosto una differenza reale nelle popolazioni da cui i campioni sono stati estratti.

Applicando il test su due distribuzioni identiche si ottiene distanza zero e questo conferma l'esattezza della funzione dell'esercizio 10.2. Si ottiene anche un $\text{p-value}=1$ il che ci dice che abbiamo il $100\%$ di probabilità di non rifiutare l'ipotesi nulla poiché non ci sono differenze statisticamente rilevanti e mi sembra coerente col fatto che le distribuzioni siano identiche.   

##### Applicazione a chickvts
Sono stati presi in esame come richiesto *linseed* e *soybean*:
```R
# Caricamento dataset dei pulcini  
attach(chickwts)  
boxplot(formula(chickwts))  
soybean <- sort(as.vector(weight[feed == "soybean"]))  
casein <- sort(as.vector(weight[feed == "casein"]))  
linseed <- sort(as.vector(weight[feed == "linseed"]))  
sunflower <- sort(as.vector(weight[feed == "sunflower"]))  
detach(chickwts)  
# Esecuzione del test di permutazione Cramér-von Mises  
result <- cvm_permutation_test(linseed, linseed)
result <- cvm_permutation_test(linseed, soybean)
# Stampa del risultato  
cat("W^2 osservato:", result$W_squared_observed, "\n")  
cat("p-value:", result$p_value, "\n")
```

Gli output ottenuti sono:
- ``cvm_permutation_test(linseed, linseed)``
	- $W^2 = 0 \rightarrow$ come detto sopra è atteso siccome sono distribuzioni identiche
	- $\text{p-value} = 1 \rightarrow$ che conferma l'accettazione dell'ipotesi nulla
- ``cvm_permutation_test(linseed, soybean)``
	- $W^2 = 0.1574 \rightarrow$ non è detto sia un buon risultato come sembra ma promette bene
	- $\text{p-value} = 1 \rightarrow$ altissimo, quindi non posso rifiutare $H_0$

##### Applicazione a PlantGrowth
```R
# Caricamento del dataset PlantGrowth  
attach(PlantGrowth)  
boxplot(formula(PlantGrowth))  
  
# Suddivisione del dataset in base ai gruppi di trattamento  
ctrl_group <- weight[group == 'ctrl']  
trt1_group <- weight[group == 'trt1']  
trt2_group <- weight[group == 'trt2']  
  
detach(PlantGrowth)
result <- cvm_permutation_test(trt1_group, trt2_group, 999)
```

Qui ottengo dei risultati meno marcati:
+ ``cvm_permutation_test(trt1_group, trt2_group, 999)``
	- $W^2 = 0.1574 \rightarrow$ non è detto sia un buon risultato come sembra ma promette bene
	- $\text{p-value} = 1 \rightarrow$ altissimo, quindi non posso rifiutare $H_0$