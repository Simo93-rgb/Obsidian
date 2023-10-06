Il libro è: [[Statistical Computing with R, Second Edition (Chapman  HallCRC The R Series) (Rizzo, Maria L.) (z-lib.org).pdf|Statistical Computing with R]]
In questa prima lezione è stato fatto un ripasso della statistica generale che servirà per procedere con il corso. 

# Spazio di Probabilità

Lo spazio di probabilità è una terna di elementi così composta:
+ $\Omega$ ➡ spazio campionario, ossia l'insieme dei possibili esiti detti anche *eventi elementari*
+ $\mathcal{A}$ ➡ famiglia opportuna di sottoinsiemi di $\Omega$, i suoi elementi sono quindi eventi
+ $\mathbb{P}$ ➡ misura di probabilità ossia una funzione che ad ogni evento di $\textrm{A}$ associa un numero nell'intervallo $[0,1]$ in accordo con gli assiomi di [Kolmogorov](https://it.wikipedia.org/wiki/Andrej_Nikolaevi%C4%8D_Kolmogorov):
	1. $\mathbb{P} (\emptyset) = 0$ ➡ probabilità dell'evento impossibile
	2. $\mathbb{P} (\Omega) = 1$ ➡ probabilità dell'evento certo
	3. Se prendo una serie di $\mathcal{A}$ disgiunti a due a due fra loro allora $$\mathbb{P}\biggl(\bigcup_{i=1}^{+\infty}\mathcal{A}_i\biggl) = \sum_{i=1}^{+\infty}\mathbb{P}(\mathcal{A}_i)$$
## Spazio Equiprobabile
Uno spazio equiprobabile è un insieme in cui tutti gli eventi hanno stessa probabilità. Qui l'esempio classico è il dado a sei facce ma se sei un nerdone che gioca ai giochi di ruolo il concetto non cambia se di facce ne hai 21 😂.
Per prima cosa definiamo convenzionalmente che la cardinalità dell'insieme $\Omega$ la possiamo indicare in modi differenti: #$\Omega$, card($\Omega$) oppure |$\Omega$|.
In uno spazio finito equiprobabile indichiamo con $N$ la cardinalità di $\Omega$ e indichiamo i suoi eventi $\{\omega_1, \omega_2, ... , \omega_n\}$. In generale quindi vale che $$
\mathbb{P}(\Omega) = \sum_{i=1}^n \mathbb{P}(\omega_i) = N*p
$$ **Dove**: 
+ $p \text{ ➡ è la probabilità di } \omega_i$
+ $N$ ➡ è la numerosità o cardinalità di $\Omega$
+ $\omega_i$ ➡ è un possibile evento di $\Omega$
Da qui è facile ricavare che $p = {1 \over N}$ quindi coi dadi avremo che la probabilità di ottenere uno specifico numero è $1 \over 6$, oppure $1 \over 21$ per i nerd di prima 😜.
Adesso siamo pronti per generalizzare con un evento $A \subseteq \Omega$: $$
\mathbb{P}(A) = 
\mathbb{P}\biggl( \bigcup_{i=1}^{\#A}\{\omega_i\}\biggl) =
\sum_{i=1}^{\#A}{\mathbb{P}(\omega_i)} = 
{\#A \over N} =
{\#A \over \#\Omega}
$$
Qui un evento $\mathcal{A}$ potrebbe essere il lancio di un dado che fa ottenere un numero dispari e maggiore di 1, quindi $\mathcal{A}$ rappresenta un evento dell'esperimento che può combinare più eventi elementari.
# Variabili Casuali
La variabili casuali, d'ora in avanti scritte come *vc*, sono delle funzioni così descritte: $$
X: (\Omega, \mathcal{A}, \mathbb{P}) \rightarrow \mathbb{R} 
$$
Si ricorda che la terna $(\Omega, \mathcal{A}, \mathbb{P})$ rappresenta lo spazio di probabilità. Possiamo definire $X$ come l'esito numerico di un esperimento casuale. 

# Funzione di Ripartizione o Cumulata (cdf)
Sia $X$ una *vc*, posso definire una *cdf* (cumulative density function) la funzione: 
$$
F_X:\begin{align*}
& \mathbb{R} \rightarrow [0,1] \\
& x \rightarrow F_X(x) = \mathbb{P}(X \leq x)
\end{align*}
$$

A cosa serve? Se ho nota la mia *cdf* ossia la $F_X(\bullet)$ posso calcolare la probabilità di un qualsiasi evento per $X$. 
## Proprietà di una CDF
Ne vediamo tre:
1. Se $a < b \Rightarrow F_X(a) \le F_X(b)$ quindi monotonia crescente
2. $F_X(\bullet)$ è continua da destra, ossia vale che $\lim_{x\to x_{0}^{+}} {F_X(x) = F_X(x_0)}$
3. Comportamenti al limite
	1. $\lim_{x\to -\infty}{F_X(x)} = 0$
	2. $\lim_{x\to +\infty}{F_X(x)} = 1$

#### Notazione: $F_X(\bullet)$ Discreta
Se $F_X(\bullet)$ è discontinua allora per forza $X$ è discreta. I possibili esiti di $X$ numerabili e sono i punti nei quali $F_X(\bullet)$ è discontinua. I salti della discontinuità sono la probabilità associata.
![[Funzione di Ripartizione Discreta.png]]
<p style="text-align:center">Funzione di Ripartizione Discreta. Qui i lanci di un dado non truccato a 6 facce.</p>
#### Notazione: $F_X(\bullet)$ Continua
In questo caso abbiamo che $X$ è una *vc* continua di conseguenza. Se $F_X(\bullet)$ è continua e derivabile allora posso definire una funzione di densità di probabilità *pdf* (probability density function) ossia la derivata della funzione di ripartizione: $$
f_X(x) = {\partial F_X(x) \over \partial x} \text{ } \forall x \in X
$$
da cui posso ricavare che: $$
F_X(x) = {\int_{-\infty}^{x} {f_X(t) \partial t} = \mathbb{P}(X\le x)} \text{ } \forall x \in X
$$
Proprietà *pdf*:
1. $\int_{-\infty}^{+\infty}{f_X(t)\partial t} = 1 = \mathbb{P}(\Omega) = \lim_{x \to +\infty}{F_X(x)}$
2. $f_X(x) \ge 0$ 

### Esempio con Normale Standard
Sia $X \sim \mathcal{N}(0,1)$, quindi $X$ che si distribuisce come una normale standard, anche detta normale con parametri $\mu = 0$ e $\sigma = 1$. $$
f_X(x) = {1 \over \sqrt{2\pi}}e^{-{x^2/ 2}}
$$
![[Grafico Normale Standard.png]]
Andando a definire poi la funzione di ripartizione continua con l'integrale (come già visto) abbiamo: $$
F_X(x) = \int_{-\infty}^{x}{f_X(t)\partial t}
$$
![[Funzione di Ripartizione Normale Standard.png]]
**Osservazine**: Siccome $f_X(\bullet)$ non è integrabile per calcolare la funzione di ripartizione si usa una tabella oppure si può approssimare con la funzione ${1 \over 2}\biggl(1 + erf{{x - \mu}\over{\sigma \sqrt{2}}}\biggl)$ 
# Quantile di ordine alpha
Definisco quantile di ordine $\alpha$ la quantità $$X_\alpha = inf\{x\in \mathbb{R} \land \alpha \in (0,1) : F_X(x)\ge \alpha\}$$
Questa funzione è detta inversa generalizzata di $F_X(\bullet)$ e coincide con la funzione inversa $F^{-1}{(\alpha)}$ qualora esistesse. 
Supponiamo di avere $\alpha = 0.1$, con quel valore sto costruendo un quantile conosciuto come ***primo decile*** ed è quel valore della distribuzione per cui la probabilità cumulata fino a qual valore, incluso, sia maggiore o uguale a $0.1$, e la probabilità cumulata da quel valore, incluso, in poi sia maggiore o uguale a $0.9$. Quindi se voglio il primo decile di una distribuzione significa che prenderò tutti quei valori uguali o inferiori al $10\%$. Ad esempio il primo decile dell'intervallo numerico $[0,100] \in \mathbb{N}$ sono i numeri nell'intervallo $[0,10]\in \mathbb{N}$ ossia $\{0,1,2,3,4,5,6,7,8,9,10\}$. Il novantesimo percentile dell'insieme $\{18, 20, 22, 25, 30, 32, 35, 40, 45, 50\}$ è $48$ perché al di sotto di quel valore c'è il $90\%$ dei dati.
## Caso Bivariato
Si parla di **statistiche bivariate** quando su ogni unità statistica, appartenente ad una determinata popolazione, si vogliono studiare contemporaneamente due caratteri $A$ e $B$. Ad esempio se ho 20 studenti e voglio studiare i voti di Matematica e i voti di Storia.
![[Caso Bivariato Discreto.png]]
L'esempio è un caso discreto ma rende l'idea, ora trattiamo il caso continuo con due vc $X$ e $Y$. Indichiamo la funzione di densità di probabilità (pdf) congiunta delle due vc con $F_{X,Y}(x,y)$. $$
F_{X,Y}(x,y) = 
\mathbb{P}(X\le x, Y\le y) =
\int_{-\infty}^{x}\int_{-\infty}^{y}{f_{X,Y}(t,s)\partial t \partial s}$$
### Le pdf Marginali
Le pdf marginali nel caso continuio sono:
+ $f_X=\int_{-\infty}^{+\infty}f_{X,Y}(x,s)\partial s$
+ $f_Y=\int_{-\infty}^{+\infty}f_{X,Y}(t,y)\partial t$ 
mentre nel caso discreto sono:
+ $f_X=\sum_{-\infty}^{+\infty}f_{X,Y}(x,s)$
+ $f_Y=\sum_{-\infty}^{+\infty}f_{X,Y}(t,y)$

**NOTAZIONE**
Si chiama insieme supporto di una pdf quell'insieme di valori per i quali la pdf è positiva. Quindi:
+ $supp(f_X) = \{x\in \mathbb{R}: f_X(x)>0\}$
+ $supp(f_{X,Y}) = \{(x,y)\in \mathbb{R^2}: f_{X,Y}(x,y)>0\}$
