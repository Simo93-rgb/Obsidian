In informatica un esempio pratico e comunissimo sono i giochi come gli scacci e questi sono esempi in cui ho due agenti dove uno è imprevedibile dal punto di vista dell'altro. Qui si cerca di studiare una strategia per inquadrare e battere il mio avversario. Attenzione, strategia e piano non sono sinonimi poiché il piano è un elenco di mosse da fare e non sapendo cosa farà l'altro agente diventa senza senso il concetto di piano. La strategia invece dipende da quel che fa l'avversario ed è proprio quello che mi serve. Altra caratteristica problematica è il **limite di tempo**poiché non posso prendermi tutto il tempo del mondo per fare le mie mosse. 

|Informazione|**Deterministico**|**Non Deterministico**|
|:------------:|:------------------:|:---------:|
|**Informazione perfetta**|scacchi, go, othello...|Monopoly, backgammon|
|**Informazione Imperfetta**| null | poker, bridge, battaglia navale|

Alcune assunzioni:
+ Spazio finito: azioni stati e ambiente lo sono
+ Informazione perfetta:
	+ Gli agenti sanno sempre in che stato sono
+ Deterministico
+ Somma zero: ossia se vinco 10 il mio avversario ha perso 10 ("guadagno -10"). $$\sum{payoffs} = 0$$
### Terminologia
+ Il payoff di un giocatore viene chiamato **utilità**. 
+ Le strategie possono essere:
	+ strategia pura: la scelta è sempre deterministica
	+ strategia mista: distribuzione di probabilità per le scelte
+ Il gioco si chiama $G$ e i due concorrenti si chiamano *Min* e *Max* 
+ $U(s,t)$ è l'utilità delle strategie dove $s$ è la strategia di *Max* e $t$ è la strategia di *Min*.
+ Se il gioco è a somma zero allora:
	+ *Min* $\rightarrow -U(s,t)$ poiché *Min* cerca di minimizzare la funzione di utilità
	+ *Max* $\rightarrow U(s,t)$ poiché *Max* cerca di massimizzare la funzione di utilità

# Teorema Minimax (Von Neumann, 1928)
Se un gioco è a somma zero esistono due strategie $s^*$ e $t^*$ e un numero $V_G$ chiamato minimax value, allora:
+ se *Min* usa $t^*$, l'utilità di *Max* $\le V_G$
	+ $max_sU(s,t^*) = V_G$
+ se *Max* usa $s^*$ l'utilità di *Max* $\ge V_G$
	+ $min_tU(s^*,t) = V_G$

**COROLLARIO 1**: $U(s^*, t^*) = V_G$
**COROLLARIO 2**: se $G$ è un gioco a informazione perfetta allora ci sono strategie pure $s^*$e $t^*$ che soddisfano il teorema.
Posso fare un albero di gioco e nei nodi terminali dare un valore di utilità e il valore del payoff dipende dal gioco. 
![[AlberoTris_giochiDueConcorrenti.png]]
Attenzione che ogni livello dell'albero ha un concorrente che non sa cosa farà l'altro e questo comporta che la strategia per *Max* è fatta:
+ considerando un solo nodo per quando muove lui
+ considerando tutti i nodi delle possibilità del concorrente *Min*
Ovviamente per *Min* la situazione è speculare. Piccola osservazione è che $h$ è il numero di mosse per finire il gioco mentre $b$ è. il numero di scelte che il giocatore ha nel suo turno. 
Semplifichiamo l'albero e andiamo a vedere come applicare minimax.

## Algoritmo Minimax
![[Albero gioco minimax.png]]
*function* **Minimax**(s) *returns* un valore di utilità:
+ *if* s è uno stato terminale *then return* il payoff di Max in s
+ *else if* una mossa di Max in s *then*
	+ *return* max$\{$**Minimax**(result(a,s)) : a è applicabile a s$\}$
+ *else return* min$\{$**Minimax**(result(a,s)) : a è applicabile a s$\}$ 

Il ragionamento è che la mia mossa la devo fare tenendo conto che l'avversario giochi al suo meglio. Si parte dalle foglie e se il nodo padre è un *Min* allora porto su il minimo altrimenti se il nodo padre è un *Max* allora porto il valore massimo. 
**OSSERVAZIONE**: il 3 portato su fino alla radice è il famoso $V_G$ 

Pensandolo ricorsivo, le proprietà sono:
- complessità temporale: $O(b^h)$
- complessità spaziale: $O(b*h)$
- Completezza: **SI!** Ma se lo spazio è finito
- Correttezza: è corretto e si può dimostrare, per induzione, che se risponde la risposta è corretta.

Parlando di risorse disponibili spesso i nodi da espandere sono troppi come negli scacchi dove è facile avere $10^{135}$ circa nodi, quindi bisogna approcciare il problema senza espandere ogni nodo. Si possono pensare due approcci:
- cutoff test
- evaluation function

### Evaluation Function
![[evaluationFunctionChess.png]]
Come facciamo a valutare quale giocatore è messo meglio? Rilassiamo il problema togliendo l'importanza della posizione delle pedine. Posso fare una combinazione lineare pesando le pedine in base alla loro importanza $$Eval(s) = \sum_{i=1}^{n}w_if_i(s)$$ **Dove**:
- $w$ è il peso che do alla pedina
- $f$ è la feature 
	- posso definirla come la differenza fra il n° i pedine bianche e il n° di pedine nere, dello stesso tipo. 
- Un esempio:
	- $w = 9$ per le regine
	- $f$ è appunto la differenza fra le regine

**OSSERVAZIONE**:
Avanzando col gioco potrei trovarmi in una configurazione vicina ad uno stato finale, ossia aver generato un albero che finalmente è vicino alle foglie, allora posso pensare di generarlo tutto fino alle foglie per avere finalmente un piano da seguire invece che proseguire con la strategia.
### Cutting Off Search
L'algoritmo Minimax con cutoff è come l'algoritmo Minimax col value ma cambia in due cose:
1. i nodi terminali sono rimpiazzati dal cutoff
2. l'utilità è rimpiazzata dalla funzione di valutazione
Prendiamo sempre gli scacchi e diamogli un cutoff che corrisponde ad un lookahead decente, un numero compreso nell'intervallo $[4,12]$ dove 4 è un completo novizio e 12 è un master. 
Posso ottimizzare la situazione potando l'albero (pruning) e investendo le risorse risparmiate per avere un lookahead maggiore. 

#### $\alpha - \beta$ pruning 
Questo approccio lavora solo in profondità. Notazione: il triangolo su è Max e quello giù è Min. 
![[alphaBetaPruning.png]]
Per vedere un approfondimento vedere il video qui sotto. ![](https://www.youtube.com/watch?v=l-hh51ncgDI)
Proprietà:
- il pruning non inficia il risultato
- complessità temporale: $O(b^{m\over 2})$
	- nel caso migliore mi raddoppia la profondità a cui posso arrivare
	- in generala comunque funziona bene
