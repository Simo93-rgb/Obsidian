Molti problemi in IA richiedono ricerca in uno spazio di configurazioni, chiamati stati, che possono essere anche molto grandi e l'[[Agenti Intelligenti|agente]] deve navigare in questo spazio alla ricerca della o delle soluzioni. Occorre avere delle **search strategies** per fare questa navigazione. 
Torniamo a parlare del [[Agenti Intelligenti#^db0708|Problema Robot Aspirapolvere]] si potrebbero avere configurazioni differenti fra tipo di ambiente ma il focus ora lo mettiamo sul fully observable e su determinismo; costruiamo il grafo per il problema a stato singolo.
![[Schermata 2023-10-03 alle 15.10.37.png]]
Il problema lo risolvo navigando il grafo con gli algoritmi di ricerca del cammino nei grafi come ad esempio quello di Dijkstra. Non sempre è possibile perché in problema seri è facile arrivare a milioni di nodi o addirittura infiniti, quindi ripetiamo l'utilità di avere delle strategies. 
Se ad esempio manca l'informazione di dove ci si trova devo analizzare ogni possibilità non sapendo dove sono alla partenza, ecco il grafo
![[Schermata 2023-10-03 alle 15.15.51.png]]

# Formulazione del problema
1. stato iniziale es, “robot in A, A sporca, B sporca"
2. azioni  o operatori ($op: S \rightarrow S$ per single-state problem)
3. goal test,  può essere
	1. esplicito, es., lo stato finale e’ *Sg*
	2. implicito, es., lo stato finale deve soddisfare la condizione C (es scacco matto negli scacchi)
4. costo operatori (additivo).
	1. c(x,a,y) detto step cost, assunto  ≥ 0 (costo per andare da stato x a stato y usando operatore-azione a)
Una soluzione e’ una sequenza di azioni (operatori) che porta dallo stato iniziale ad uno stato goal. Bisogna misurare il **costo della soluzione** che è la somma dei costi degli operatori componenti e grazie a questo possiamo definire la **soluzione ottimale** ossia la soluzione avente il costo minimo tra tutte le soluzioni possibili.

Guardando l'immagine a stati singoli, ecco un esempio:
1. stati: Presenza sporco e  posizione robot  
2. azioni: Left, Right, Suck
3. goal test: Sporco assente in tutte le stanze
4. costo operatori: 1 per action

Atro esempio con il gioco 8-Puzzle
![[8-Puzzle.png]] ^f319dc
1. stati: posizioni delle pedine
2. azioni: muovere il buco Left, Right, Up and Down
3. goal test: è rappresentato dal goal in immagine
4. costo operatori: 1 per mossa 
Curiosità: la soluzione ottimale è NP-Hard e in IA è normale che tutti lo siano, altrimenti perché ci sarebbe bisogno di intelligenza?

![[Pasted image 20231004110340.png]]
Un nodo è caratterizzato da un genitore, da un livello di profondità, da figli e da una funzione di costo. La funzione di espansione crea tutti i nodi possibili che si possono generare partendo da quel dato nodo. 

# Search strategies
Come caratteristica peculiare hanno il fatto che tengono conto dell'ordine di espansione dei nodi, in generale devono valere questi punti:
1. Completezza → se c'è una soluzione lei la trova
2. Complessità temporale → numero di nodi generati/espansi
3. Complessità spaziale → numero di nodi massimo in memoria
4. Ottimalità → trova una soluzione a costo minimo

Per misurare la complessità usiamo tre entità:
+ **b** → massimo branching factor dell'albero di ricerca
+ **d** → depth della soluzione a costo minimo
+ **m** → massima profondità dello spazio degli stati

## Ricerche Cieche o Non Informate
Queste usano solo il parametro *b* e partiamo subito con la prima

### Breath-first Search
Espandere il nodo meno profondo (shallowest node), ossia implementare una **FIFO queue**.
L'insieme di nodi espandibili viene chiamata frontiera e sono le foglie dell'albero che possono essere espanse, vien da se che questo approccio ha la frontiera che varia ad ogni passaggio.
Il termine dell'algoritmo avviene quando il nodo goal è stato selezionato. 
**Caratteristiche**:
1. Completezza → è completa
2. Complessità temporale → $O(b^{d+1})$
3. Complessità spaziale → $O(b^{d+1})$ Tiene tutti i nodi in memoria
4. Ottimalità → è ottimale solo se il costo è uguale per tutti, altrimenti in generale non lo è.
Commento sullo spazio: ipotizzando un rate di un nodo al secondo da 10MB si ha dopo 24 ore circa 860GB

Assunzioni per un esempio:
+ branching factor=10
+ 1000 nodi/sec
+ 100 bytes/nodo

|Profondità| # nodi| Tempo | Memoria|
|:--------:|:------:|:------:|:---------:|
|0|  1|    1 msec|  100 bytes|
|2|111|0.1 sec|11 kbytes|
|4|11.111|11 sec|1 Mbyte|
|6|106|18 min|111 Mbytes|
|12|1012|35 y|111 Tbytes|
|14|1014|3500 y|11.111 Tbytes|


### Depth-first Search
Si tratta di espandere il nodo più profondo ma attenzione che potrebbe essere infinito, si costruisce l'albero con **LIFO queue (stack)**. La strategia di *back tracking* è quella che chiude le strade che non vanno bene e torna indietro fino al primo nodo che aveva ancora percorsi non visitati. 
**Caratteristiche**:
1. Completezza → **NO!** Fallisce negli spazi infiniti e potrebbe incappare in loop. 
	1. Però, se lo spazio è finito e ho delle accortezze per i loop allora è completa.
2. Complessità temporale → $O(b^{m})$
3. Complessità spaziale → $O(b*m)$ Tiene tutti i nodi in memoria
4. Ottimalità → **NO!**

### Iterative Deepening Search
Risulta un *depth-first search* ma ha un cut-off che impedisce di andare troppo in profondità, indicato dalla lettera *l (elle)*, con l'ovvio problema che se questo limite è fisso potrebbe escludere la soluzione. Se non trovo la soluzione posso fare *l + 1* e rifare la ricerca i profondità.
Andando a livelli trovo la soluzione e trovo pure quella ottimale! D'altronde vado a livelli.
**Caratteristiche**:
1. Completezza → **NO!** Fallisce negli spazi infiniti e potrebbe incappare in loop. 
	1. Però, se lo spazio è finito e ho delle accortezze per i loop allora è completa.
2. Complessità temporale → $O(b^{d})$
	1. $(d+1)b^{0} + db + (d-1)b^{2} + ... + b^{d}$
3. Complessità spaziale → $O(b*m)$ Tiene tutti i nodi in memoria
4. Ottimalità → **SI!** se il costo è 1

## Ricerche Euristiche o Informate (Best First Search)
Si associa ad ogni nodo una valutazione di costo e si espande il nodo che costa meno.
 $$f: S \rightarrow \mathbb(R^+)$$
### Strategia Costo Uniforme
La valutazione di un nodo corrisponde al costo corrispondente al cammino dal nodo iniziale al nodo stesso.
$$g(x) = \begin{cases} 0 & \text{se } n=n_0 \\ g(n^{'})+c(n^{'},n) & \text{se } n^{'} \text{ padre di } n\end{cases}$$
**Esempio Romania**: qui sotto la mappa che collega alcune città rumene (ognuna ha una lettera iniziale differente) che può essere vista come un grafo ad archi pesati.
![[Pasted image 20231004134852.png|500]]
*Richiamo: lo [[Agenti Intelligenti#^e18694|stato]] qui è la configurazione del nodo raggiunto e del cammino percorso per arrivarci.*

Navigando l'albero si scopre che somiglia ad una navigazione in ampiezza. I costi sono tutti positivi e più avanzo più aggiungo costo. Questo significa che andare in profondità tenderebbe ad aumentare la funzione *g* che non è ciò che voglio siccome vorrei trovare soluzioni con costo minimo. 
![[Pasted image 20231004135824.png]]
<center>Navigazione della mappa</center>
**Caratteristiche**
![[Pasted image 20231004140612.png]]

### Funzione Euristica
Funzione che ci permetta di capire quanto devo ancora spendere per arrivare alla soluzione (possibilmente ottimale). Questa genererà una stima che spesso è una sottostima.

$$h(n) = \hat{c}(n,n_g)$$
**Dove**: $\text{Dove } \hat{c} \text{ è la funzione di costo}$


Torniamo a parlare del problema [[Ricerca nello Spazio degli Stati#^f319dc|8-Puzzle]] e proviamo a creare una euristica per avere una sottostima:
![[Pasted image 20231004141254.png]]
- **$h_1 = 7$** → Potrei muoverne una per volta senza avere movimenti delle tessere ma semplicemente spostandone una alla volta liberamente. Così ho almeno 7 movimenti da fare avendo rilassato il problema in modo totale.
- **$h_2 = 18$** → Potrei rilassare il problema parzialmente decidendo di muovere le tessere in orizzontale o verticale ma anche sopra le altre tessere, fregandocene del foro. 
  Questa è la ***Distanza di Manhattan*** 

Se due euristiche sono due sottostime e una è maggiore allora dovrò sempre prendere quella perché è la più informata! 
Attenzione che una euristica, come nel caso di $h_1$ potrebbe anche essere completamente sballata rispetto alla realtà. 

### Strategia greedy
Insegue sempre il costo minore durante la visita del grafo ma così facendo tende ad essere una visita in ampiezza e si porta con se il non essere ottimale.
*Caratteristiche*:
1. Completezza → **NO!** Fallisce negli spazi infiniti e potrebbe incappare in loop. 
2. Complessità temporale → $O(b^{m})$
3. Complessità spaziale → $O(b^{m})$ 
4. Ottimalità → **NO!** 

### $A^{*} Search$
Evitare di espandere cammini già conosciuti. come costosi.
 > $f(n) = g(n) + h(n)$
 > Dove:
 > 	$f(n) \text{costo totale per raggiungere il goal partendo da n}$
 > 	$h(n) \text{costo stimato da n al goal}$
 > 	$g(n) \text{costo per raggiungere n}$

$A^*$ search usa una euristica ammissibile. Se la mia euristica fosse, per ipotesi la funzione oracolo, io avrei un percorso dritto verso il goal. Mentre se la mia euristica fosse di mettere il costo uniforme avrei una visita in ampiezza. Quindi, nei problemi di ricerca una buona euristica fa la differenza! 
L'idea fondamentale è quella di esplorare prima i percorsi che sembrano promettenti in termini di costo totale stimato. Ciò viene realizzato mantenendo una coda di priorità (spesso implementata come una coda con priorità minima) in cui i nodi vengono estratti in base al valore di $f(n)$. In breve, $A^{*}$ è un potente algoritmo di ricerca che combina la completezza dell'algoritmo di Dijkstra con l'efficienza dell'euristica informata.

#### Ottimalità di $A^{*}$
![[Pasted image 20231004145426.png]]
> $f(G_2) = g(G_2) \text{ finché } h(G_2)$
> $f(G_2) > g(G_1) \text{ finché } G_2 \text{ non è ottimale}$
> $f(G_2) >= f(n) \text{ finché } h \text{ è ammissibile}$ 

#### Proof of Lemma: Consistency
Premessa doverosa, una euristica è consistente se vale la disuguaglianza triangolare.
![[Pasted image 20231004150108.png|200]]
![[Pasted image 20231004150247.png|400]]
Una euristica consistente è sempre ammissibile, ma non è vero il contrario.
Per non perdere informazione $f$ deve essere non decrescente e sono sicuro che se l'euristica è consistente allora $f$ è sempre non decrescente. Per i casi dove l'euristica è ammissibile ma non è consistente allora serve il trucchetto dell'equazione **PATHMAX**. 
> $f(n^{'}) = max(g(n^{'}) + h(n^{'}), f(n))$

![[Pasted image 20231004151102.png]]
Da notare come l'euristica può essere vista come un plug-in che attacco all'algoritmo $A^{*}$
per cambiarne le caratteristiche. Una euristica più informata migliora molto le prestazioni. Per completezza, se una euristica è sempre migliore di un'altra si dice che la prima domina la seconda.

![[Pasted image 20231004151301.png]]

### $IDA^{*}$
Itertive Deepening $A^{*}$ usa come cut-off la funzione di costo $f(n)$. Ad ogni passo setta il cut-off con la nuova funzione di costo di $A^{*}$ prendendo il minore per minimizzare o il maggiore per massimizzare. 