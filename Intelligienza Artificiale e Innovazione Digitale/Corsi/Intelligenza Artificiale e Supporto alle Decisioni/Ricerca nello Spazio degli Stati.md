Molti problemi in IA richiedono ricerca in uno spazio di configurazioni, chiamati stati, che possono essere anche molto grandi e l'agente deve navigare in questo spazio alla ricerca della o delle soluzioni. Occorre avere delle **search strategies** per fare questa navigazione. 
Torniamo a parlare del [[Agenti Intelligenti#^db0708|Problema Robot Aspirapolvere]] si potrebbero avere configurazioni differenti fra tipo di ambiente ma il focus ora lo mettiamo sul fully observable e su determinismo; costruiamo il grafo per il problema a stato singolo.
![[Schermata 2023-10-03 alle 15.10.37.png]]
Il problema lo risolvo navigando il grafo con gli algoritmi di ricerca del cammino nei grafi come ad esempio quello di Dijkstra. Non sempre è possibile perché in problema seri è facile arrivare a milioni di nodi o addirittura infiniti, quindi ripetiamo l'utilità di avere delle strategies. 
Se ad esempio manca l'informazione di dove ci si trova devo analizzare ogni possibilità non sapendo dove sono alla partenza, ecco il grafo
![[Schermata 2023-10-03 alle 15.15.51.png]]

## Formulazione del problema
1. stato iniziale es, “robot in A, A sporca, B sporca"
2. azioni  o operatori ($op: S \rightarrow S$ persingle-state problem)
3. goal test,  può essere
	1. esplicito, es., lo stato finale e’ Sg
	2. implicito, es., lo stato finale deve soddisfare la condizione C (es scacco matto negli scacchi)
4. costo operatori (additivo).
	1. c(x,a,y) detto step cost, assunto  ≥ 0 (costo per andare da stato x a stato y usando operatore-azione a)
Una soluzione e’ una sequenza di azioni (operatori) che porta dallo stato iniziale ad uno stato goal. Bisogna misurare il **costo della soluzione** che è la somma dei costi degli operatori componenti e grazie a questo possiamo definire la **soluzione ottimale** ossia la soluzione avente il costo minimo tra tutte le soluzioni possibili.