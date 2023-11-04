![[Reti Bayesiane - Rappresentazione nodi con arco di condizionamento.png]]
$H=\{\bar h, h\}$ sono le ipotesi mentre $E = \{\bar e, e\}$ è l'evento condizionante. $$\mathbb{P}(H=h | E=e)= {\mathbb{P}(h)\mathbb{P}(e|h)\over \mathbb{P}(h)}={\mathbb{P}(h)\mathbb{P}(e|h)\over \mathbb{P}(h)\mathbb{P}(e|h) + \mathbb{P}(\bar h)\mathbb{P}(e|\bar h)}$$
L'assunzione che ogni evidenza $E_i$ con $i=1,...,n$ sia indipendente dall'ipotesi ci permette la fattorizzazione. 
![[Reti Bayesiane - Grafo Bayes Naïve.png]]
Questa cosa ha messo le basi per poter pensare e formalizzare le reti bayesiane.

## Reti Bayesiane
Una rete bayesiana è una coppia $<G,P>$ dove:
- $G$ è una $DAG$ ossia un grafo diretto aciclico
	- I nodi rappresentano delle variabili casuali discrete
	- Un arco orientato dal nodo $X$ al nodo $Y$ lo scriviamo semplicemente così $X \rightarrow Y$ e indica una relazione di dipendenza dove $Y$ dipende da $X$. Si può anche dire che $X$ causa $Y$
- $P$ è una distribuzione di probabilità sulle variabili rappresentate dai nodi $X_1,...,X_n$ tale che $$\mathbb{P}(X_1,...,X_n)=\sum_{i=1}^n\mathbb{P}\big(X_i|Parent(X_i)\big)$$dove $Parent(X_i)$ indica il genitore del nodo $X_i$ nel grafo $G$ 
***Le reti bayesiane sono una notazione grafica semplice per rappresentare asserzioni di indipendenza condizionata, quindi per una specifica compatta di distribuzioni congiunte complete***. 

La topologia della rete codifica le asserzioni di indipendenza ![[Reti Bayesiane - grafo delle carie.png]]Le variabili ``Toothache`` e ``Catch`` sono indipendenti data la variabile ``Cavity``. La variabile ``Weather`` è indipendente dalle altre e quindi posso impostare ragionamenti su questa senza tenere conto delle altre e viceversa. Possiamo generalizzare le dipendenze.

### Dipendenza Condizionale
![[Reti Bayesiane - Dipendenza Condizionale.png]]

+ Nel rettangolo di sinistra si vedono due rappresentazioni differenti di come $C$ sia indipendente da $A$ dato $B$. Supponiamo che $A$ sia una rapina, $B$ l'allarme che suona e $C$ il mio vicino che mi chiami. Sapere che suona l'allarme è una motivazione totale sul fatto che il mio vicino di casa e sapere che c'è stata una rapina non cambia nulla sulla chiama del vicino. Che poi sia lineare o divergente rappresentano la stessa cosa.
+ Nel rettangolo di destra abbiamo un caso dove $A$ e $C$ sono indipendenti di base ma conoscendo $B$ diventano dipendenti. Ad esempio, $A$ avere la malaria e $C$ avere il raffreddore sono indipendenti ma se l'individuo sviluppa febbre, ossia $B$, allora ho della dipendenza. Devo fare qualcosa per escludere la dipendenza fra $C$ ed $A$ come ad esempio fare un test. Questa cosa è alla base della diagnosi differenziale che fanno i medici. 

