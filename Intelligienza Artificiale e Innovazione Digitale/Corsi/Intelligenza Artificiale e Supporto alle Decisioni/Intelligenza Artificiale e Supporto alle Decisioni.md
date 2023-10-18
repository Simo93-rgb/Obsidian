## Materiale/libri
Il libro è il solito ![[Artificial Intelligence A Modern Approach (3rd_Edition).pdf]]
ma c'è anche ![[LopezCBRBook.pdf]]


## Computer e Intelligenza
IBM parla di Cognitive Computer, comunque l'idea fra questa idea di IBM e di IA è quella di avere dei programmi che aumentino le abilità dell'essere umano. 
![[AccordoIAUomo.png]]
Soprattutto in situazioni critiche dare ad un esperto di un dominio sensibile la potenza e la quantità di dati che un sistema di IA è qualcosa di potentissimo, si immagini di dare ad un oncologo l'abilità di consultare un grosso DB al posto che la sua sola esperienza. 


## Come nasce l'IA
Il primo a pensare all'intelligenza artificiale è stato il padre dell'informatica, Alan Turing, anche se la nascita ufficiale è da ricondursi al 1956 in un seminaro con John McCarthy. Una vecchia definizione di IA presa da Wikipidia:

> Con il termine intelligenza artificiale - IA (spesso abbreviato in AI, dall'inglese Artificial Intelligence), si intende generalmente l'abilità di un computer di svolgere funzioni e ragionamenti tipici della mente umana. L'intelligenza artificiale è una disciplina dibattuta tra scienziati e filosofi, la quale manifesta aspetti sia teorici che pratici. Nel suo aspetto puramente informatico, essa comprende la teoria e le tecniche per lo sviluppo di algoritmi che consentano alle macchine (tipicamente ai calcolatori) di **mostrare** un'abilità e/o attività intelligente, almeno in domini specifici.

Il verbo *mostrare* è in grassetto perché una parte importante è questa percezione che l'essere umano ha mentre usa uno strumento di IA. Va precisato che deve essere vissuto sempre in un dominio ben confinato e specifico ossia, non aspettarsi che una IA per gli scacchi possa fare diagnosi medica.
### Due scuole di pensiero
**Ipotesi forte** (strong AI): poter ricreare una mente artificiale, una macchina (programmata) sapiente e avente autocoscienza
According to strong AI, the computer is not merely a tool in the study of the mind; rather, the appropriately programmed computer really is a mind (John Searle)

**Ipotesi debole** (weak AI): poter programmare una macchina in grado di svolgere compiti “intelligenti” in ambiti ristretti (e non necessariamente seguendo i meccanismi umani)

#### La stanza cinese
Esperimento mentale per dimostrare che il PC non sa cosa fa. In una stanza c'è un libro per tradurre dall'inglese al cinese, ho tanto tempo a disposizione per tradurre. Non so il cinese, ho solo un libro per tradurre applicando delle regole quindi non sono intelligente anche se da fuori sembra che io sappia il cinese. Un programma non sa che cazzo fa ma applica regole. 

Weak AI ha vinto, in modalità diverse:
- Approccio simbolico: automatizzare ragionamento e azione tramite simboli comprensibili agli umani ed elaborandoli con algoritmi
    
- Approccio sub-simbolico: riproduzione di fenomeni naturali non necessariamente rappresentati con simboli comprensibili (es: reti neurali). Si usano numeri.



- Prima Stagione - Inverno: Moravec Paradox è la questione che non si riusciva ad emulare un bambino di 2 anni ma si poteva fare un programma che gioca a scacchi
- Seconda Stagione - Primavera: stagione dei sistemi esperti e utilizzo linguaggi logici. Nascevano come funghi SW Houses che li facevano. 
- Terza Stagione - Inverno: i sistemi esperti risultarono difficili da mantenere e costruire perché l'inserimento della conoscenza era complicato ed il Machine Learning era troppo limitato; all'epoca qualche decina di parametro per un modello ML era già grande mentre oggi ne abbiamo centinaia di migliaia.
- Quarta Stagione - Primavera: crescita enorme dei sistemi ML e finalmente si sono resi conto che i modelli probabilistici dovevano essere utilizzati, anche se un essere umano non ha una mente stocastica. 

## Presente
Oggi siamo nell'epoca del DL grazie anche alla potenza enorme che le GPU offrono e alla massiva produzione di dati. 
• Modelli di reti neurali (anche vecchio stampo), ma con  
	• Nuovi algoritmi di apprendimento  
	• Grandissime quantita’ di dati da cui apprendere  
	• Grandissimo potere computazionale per far funzionare tali algoritmi

• Performance a livello (quasi e/o super) umano in
	- Riconoscimento ed interpretazione di immagini (guida autonoma,recupero informazioni da immagini, foto tagging)
	- Traduzioni automatiche (Google, Facebook, Amazon, ecc...)
	- Giochi intelligenti (Jeopardy, Go)
	- Gestione di conversazioni (chatbots, assistenti virtuali)

### Contro
- Deep learning funziona ancora a black-box  
- Necessita’ di Explainable AI  
- Ritorno a AI che usa modelli espliciti di conoscenza
- Tener conto degli errori passati

## Cosa deve fare l'IA?
![[Schermata 2023-10-03 alle 11.46.24.png]]
<center>Agire in modo razionale è la scelta del libro</center>

**Ragionare in modo umano** è difficilissimo anche perché le neuroscenze non sanno davvero come funziona il nostro cervello. 
**Ragionare in modo razionale** è un qualcosa che già Aristotele aveva iniziato a trattare, un esempio è il sillogismo. 

> La nocciola è un frutto, la nutella è una crema di nocciole, la frutta fa bene allora la nutella fa bene.

Il limite del ragionamento razionale è che non viene contemplata l'incertezza.
**Agire in modo razionale** significa massimizzare la probabilità di raggiungere un risultato in maniera sensata, con un dispendio di risorse ottimizzato. Il concetto di *minima spesa e massima resa*. 

## Argomenti del Corso
- Problem Solving e [[Ricerca nello Spazio degli Stati|Ricerca nello Spazio degli Stati]] (3 CFU)
	- Path-based search
	- Blind search ([[Ricerca nello Spazio degli Stati#Breath-first Search|Breadth-First]], [[Ricerca nello Spazio degli Stati#Depth-first Search|Depth-Fist]], [[Ricerca nello Spazio degli Stati#Iterative Deepening Search|Iterative Deepening]])
		- Best-first and Heuristic search ([[Ricerca nello Spazio degli Stati#Strategia Costo Uniforme|Uniform Cost]], [[Ricerca nello Spazio degli Stati#Strategia greedy|Greedy]], [[Ricerca nello Spazio degli Stati#$A {*} Search$|A*]], [[Ricerca nello Spazio degli Stati#$IDA {*}$|IDA*]])
	- [[Iterative Improvement (Local) search]]
		- [[Iterative Improvement (Local) search#Hill-climbing|Hill-climbing]]
		- [[Iterative Improvement (Local) search#Simulated Annealing - SA (Tempra Simulata)|Simulated Annealing]]
		- [[Iterative Improvement (Local) search#Algoritmi Genetici|Genetic Algorithms (cenni)]]
	- [[Giochi a due concorrenti]]
- [[Knoledge Representation and Reasoning|Rappresentazione della Conoscenza e Ragionamento]] (3 CFU)
	- [[Knoledge Representation and Reasoning#Knowledge Base Systems|Knowledge-Based Systems]]
	- [[Case-Based Reasoning]]
	- [[Ragionamento Incerto]]
	- Calcolo delle probabilita’ su variabili discrete (richiami, probabilita’ condizionata, Teorema di Bayes)
	- Reti Bayesiane
- Supporto alle decisioni (3 CFU)
	- Teoria delle Decisioni e  Decision Analysis
	- Influence Diagrams (Reti decisionali)
	- Modelli Temporali e Markov decision processes