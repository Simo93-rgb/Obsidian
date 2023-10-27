È un metodo che ci consente di ottenere una vc di nostro desiderio partendo da un'altra vc che abbiamo a disposizione.

## Metodo dell'Inversione con Esponenziale
Per lavorare con il metodo dell'inversione prima dobbiamo richiamare a noi la vc [[Variabili Casuali Notevoli#Esponenziale|Esponenziale]].  
Questo metodo mi serve per generare una vc esponenziale partendo da una vc [[Variabili Casuali Notevoli#Uniforme|Uniforme]]. Precisamente, per generare una realizzazione $x$ da $X \sim exp(\lambda)$ ho bisogno di calcolare la funzione inversa di $F_X(x)$. L'idea è partire dalla cdf di $X$ e ottenere che $x$ sia uguale a qualcosa.
$$\begin{align}
1. &\quad F_X(x) = u \in (0,1) \\
2. &\quad 1- e^{-\lambda x} = u \\
3. &\quad e^{-\lambda x} = 1-u \\
4. &\quad \ln(e^{-\lambda x}) = \ln(1-u)\\
5. &\quad -\lambda x = \ln(1-u)\\
6. &\quad x=-{1\over \lambda}\ln(1-u)
\end{align}
$$Ecco quindi che abbiamo ottenuto l'identità per x necessaria per ottenere una realizzazione $x$ a partire da $X$.  Ecco qui il codice 
```R
# METODO inversione PER GENERARE VARIABILI CASUALI
# generiamo esponenziale di parametro lambda
lambda <- 1
n <- 1000
u <- runif(n)
x <- -1/lambda * log(1-u)
hist(x, freq = F)
xx <- seq(0.01,6, 0.01)
lines(xx, dexp(xx, rate = 1), col = 2, lwd = 2)

rexp(100, rate = 1) # generare variabili casuali esponenziali usando R
```
Ricordiamo che <code>u &lt;- runif(n)</code> equivale a scrivere <code>u &lt;- runif(n, min=0, max=1)</code>
**R** in quell'assegnamento genera un vettore di dimensione $n$ nel quale ogni elemento è una $U \sim \mathcal{U}(0,1)$. Ecco il plot ![[Plot metodo della inversione con esponenziale.png]]

## Metodo dell'Inversione con Bernoulli
Qui il metodo dell'inversione ci permette di partire da una [[Variabili Casuali Notevoli#Uniforme|Uniforme]] come prima e di ottenere una [[Variabili Casuali Notevoli#Bernoulli|Bernoulli]].
Partiamo con il grafico della cdf della Bernoulli e inseriamo una $u$ sull'asse delle $y$ ![[cdf Bernoulli con valore u della uniforme.png]]
Come già visto dobbiamo usare una funzione inversa e quindi andrò a scrivere: $$\begin{align}
1. &\quad F_X^{-1}(u) = inf\big(x\in \mathbb{R}:F_X(x)\geq u\big) \\
2. &\quad F_X^{-1}(u)=inf\big([1,+\infty)\big)=1 \,\,\,\,\,\text{ se }u>1-\pi \\
3. &\quad F_X^{-1}(u)=inf\big([0,+\infty)\big)=0 \,\,\,\,\,\text{ se }u\le 1-\pi
\end{align}
$$
**Algoritmo**
1. Genero $U \sim \mathcal{U}(0,1)$
2. Qui ho due casi a seconda della realizzazione $u$ di $U$
	1. $u > (1-\pi) \Rightarrow x=1$
	2. $u \le (1-\pi) \Rightarrow x=0$
Ma è vero che se $x=1$ allora la probabilità è $\pi$?
$$\begin{align}
1. &\quad \mathbb{P}(x=1)=\mathbb{P}(U > 1-\pi)\\
2. &\quad \mathbb{P}(x=1)=\int_{1-\pi}^{+\infty}f_U(u)du \\
3. &\quad \mathbb{P}(x=1)=\int_{1-\pi}^{1}1du \\
4. &\quad \mathbb{P}(x=1)=\pi
\end{align}
$$
Con il grafico della pdf è più chiaro da visualizzare. 
![[metodo inversione pdf bernoulli con dimostrazione x=1.png]]
Dall'immagine si vede perché al punto $3$ il $+\infty$ diventa $1$, dovuto all'area inesistente sotto la curva per i numeri maggiori di $1$. 