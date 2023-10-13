# Spazio di Probabilità

Lo spazio di probabilità è una terna di elementi così composta:
+ $\Omega \rightarrow$  spazio campionario, ossia l'insieme dei possibili esiti detti anche *eventi elementari*
+ $\mathcal{A}\rightarrow$  famiglia opportuna di sottoinsiemi di $\Omega$, i suoi elementi sono quindi eventi
+ $\mathbb{P}\rightarrow$  misura di probabilità ossia una funzione che ad ogni evento di $\textrm{A}$ associa un numero nell'intervallo $[0,1]$ in accordo con gli assiomi di [Kolmogorov](https://it.wikipedia.org/wiki/Andrej_Nikolaevi%C4%8D_Kolmogorov):
	1. $\mathbb{P} (\emptyset) = 0 \rightarrow$ probabilità dell'evento impossibile
	2. $\mathbb{P} (\Omega) = 1\rightarrow$  probabilità dell'evento certo
	3. Se prendo una serie di $\mathcal{A}$ disgiunti a due a due fra loro allora $$\mathbb{P}\biggl(\bigcup_{i=1}^{+\infty}\mathcal{A}_i\biggl) = \sum_{i=1}^{+\infty}\mathbb{P}(\mathcal{A}_i)$$
## Spazio Equiprobabile
Uno spazio equiprobabile è un insieme in cui tutti gli eventi hanno stessa probabilità. Qui l'esempio classico è il dado a sei facce ma se sei un nerdone che gioca ai giochi di ruolo il concetto non cambia se di facce ne hai 21 😂.
Per prima cosa definiamo convenzionalmente che la cardinalità dell'insieme $\Omega$ la possiamo indicare in modi differenti: #$\Omega$, card($\Omega$) oppure |$\Omega$|.
In uno spazio finito equiprobabile indichiamo con $N$ la cardinalità di $\Omega$ e indichiamo i suoi eventi $\{\omega_1, \omega_2, ... , \omega_n\}$. In generale quindi vale che $$\mathbb{P}(\Omega) = \sum_{i=1}^n \mathbb{P}(\omega_i) = N*p$$ **Dove**: 
+ $p \rightarrow$ è la probabilità di $\omega_i$ 
+ $N\rightarrow$  è la numerosità o cardinalità di $\Omega$
+ $\omega_i\rightarrow$  è un possibile evento di $\Omega$
Da qui è facile ricavare che $p = {1 \over N}$ quindi coi dadi avremo che la probabilità di ottenere uno specifico numero è $1 \over 6$, oppure $1 \over 21$ per i nerd di prima 😜.
Adesso siamo pronti per generalizzare con un evento $A \subseteq \Omega$: $$\mathbb{P}(A) =\mathbb{P}\biggl( \bigcup_{i=1}^{\#A}\{\omega_i\}\biggl) =\sum_{i=1}^{\#A}{\mathbb{P}(\omega_i)} ={\#A \over N} ={\#A \over \#\Omega}$$
Qui un evento $\mathcal{A}$ potrebbe essere il lancio di un dado che fa ottenere un numero dispari e maggiore di 1, quindi $\mathcal{A}$ rappresenta un evento dell'esperimento che può combinare più eventi elementari.
# Variabili Casuali
La variabili casuali, d'ora in avanti scritte come *vc*, sono delle funzioni così descritte: $$X: (\Omega, \mathcal{A}, \mathbb{P}) \rightarrow \mathbb{R}$$
Si ricorda che la terna $(\Omega, \mathcal{A}, \mathbb{P})$ rappresenta lo spazio di probabilità. Possiamo definire $X$ come l'esito numerico di un esperimento casuale. 

# Funzione di Ripartizione o Cumulata (cdf)
Sia $X$ una *vc*, posso definire una *cdf* (cumulative density function) la funzione: 
$$F_X:\begin{align*} & \mathbb{R} \rightarrow [0,1] \\ & x \rightarrow F_X(x) = \mathbb{P}(X \leq x)\end{align*}$$

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
In questo caso abbiamo che $X$ è una *vc* continua di conseguenza. Se $F_X(\bullet)$ è continua e derivabile allora posso definire una funzione di densità di probabilità *pdf* (probability density function) ossia la derivata della funzione di ripartizione: $$f_X(x) = {\partial F_X(x) \over \partial x} \text{ } \forall x \in X$$
da cui posso ricavare che: $$
F_X(x) = {\int_{-\infty}^{x} {f_X(t) \partial t} = \mathbb{P}(X\le x)} \text{ } \forall x \in X
$$
Proprietà *pdf*:
1. $\int_{-\infty}^{+\infty}{f_X(t)\partial t} = 1 = \mathbb{P}(\Omega) = \lim_{x \to +\infty}{F_X(x)}$
2. $f_X(x) \ge 0$ 

### Esempio con Normale Standard
Sia $X \sim \mathcal{N}(0,1)$, quindi $X$ che si distribuisce come una normale standard, anche detta normale con parametri $\mu = 0$ e $\sigma = 1$. $$f_X(x) = {1 \over \sqrt{2\pi}}e^{-{x^2/ 2}}$$
![[Grafico Normale Standard.png]]
Andando a definire poi la funzione di ripartizione continua con l'integrale (come già visto) abbiamo: $$F_X(x) = \int_{-\infty}^{x}{f_X(t)\partial t}$$
![[Funzione di Ripartizione Normale Standard.png]]
**Osservazine**: Siccome $f_X(\bullet)$ non è integrabile per calcolare la funzione di ripartizione si usa una tabella oppure si può approssimare con la funzione ${1 \over 2}\biggl(1 + erf{{x - \mu}\over{\sigma \sqrt{2}}}\biggl)$ 
# Quantile di ordine alpha
Definisco quantile di ordine $\alpha$ la quantità $$X_\alpha = inf\{x\in \mathbb{R} \land \alpha \in (0,1) : F_X(x)\ge \alpha\}$$
Questa funzione è detta inversa generalizzata di $F_X(\bullet)$ e coincide con la funzione inversa $F^{-1}{(\alpha)}$ qualora esistesse. 
Supponiamo di avere $\alpha = 0.1$, con quel valore sto costruendo un quantile conosciuto come ***primo decile*** ed è quel valore della distribuzione per cui la probabilità cumulata fino a qual valore, incluso, sia maggiore o uguale a $0.1$, e la probabilità cumulata da quel valore, incluso, in poi sia maggiore o uguale a $0.9$. Quindi se voglio il primo decile di una distribuzione significa che prenderò tutti quei valori uguali o inferiori al $10\%$. Ad esempio il primo decile dell'intervallo numerico $[0,100] \in \mathbb{N}$ sono i numeri nell'intervallo $[0,10]\in \mathbb{N}$ ossia $\{0,1,2,3,4,5,6,7,8,9,10\}$. Il novantesimo percentile dell'insieme $\{18, 20, 22, 25, 30, 32, 35, 40, 45, 50\}$ è $48$ perché al di sotto di quel valore c'è il $90\%$ dei dati.
## Caso Bivariato
Si parla di **statistiche bivariate** quando su ogni unità statistica, appartenente ad una determinata popolazione, si vogliono studiare contemporaneamente due caratteri $A$ e $B$. Ad esempio se ho 20 studenti e voglio studiare i voti di Matematica e i voti di Storia.
![[Caso Bivariato Discreto.png]]
L'esempio è un caso discreto ma rende l'idea, ora trattiamo il caso continuo con due vc $X$ e $Y$. Indichiamo la funzione di densità di probabilità (pdf) congiunta delle due vc con $F_{X,Y}(x,y)$. $$F_{X,Y}(x,y) =\mathbb{P}(X\le x, Y\le y) =\int_{-\infty}^{x}\int_{-\infty}^{y}{f_{X,Y}(t,s)\partial t \partial s}$$
### Le pdf Marginali
Le pdf marginali nel caso continuio sono:
+ $f_X=\int_{-\infty}^{+\infty}f_{X,Y}(x,s)\partial s$
+ $f_Y=\int_{-\infty}^{+\infty}f_{X,Y}(t,y)\partial t$ 
mentre nel caso discreto sono:
+ $f_X=\sum_{-\infty}^{+\infty}f_{X,Y}(x,s)$
+ $f_Y=\sum_{-\infty}^{+\infty}f_{X,Y}(t,y)$

#### Notazione: Insieme Supporto
Si chiama **insieme supporto** di una pdf quell'insieme di valori per i quali la pdf è positiva. Quindi:
+ $supp(f_X) = \{x\in \mathbb{R}: f_X(x)>0\}$
+ $supp(f_{X,Y}) = \{(x,y)\in \mathbb{R^2}: f_{X,Y}(x,y)>0\}$
# Medie di una vc
Sia $X$ una vc nello spazio di probabilità, abbiamo:

|**Caso Discreto**|**Caso Continuo**|
|:-------------:|:--------------:|
|$\mathbb{E}[X] = \sum_{i=1}^{+\infty}\{x_i*p_i\}$|$\mathbb{E}[X] = \int_{-\infty}^{+\infty}\{x*f_X(d)\partial x\}$|

Osserviamo come si usa la notazione con $\mathbb{E}[\bullet]$ poichè arriva dalla parola inglese *expectation*e, più importante, di come $p_i$ e $f_X(x)$ rappresentino la stessa cosa concettualmente ossia la probabilità associata dell'esito $x\in X$. 

# Varianza
La varianza è una misura della dispersione dei dati attorno alla media. Più alta è la varianza, più i dati sono sparsi attorno alla media. Più bassa è la varianza, più i dati sono concentrati attorno alla media. La varianza si calcola come la somma dei quadrati delle distanze tra i valori e la media, divisa per il numero di dati. $$Var(X) = \mathbb{E}\big[(X-\mathbb{E}[X])^2\big] = \mathbb{E}[X^2]-\mu^2$$
Attenzione che la varianza viene spesso indicata con la notazione $\sigma_{X}^{2}$ oppure semplicemente $\sigma^2$. 

### Deviazione Standard
La deviazione standard è la radice quadrata della varianza ed è spesso utilizzata perché ha le stesse unità di misura dei dati originali. $$\sigma = \sqrt{Var}$$
#### Varianza VS Deviazione Standard
In breve, la varianza misura quanto i dati si disperdono attorno alla media e la deviazione standard esprime questa dispersione in unità di misura degli stessi dati. Una deviazione standard più grande indica una maggiore variabilità dei dati, mentre una deviazione standard più piccola indica una minore variabilità.

## Media di due vc 
Siano $X$ e $Y$ due vc continue con pdf congiunta $f_{X,Y}(x,y)$: $$\mathbb{E}[X*Y] = \int_{-\infty}^{+\infty}\int_{-\infty}^{+\infty}x*y*f_{X,Y}(x,y)\partial x \partial y$$
## Covarianza
È come variano linearmente $X$ e $Y$ durante l'esperimento ed è così definita: $$Cov(X,Y) = \mathbb{E}\big[(X-\mu_X)(Y-\mu_Y)\big] = \mathbb{E}[X*Y]-\mu_X*\mu_Y$$
**OSSERVAZIONE**: $Cov(X,X) = Var(X)$
Potrebbe tornare comodo per fare dei confronti normalizzare la covarianza e a tale scopo esiste il **coefficiente di correlazione lineare** così definito: $$\rho(X,Y) ={{Cov(X,Y)}\over{\sqrt{Var(X)*Var(Y)}}}$$
Se $\rho = 0$ allora $X$ e $Y$ sono incorrelate linearmente. 

# Probabilità Condizionata e Indipendenza
Come rappresentiamo la probabilità che si verifichi un qualcosa sapendo che già qualcos'altro si è verificato? Se hai letto il titolo non ti stupirà sapere che la risposta è... PROBAILITÀ CONDIZIONATA!!! 🥳🎉 YHEEEEE $$\mathbb{P}(A|B) = {\mathbb{P}(A\cap B) \over \mathbb{P}(B)} {\leftarrow \text{casi favorevoli} \atop \leftarrow \text{casi totali}}$$
Definisco poi $A$ indipendente da $B$ se: $$\mathbb{P}(A|B) = \mathbb{P}(A)$$oppure $$\mathbb{P}(B|A) = \mathbb{P}(B)$$
oppure $$\mathbb{P}(A\cap B) = \mathbb{P}(A)\mathbb{P}(B) \leftarrow Fattorizzazione$$
Parlando di vc continue $X$ e $Y$ andrò ad esprimere:
+ $f_{X|Y=y}(x) = {f_{X,Y}(x,y) \over f_Y(y)}$
	+ La $f_X(\bullet)$ condizionata dal fatto che si sia verificato un particolare evento $y \in Y$ è la probabilità dell'evento congiunto diviso la distribuzione di $Y$. Anche qui ricorda un po' il discorso sei casi favorevoli sui casi totali. A denominatore al posto dell'evento che condiziona metto la densità della variabile che condiziona.
+ $f_{Y|X=x}(y) = {f_{X,Y}(x,y) \over f_X(x)}$
Come poco sopra nel caso di fattorizzazione, anche qui se $X$ e $Y$ sono indipendenti allora vale la fattorizzazione $$f_{X,Y}(x,y) = f_X(x) * f_Y(y)$$ Supponiamo di avere una serie di vc iid (indipendenti identicamente distribuite) $\{X_1, X_2, ... , X_n\}$ con ognuna la sua pdf $f_X(x)$, allora la pdf totale è: $$\prod_{i=1}^n f_X(x_i)$$
# [[Statistical Computing with R, Second Edition (Chapman  HallCRC The R Series) (Rizzo, Maria L.) (z-lib.org).pdf#page=56&selection=94,0,94,41|Proprietà di Media e Varianza]]

1. $\mathbb{E}[aX + b]= aE[X] + b$ 
2. $\mathbb{E}[X + Y ] = \mathbb{E}[X] + \mathbb{E}[Y ]$ 
3. Se $X$ e $Y$ sono indipendenti, $\mathbb{E}[XY] = \mathbb{E}[X]\mathbb{E}[Y]$ 
4. $Var(b) = 0$
5. $Var[aX + b] = a2Var(X)$.
6. $Var(X + Y ) = Var(X) + Var(Y ) + 2Cov(X, Y)$ 
7. Se $X$ e $Y$ sono indipendenti, $Var(X + Y) = Var(X) + Var(Y)$ 
	1. Se $\{X1, . . . , Xn\}$ sono iid abbiamo che
	2. $\mathbb{E}[X1 + · · · + Xn] = nμX$ 
	3. $Var(X1 + · · · + Xn) = nσ2 X$
Ho riportato quelle del libro, il prof. ne ha accorpate alcune ma alla fine è la stessa roba. 
![[Proprieta' Media e Varianza.png]]

**ESEMPIO**
Sia $\{X_1, X_2, ..., X_n\}$ iid come $X$ vc con media $\mu_X = \mathbb{E}[X]$ e con $\sigma^2 = Var(X)$. Siccome molti esperimenti devono essere fatti su un campione rappresentativo di una popolazione, indicherò la media dell'esperimento sul campione con $$\bar X_n = {1\over n} \sum_{i=1}^{n}X_i $$ Dove $\bar X_n$ è la **media campionaria** (empirica). Ora, qual è la media della media campionaria? Calcolo: $$\mathbb{E}[\bar X_n] = {1\over n}\sum_{i=1}^{n}\mathbb{E}[X_i] = {1\over n}\sum_{i=1}^{n}\mu x = {1\over n} * n\mu x = \mu x$$al passaggio del secondo uguale bisogna aggiungere una precisazione ossia che la fattorializzazione è possibile perché le vc sono iid. Segue poi che che se sommo $n$ volte lo stesso oggetto allora posso risolvere la sommatoria con l'oggetto moltiplicato per $n$ ed ecco perché ottengo $(n*\mu *x)$. Ad esempio, se voglio calcolare la media della statura italiana io misuro il campione e cerco di ottenere una media campionaria il più uguale possibile alla media vera. Questa cosa la misuro con la variabilità e se quel valore è basso allora ho quel che volevo. Ovviamente con variabilità bisogna intendere che, uffa, si lavora con la varianza. Qui non metto dimostrazione ma solo la formula finita: $$Var(\bar X_n) = {\sigma^2 \over n}$$