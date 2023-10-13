Per definire le vc notevoli si esprimerà a parole cosa rappresentano e perché sono utili, verranno esplicitati $\mathbb{E}[\bullet]$ e $Var(\bullet)$.
# Bernoulli
La distribuzione di Bernoulli serve a modellare un solo esperimento che potrà avere un solo esito binario. Ad esempio il lancio di una moneta, ma attenzione che se lancio due monete mi servono due Bernoulli. Usando la solita $X$ per indicare una vc: $$X \sim Ber(\pi)$$ Dove $\pi \in [0,1] \subset \mathbb{N}$ 
$$X =\biggl\{ {0 \text{ se ho insuccesso} \atop 1 \text{ se ho successo}} \biggl\} $$
Indicando con $S$ il successo e con $\bar S$ l'insuccesso possiamo scrivere:
- $\mathbb{P}(S) = \mathbb{P}(X = 1) = \pi$
- $\mathbb{P}(\bar S) = \mathbb{P}(X = 0) = 1-\pi$
- $\mathbb{P}(X=x) = \pi^x(1-\pi)^{1-x}$

**Valore atteso**: $\mathbb{E}[X] = \sum_{i=0}^1{x \mathbb{P}(X=x)} = \pi^0(1-\pi)^{1-0} + \pi^1(1-\pi)^{1-1} = \pi$ 
**Varianza**: $Var(X) = \mathbb{E}[X^2] - \big(\mathbb{E}[X] \big)^2 = \pi (1-\pi)$
Le dimostrazioni sono lasciate al lettore 😜

# Binomiale
Stavi pensando che fosse scemo avere due Bernoulli per due lanci di moneta? Ecco la soluzione! $$X \sim Bin(n, \pi)$$
Prendiamo $n$ esperimenti di Bernoulli indipendenti identicamente distribuiti, la nostra Binomiale serve a contemplare proprio tante Bernoulli in un unico esperimento, precisamente i suoi successi. Rappresentiamo con $Y$ una vc di Bernoulli, avrò che $$X = \sum_{i=1}^n Y_i$$ e la sua distribuzione di probabilità è $$\mathbb{P}(X=x) = {n \choose p}\pi^x(1-\pi)^{n-x}$$ **Piccolo cenno**: il coefficiente binomiale ${n \choose p}$ indica con $n$ il numero di elementi dell'insieme e con $p$ gli elementi di un sottoinsieme, il risultato del coefficiente binomiale è il numero di sottoinsiemi diversi fra loro con cardinalità $p$ che sono in grado di fare a partire da $n$. Se avessi ${4 \choose 2}$ il risultato sarebbe $6$ poiché posso fare quel numero di sottoinsiemi diversi fra loro partendo da uno con cardinalità $4$. Per maggiori dettagli vedere il capitolo su [YouMath](https://www.youmath.it/lezioni/probabilita/calcolo-combinatorio/1515-coefficiente-binomiale.html)

**Valore atteso**: $\mathbb{E}[X] = \mathbb{E}\big[ \sum_{i=1}^n Y_i\big] = \sum_{i=1}^n\mathbb{E}[Y_i] = \sum_{i=1}^n \pi = n\pi$ 
**Varianza**: $Var(X) = Var\big( \sum_{i=1}^n Y_i\big) = \sum_{i=1}^nVar(Y_i) = \sum_{i=1}^n \pi(1-\pi) = n\pi(1-\pi)$
Da notare che $Var(Y_i) = \pi(1-\pi)$ nel passaggio dentro la sommatoria è stato rubato dalla definizione nella Bernoulli.

# Poisson
Ma se avessi bisogno di una Binomiale ma non avessi a disposizione $n$ poiché potenzialmente infinito? Ecco che la Poisson ci viene in aiuto. $$X \sim P(\lambda)$$
La $\lambda$ rappresenta il numero di eventi che ci si aspetta in un intervallo di tempo o spazio, infatti la Poisson va bene per casi come contare quante chiamate arrivano al call-center. 
La distribuzione di probabilità è fatta così: $$\mathbb{P}(X=x) = e^{-\lambda}{\lambda^x \over x!}$$
# Normale o Gaussiana
Questa è continua quindi devo parlare di funzione di densità di probabilità (pdf) per definirla, ma prima indichiamo come la rappresentiamo: $$X \sim N(\mu, \sigma^2)$$
La pdf della Gaussiana è fatta così: $$f_X(x) = {1 \over \sqrt2\pi \sigma^2} \exp \biggl\{  - {(x- \mu^2) \over 2\sigma^2}  \biggl\}$$
Fin'ora sembra brutta come la fame ma la figata è nell'espressione' del valore atteso e della varianza. 
**Valore atteso**: $\mathbb{E}[X] = \mu$
**Varianza**: $Var(X) = \sigma^2$

Ci sono alcune proprietà che torneranno molto utili e che vale la pena menzionare ora.
### Proprietà Gaussiana
Per definire le proprietà prima dobbiamo fare delle premesse:$$\begin{cases} X \sim N(\mu, \sigma^2) & \text{Gaussiana} \\ Y = a + bX & \text{ con }a,b \in \mathbb{R} \land b\not = 0 \end{cases}$$
1. $Y \sim N(\mu = a+n*\mu_X \text{, } \sigma^2 = b\sigma^2_X)$
2. $Z={X-\mu \over \sigma} \sim N(0,1)$
	1. Questa proprietà è detta *standardizzazione*
3. Siano $\{X_1, ..., X_n\}$ Gaussiane iid, posso combinarle linearmente ottenendo una vc $Y$ come segue: $Y = \sum_{i=1}^n a_i X_i \sim N(\mu = \sum_{i=1}^n a_i \mu_i, \sigma^2 = \sum_{i=1}^n a_i \sigma^2_i )$
