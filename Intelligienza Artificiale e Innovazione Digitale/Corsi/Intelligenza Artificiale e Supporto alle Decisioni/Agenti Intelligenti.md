Un *Agente* è un'entità che riceve stimoli e agisce e può essere visto come una funzione che prende stimoli (percept )e restituisce azioni (Action)

> $f: P^★ \rightarrow A$ 

Per ogni *environment* in cui si trova l'agente e per i *tasks* che deve soddisfare si cerca di ottimizzare l'agente in modo specifico. Siccome complessità temporale e spaziale sono limiti concreti e non così lontani non è possibile raggiungere la perfezione. 
![[Schermata 2023-10-03 alle 14.12.18 1.png]]
Attenzione che non è sempre vero che un agente è un robot, comunque il focus è che a noi interessa il punto di domanda perché è la parte che dobbiamo sviluppare.

### Problema dell'aspirapolvere robot

^db0708

![[Schermata 2023-10-03 alle 14.16.37.png|300]]![[Schermata 2023-10-03 alle 14.18.41.png|400]] 
Lo **Stato** è una configurazione del problema. Ad ogni stato è possibile avere una certa configurazione di ambiente e associare una azione, in questo caso riassunto nella tabella qui sopra.

## Agenti Razionali
Un agente deve perseguire il “fa la cosa giusta” sulla base di ciò che riceve come stimolo e delle azioni che può eseguire. L’azione giusta è quella che produce il miglior risultato per l’agente.
La **Misura di Performance** è un criterio oggettivo per la misurazione del successo dell’agente, ad esempio la misura di performance di un vacuum-cleaner agent potrebbero essere la quantità di polvere aspirata, il tempo impiegato, la quantità di elettricità consumata, la quantità di rumore prodotto, ecc.

> Per ogni sequenza possibile di *percepts*, selezionare un’azione tale da massimizzare la sua misura di performance, data l’evidenza fornita dalla sequenza di *percepts* e qualsiasi sia la conoscenza codificata nell’agente stesso.

### PEAS
Acronimo di "Performance measure - Environment - Actuators - Sensors", è un gruppo di caratteristiche per caratterizzare un agente. Ad esempio per un taxi con guida autonoma:
- P --> sicurezza, velocità, legalità, profitti massimizzati
- E --> strade, traffico, pedoni
- A --> acceleratore, volante, freni, clacson
- S --> sonar, videocamere, GPS, sensori motore
Gli agenti sono sempre descrivibili con PEAS anche in ambiti molto diversi fra loro, ad esempio un agente di diagnosi clinica oppure un agente per comprare online. 

#### Tipi di Environment
Alcune precisazioni sull'ambiente sono da fare e inizierei parlando di un **ambiente completamente osservabile** ossia che l'agente sa lo stato in tutti i dettagli, ad esempio il robottino aspirapolvere che sa dove si trova, com'è fatta la stanza e quanto sporco c'è per ogni stanza. L'**ambiente parzialmente osservabile** si ha quando l'agente sa solo parzialmente lo stato come ad esempio sempre il robottino che sa quasi tutto come prima ma non sa quali stanze sono sporche. 
L'ambiente può essere **stocastico** oppure **deterministico**. 
Può essere **episodico** oppure **sequenziale** ossia che posso fare una cosa quando voglio oppure sequenzialmente.
L'environment può essere **statico** oppure **dinamico** ossia che non cambia oppure cambia mentre l'agente lavora.
**Discreto** oppure **continuo** è un'altra suddivisione possibile e per ultimo ma non meno importante, l'environment può essere ad **agente singolo** oppure ad **agenti multipli**.