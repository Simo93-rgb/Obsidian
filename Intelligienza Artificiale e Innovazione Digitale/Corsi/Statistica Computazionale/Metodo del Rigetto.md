Abbiamo visto come per il [[Metodo dell'inversione]] serva avere la funzione inversa e che questa sia pure in una forma analitica utilizzabile, e se non fosse sempre così? Facciamo due esempi per chiarezza:
1. Sia $X \sim \mathcal{N}(0,1)$, andiamo a definire la cdf $$F_Z(z)=\int_{-\infty}^z {1\over \sqrt{2\pi}}exp\bigg(-{t^2\over2}\bigg)$$Questo integrale è sicuramente ben definito ma non esiste soluzione analitica quindi è impossibile andare a definire una $F_Z^{-1}(\bullet)$. 
2. Sia $X\sim Beta(2,2)$ vista nelle [[Variabili Casuali Notevoli#Beta(2,2)]].  Anche se $\exists F_X^{-1}(\bullet)$ non ho espressione analitica.
Abbiamo visto come non sia sempre possibile usare il metodo dell'inversione e quindi ecco perché introduciamo il metodo del rigetto. 
Andiamo subito a precisare che vale sia per le continue che per le discrete. Quindi, sia $X$ una vc con pdf o pmf nota e di cui non ho una espressione analitica di $F_X^{-1}(\bullet)$. Suppongo di saper generare una $Y$ tale che abbia una pdf nota indicata con $g_Y(y)$ tale che:
- il suo insieme supporto sia uguale all'insieme supporto della $X$. 
	- $supp{f_X(\bullet)}=supp{g_Y(\bullet)}$
- valga il seguente rapporto
	- ${f_X(t)\over g_Y(t)}\le c \in (1;+\infty)$
	- che è come dire che $f_X(t)$ è limitata superiormente da un multiplo di $g_Y(t)$
**ALGORITMO**
1. genero $y$ dalla vc $Y$
2. genero $u$ da una vc $\mathcal{U}(0,1)$ indipendente da $Y$
3. IF
	1. $u\le {f_X(t)\over g_Y(t)}$ allora $y$ è accettata come realizzazione
	2. scarto y

**Domanda**: questo algoritmo genera dati distribuiti come la vc $X$?

### Dimostrazione Caso Discreto
Devo impostare una probabilità condizionata chiedendomi se la probabilità che $Y=y$ sia uguale a $X=y$ sapendo che $y$ è accettata come realizzazione di $X$. $$\mathbb{P}(Y=y|y\text{ realizzazione di }X) \stackrel{?}{=}\mathbb{P}(X=y)=f_X(y)$$Risolvo col teorema di Bayes. Attenzione, per comodità la condizione $y\text{ realizzazione di }X$ la scriverò in modo compatto con $accetto$. $$\mathbb{P}(Y=y|\text{accetto})=\mathbb{P}(Y=y){\mathbb{P}(accetto|Y=y)\over \mathbb{P}(accetto)}$$Adesso ho bisogno di calcolare le componenti della uguaglianza qua sopra:
- Nel caso discreto so anche che $\mathbb{P}(Y=y)=g_Y(y)$
- $$\begin{align}
1. &\quad \mathbb{P}(accetto) = \mathbb{P}\bigg(U\le {f_X(Y)\over c*g_Y(Y)}\bigg) \\
2. &\quad \mathbb{P}(accetto) = \sum_{y\in supp\{y\}}\mathbb{P}\bigg(U\le {f_X(Y)\over c*g_Y(Y)}\bigg| Y=y \bigg)\mathbb{P}(Y=y) \\
3. &\quad \mathbb{P}(accetto) = \sum_{y\in supp\{y\}}\mathbb{P}\bigg(U\le {f_X(y)\over c*g_Y(y)}\bigg)\mathbb{P}(Y=y) \\
4.  &\quad \mathbb{P}(accetto) = \sum_{y\in supp\{y\}} F_U({f_X(y)\over c*g_Y(y)})\mathbb{P}(Y=y) \\
5.  &\quad \mathbb{P}(accetto) = \sum_{y\in supp\{y\}}{f_X(y)\over c*g_Y(y)}g_Y(y)\\
6.  &\quad \mathbb{P}(accetto) = {1\over c} \sum_{y\in supp\{y\}}f_X(y)\\
7.  &\quad \mathbb{P}(accetto) = {1\over c}
\end{align}$$
- Il punto $1$ è di fatto una trascrizione del punto $3.1$ dell'algoritmo solo che nell'algoritmo lavoro con una realizzazione $u$ di $U$, mentre in questo punto ho da analizzare il caso aleatorio e quindi considero la vc e non una sua realizzazione. Al punto $2$ invece sfrutto il [[Formula di Bayes e Teorema Probabilità Totali#Teorema delle Probabilità Totali|Teorema Probabilità Totali]]condizionando rispetto una delle due variabili. Grazie a questo passaggio ora posso dire che il blocco ${f_X(Y)\over c*g_Y(Y)}$ non è più aleatorio perché condizionato da $Y=y$ e quindi posso riscriverlo con le realizzazioni di $Y$. A questo punto posso scrivere quello che probabilmente risultava "spontaneo" già al punto $1$ ossia usare la cdf di $U$ ma che prima essedo aleatorio non andava bene mentre ora ho le realizzazioni di $y$. Quindi al $4$ posso riscrivere la probabilità in termini di cdf. **Attenzione**, la sommatoria al $6$ è uguale ad $1$ poiché somma tutte le probabilità. Se sommo tute le probabilità dell'evento "lancio un dado" ottengo $1$ poiché sommo $1\over 6$ per sei volte. 
Ora, torniamo a considerare la domanda iniziale riscritta come teorema di Bayes $$\mathbb{P}(Y=y|\text{accetto})=\mathbb{P}(Y=y){\mathbb{P}(accetto|Y=y)\over \mathbb{P}(accetto)}$$notiamo come abbiamo calcolato nell'elenco qui sopra la probabilità di accettare $y$ come realizzazione di $X$ che è $1\over c$, abbiamo anche che $\mathbb{P}(Y=y)=g_Y(y)$. Ci mancherebbe solo il numeratore $\mathbb{P}(accetto|Y=y)$ ma in realtà è già stata calcolata durante i passaggi applicando il teorema delle probabilità totali, precisamente al punto $5$ abbiamo ${f_X(y)\over c*g_Y(y)}$. 
Quindi, sostituendo tutto abbiamo che $$\begin{align}
1. &\quad \mathbb{P}(Y=y|\text{accetto})= g_Y(y){{{f_X(y)\over c*g_Y(y)}}\over {1\over c}} \\
2. &\quad \mathbb{P}(Y=y|\text{accetto})= f_X(y)
\end{align}$$Se torniamo alla domanda iniziale, ossia a $$\mathbb{P}(Y=y|y\text{ realizzazione di }X) \stackrel{?}{=}\mathbb{P}(X=y)=f_X(y)$$posso affermare che è vero. 
In linguaggio naturale, è vero che se genero la $y$ in quella maniera e la accetto come realizzazione della $X$ è come se fosse stata scelta con la legge di probabilità della $X$? La risposta è **SÌ** poiché la $f_X(\bullet)$ è proprio la rappresentazione della legge di probabilità della variabile casuale $X$.   
 

