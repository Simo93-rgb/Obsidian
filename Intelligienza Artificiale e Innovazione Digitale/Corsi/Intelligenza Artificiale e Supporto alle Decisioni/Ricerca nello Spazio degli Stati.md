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
![[8-Puzzle.png]]
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
4. Ottimalità → **NO!**

## Ricerche Euristiche o Informate

