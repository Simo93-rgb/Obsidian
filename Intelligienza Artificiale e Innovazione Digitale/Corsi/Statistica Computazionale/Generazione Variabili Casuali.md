Parliamo prima di numeri casuali e bisogna subito dire che nel computer è impossibile che si possano davvero generare quindi si parla di numeri pseudo-casuali. Il metodo migliore è quello di [Marsenne-Twister](https://en.wikipedia.org/wiki/Mersenne_Twister) che ha ciclicità pari a $2^{19937}-1$. I numero sono distribuiti secondo una $\mathcal{U}(0,1)$. 
**Enunciato**: se conosco la cdf di una vc uniforme allora posso generare qualunque vc $X$.
Procediamo:
+ sia $X$ una vc con cdf $F_X(x)=\mathbb{P}(X\le x)$ 
+ sia $U \sim \mathcal{U}(0,1)$
	+ la sua pdf $f_U(u)=\begin{cases}1 & 0\le 1 \\ 0 & \text{altrove}\end{cases}$
		+ ![[pdf di una U(0,1).png]]
	+ la sua cdf $F_U(u)=\begin{cases}0 & x < 0 \\ u & 0\le x \le 1 \\ 1 & x > 1 \end{cases}=\mathbb{P}(U \le u)=\int_{-\infty}^u f_U(t)dt$  
		+ ![[cdf di una U(0,1).png]]
	+ $\mathbb{E}[U]={1\over 2}$
	+ $Var(U)={1\over 12}$
Partiamo disegnando la $X$ su un piano cartesiano e tracciando l'asintoto a $1$. Un valore $x\in \mathbb{R}$ preso a caso è sicuramente trasformabile tramite la vc in un valore $u \in [0,1]$ per come è fatta la vc, sappiamo anche che possiamo ottenere da $u$ il valore $x$ se conosco la funzione inversa e se non la conosco la posso calcolare purché la funzione sia invertibile.
![[distribuzione della vc X in verde.png|400]]
Il punto $u$ è equivalente a $F_X(x)$ e da qui posso arrivare a dire che $x=F_X^{-1}(u)=inf\big\{ x\in \mathbb{R}| F_X(x) \geq u \big\}$
L'idea è quella di interpretare una $u$ generata casualmente come se fosse un valore della cfd di $X$ e per farlo basta recuperare la funzione inversa. Attenzione che se $F(\bullet)$ non è invertibile questo ragionamento non si può fare. 
**Algoritmo**:
1. Genero $u$ da una variabile casuale $U\sim \mathcal{U}(0,1)$
2. $x=F_X^{-1}(u)$
Se applico questo algoritmo allora $x$ è realizzazione di $X$ che ha cfd $F_X(\bullet)$.
Quindi! $U\sim \mathcal{U}(0,1) \Rightarrow F_X^{-1}(U) \sim X$. 