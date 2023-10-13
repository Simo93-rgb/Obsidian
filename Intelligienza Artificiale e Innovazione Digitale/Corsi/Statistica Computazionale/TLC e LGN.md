# Teorema del Limite Centrale
Qui la spiego facile, supponiamo di voler censire o comunque misurare qualcosa per il quale la dimensione è fuori dalla nostra portata, che faccio? Mi arrendo? NO! Misuro un campione la cui dimensione è alla mia portata e cerco di avere il mio campione che sia il più possibile fedele a quel che volevo misurare in origine. Supponendo che $Y = \{X_1, ... , X_n\}$ dove le $X$ sono i mie esperimenti (misuro l'altezza delle persone e $X_i$ è l'i-esima persona che misuro). $Y$ è quindi il mio esperimento di cui ho bisogno di misurare un suo parametro come la media, la pdf etc... Ecco, definiamo $\Theta$ che rappresenta proprio quel parametro incognito. Adesso ho bisogno di uno stimatore per $\Theta$ che chiamerò $T$, intuitivamente noi degli stimatori li abbiamo già visti: $$\begin{cases}\bar x_n = {1 \over n}\sum_{i=1}^n x_i & \text{media campionaria è stimatore di }\mu \\ S^2 = {1 \over n-1}\sum_{i=1}^n (x_i - \bar x_n ) & \text{varianza campionaria è stimatore per } \sigma^2 \end{cases}$$
Noi sappiamo che media campionaria e varianza campionaria sono stimatori corretti, rispettivamente, per media e per varianza quindi possiamo scrivere $\mathbb{E}[\bar x_n] = \mu$ e possiamo anche scrivere che $\mathbb{E}[S^2] = \sigma^2$. Ma quindi, se voglio che $T$ sia uno stimatore corretto di $\Theta$ deve per forza valere $\mathbb{E}[T] = \Theta$. Posso anche parlare di *stimatore asintotico* se vale che per $\lim_{n \rightarrow +\infty}$ del mio stimatore $T$ ottengo come valore atteso $\Theta$. 
Possiamo esprimere il concetto di correttezza anche passando per la varianza e lo faccio a parole che tanto è intuitivo: al crescere della taglia campionaria la varianza si riduce avendo come risultato del $\lim_{n \rightarrow +\infty}$ uno zero che rappresenta uno scostamento nullo dal valore vero. 
Il TLC ci dice con quale distribuzione la nostra media campionaria converge alla media vera e lo fa definendo due casi:

|$\sigma$ nota|$\sigma$ incognita|
|:------:|:----------:|
|$Z = {\bar X_n - \mu \over \sigma \sqrt{n}} \sim N(0,1)$|$T = {\bar X_n - \mu \over S \sqrt{n}} \sim N(0,1)$|

Attenzione che deve valere sempre che $n$ sia grande. Però fino ad ora non abbiamo definito cosa significa "grande" e con che considerazioni devo prendere questo $n$
# Legge dei Grandi Numeri

