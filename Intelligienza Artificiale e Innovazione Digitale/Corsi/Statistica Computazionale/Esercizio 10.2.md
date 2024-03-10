# Testo
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

