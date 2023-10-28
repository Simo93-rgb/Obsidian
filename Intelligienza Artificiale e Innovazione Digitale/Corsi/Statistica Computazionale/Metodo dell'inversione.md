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
**R** in quell'assegnamento genera un vettore di dimensione $n$ nel quale ogni elemento è una $U \sim \mathcal{U}(0,1)$. Ecco il plot ![[Metodo dell'Inversione - Plot metodo della inversione con esponenziale.png]]

## Metodo dell'Inversione con Bernoulli
Qui il metodo dell'inversione ci permette di partire da una [[Variabili Casuali Notevoli#Uniforme|Uniforme]] come prima e di ottenere una [[Variabili Casuali Notevoli#Bernoulli|Bernoulli]].
Partiamo con il grafico della cdf della Bernoulli e inseriamo una $u$ sull'asse delle $y$ ![[Metodo dell'Inversione - cdf Bernoulli con valore u della uniforme.png]]
Come già visto dobbiamo usare una funzione inversa e quindi andrò a scrivere: $$\begin{align}
1. &\quad F_X^{-1}(u) = inf\big(x\in \mathbb{R}:F_X(x)\geq u\big) \\
2. &\quad F_X^{-1}(u)=inf\big([1,+\infty)\big)=1 \,\,\,\,\,\text{ se }u>1-\pi \\
3. &\quad F_X^{-1}(u)=inf\big([0,+\infty)\big)=0 \,\,\,\,\,\text{ se }u\le 1-\pi
\end{align}
$$
**ALGORITMO**
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
![[Metodo dell'Inversione -  pdf bernoulli con dimostrazione x=1.png]]
Dall'immagine si vede perché al punto $3$ il $+\infty$ dell'integrale diventa $1$, dovuto all'area inesistente sotto la curva per i numeri maggiori di $1$. 
**ALGORITMO ALTERNATIVO**
1. Genero $U \sim \mathcal{U}(0,1)$
2. Qui ho due casi a seconda della realizzazione $u$ di $U$
	1. $u >\pi \Rightarrow x=0$
	2. $u < \pi \Rightarrow x=1$

Genero $U\sim \mathcal{U}(0,1)$ e sia $Y=1-U$
$$\begin{align}
1. &\quad F_X(y)=\mathbb{P}(1-u\le y)\\
2. &\quad F_X(y)=\mathbb{P}(1-y\le u) \\
3. &\quad F_X(y)=1-\mathbb{P}(u\le 1-y) \\
4. &\quad F_X(y)=1-F_U(1-y)\\
5. &\quad F_X(y)=1-(1-y)\\
6. &\quad F_X(y)=y
\end{align}$$Ricordiamo che la $F_U(\bullet)$ restituisce l'argomento così com'è per numeri in $[0,1]$. Questa alternativa serviva in passato quando la potenza dei calcolatori era ridicola così da evitare di calcolare tutte le volte quel $1-\pi$ della prima versione. Ad oggi è utile più per scopi didattici probabilmente.  Quindi, abbiamo concluso anche che $1-U \sim \mathcal{U}(0,1)$.

## Metodo dell'Inversione con vc Discreta
Se $X$ è una vc discreta con possibili esiti $x_1<x_2<...<x_k<x_{k+1}<...$ allora estraggo $u$ da $U\sim \mathcal{U}(0,1)$ e $$x=
\begin{cases}
x_1 & u\le F_X(x_1)\\
x_2 & F_X(x_1)<u\le F_X(x_2)\\
\vdots & \quad\quad\quad\quad\vdots\\
x_k & F_X(x_k-1)<u\le F_X(x_k)\\
\end{cases}
$$
![[Metodo Dell'inversione - funzione vc discreta a gradini con realizzazione u.png]]