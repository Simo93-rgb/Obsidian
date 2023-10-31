Abbiamo già visto un esempio di stimatore e dimostrato la sua correttezza quando abbiamo parlato di media campionaria e infatti abbiamo detto che è stimatore corretto per la media reale. 

#### DEFINIZIONE
Uno stimatore $\hat \Theta$ è *corretto* o *non distorto* per un parametro $\Theta$ se vale l'identità:$$\mathbb{E}[\hat \Theta]=\Theta$$La distorsione è indicata con $$\mathbb{B}[\hat \Theta]=bias(\hat \Theta)=\mathbb{E}[\hat \Theta]-\Theta$$

### Mean Square Error
Lo scarto quadratico medio è un oggetto definito così $$MSE_{\theta}(\hat \Theta)=\mathbb{E}[(\hat \Theta -\Theta)^2]$$ed è una misura della dispersione dei dati o dell'errore tra un insieme di valori osservati e i valori previsti da un modello o da una stima. È comunemente utilizzato  per valutare quanto bene un modello si adatti ai dati reali; quindi quanto $\hat \Theta$ si disperde intorno a $\Theta$.
#### Osservazione con Varianza
Attenzione che non vale che $MSE(\hat \Theta)\not=Var(\hat \Theta)$ poiché la varianza è definita col valore atteso e non con il valore vero. La [[Richiami di Probabilità#Varianza|Varianza]] è così definita: $$Var(\hat \Theta)=\mathbb{E}\big[(\hat \Theta - \mathbb{E}[\Theta])^2\big]$$
## Bilanciamento fra Bias e Varianza

Abbiamo detto prima che non vale che $MSE(\hat \Theta)\not=Var(\hat \Theta)$ ma se inseriamo opportunamente il bias allora possiamo creare la seguente uguaglianza: $$MSE(\hat \Theta)=Var(\hat \Theta)+\big(bias(\hat \theta)\big)^2$$Ora va dimostrato e premetto che farò una dimostrazione con passaggi molto elementari ma siccome mi perdo sempre tornerà utile. $$\begin{align}
1. &\quad MSE(\hat \Theta)=\mathbb{E}[(\hat \Theta - \Theta)^2]\\
2. &\quad =\mathbb{E}[(\hat \Theta- \mathbb{E}[\hat \Theta] +\mathbb{E}[\hat \Theta] - \Theta)]\\
3. &\quad =\mathbb{E}[(x+y)^2]\text{con } x=\hat \Theta- \mathbb{E}[\hat \Theta]\text{ e }y=+\mathbb{E}[\hat \Theta] - \Theta =bias(\Theta) \\
4.  &\quad =\mathbb{E}(x^2 +2xy +y^2)\\
5.  &\quad =\mathbb{E}\big[(\hat \Theta- \mathbb{E}[\hat \Theta])^2 + 2*(\hat \Theta- \mathbb{E}[\hat \Theta])*bias(\hat \Theta)+(bias(\Theta))^2 \big]\\
6.  &\quad =\mathbb{E}[(\hat \Theta-\mathbb{E}[\hat \Theta])^2] + (bias(\theta))^2 + 2*(\mathbb{E}[\hat \Theta]- \mathbb{E}[\hat \Theta])*bias(\hat \Theta)\\
7. &\quad =\mathbb{E}[(\hat \Theta-\mathbb{E}[\hat \Theta])^2] + (bias(\theta))^2\\
8. &\quad = Var(\hat \Theta) + (bias(\theta))^2
   \end{align}$$Qui una spiegazione è doverosa che sono stati fatti un paio di passaggi sottili. Al $2$ si è semplicemente addizionato e sottratto lo stesso oggetto, ossia $\mathbb{E}[(\hat \Theta)]$, che torna comodo per la dimostrazione. Al passaggio $6$ si può notare che il doppio prodotto è mutato poiché è stata sfruttata la proprietà di linearità del valore atteso che è fatta così:$$\mathbb{E}[a+bX]=a+b\mathbb{E}[X]$$Da notare che siccome $\hat \theta$ è l'unico oggetto che non conosco non posso portarlo fuori con la proprietà di linearità e quindi quando esco dal valore atteso generale che ho nel $5$ devo per forza applicare l'operatore $\mathbb{E}[\bullet]$ alla $\hat \Theta$ presente nel doppio prodotto. 

### Standard Error
Se $\hat \Theta$ è corretto per $\Theta$, l'errore di stima sarà controllato dalla sola varianza di $\hat \Theta$. Chiamo standard error la seguente quantità: $$se(\hat \theta)=\sqrt{Var(\hat \theta)}$$
**Esempio**
Siano $\{X_1,...,X_n\}$ iid come $X\sim Ber(\pi)$. La [[Variabili Casuali Notevoli#Bernoulli|Bernoulli]] ha $\mathbb{E}[X]=\pi$ e $Var(X)=\pi(1-\pi)$. 
$$X=id_S=\begin{cases}
1 & \text{successo}=S\\
0 & \text{insuccesso}=\bar S
\end{cases}$$
La funzione identità di $S$ il prof la indica con $\mathbb{1}_S$ ma per questioni grafiche ho preferito prendere la nomenclatura standard e usare $id$. Nel libro probabilmente si usa $I_S$ quindi nel caso mi scappasse d'ora in avanti sei "uomo avvisato mezzo salvato". 
Comunque, tornando a noi, qui al posto di $\hat \Theta$ uso $\hat \pi$ giusto perché siamo con una Bernoulli. Per ottenere