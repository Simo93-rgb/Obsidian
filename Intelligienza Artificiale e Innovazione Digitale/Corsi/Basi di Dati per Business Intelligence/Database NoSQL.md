# Introduzione NoSQL
*Not Only SQL* non significa che tutti i DBMS che non usano SQL sono NoSQL perché questi ultimi devono avere determinate caratteristiche. Ad esempio i DBMS ad oggetti non sono considerabili dei database NoSQL.

I DBMS relazionali (RDBMS) hanno il problema di non saper gestire bene grandi complessità fino al punto di non perdere solo prestazioni ma proprio di rendere quasi impossibile strutturare un database. 
![[Assets/Multimedia/Database NoSQL - RDBMS vs complex.png|450]]
La scalabilità dei DBMS è assolutamente accettabile nelle operazioni di lettura ma quando si parla di operazioni in scrittura ci sono grandi problemi. 
Quando si parla di *Big Data* gli RDBMS sono completamente inutili; ricordando che grossolanamente con big data intendiamo dati che non stanno su un solo dispositivo fisico poiché intrinseco il concetto di dati distribuiti. 
Fra le varie caratteristiche dei database NoSQL diventa importante notare che nascono per essere scalabili orizzontalmente. 
![[Assets/Multimedia/Database NoSQL - scalability vert vd horiz.png|450]]
### Caratteristiche comuni ai DBMS  NoSQL
Sono molto diversi uno dall'altro ma alcune cose sono comuni:
- Schema dei dati non fisso
- Le proprietà acide non sono garantite
- Fortemente orientato alla scalabilità orizzontale e ai Big Data
- Le API sono semplici
## Transazioni ACID
- **A**tomicità $\rightarrow$ salvo tutto il dato o niente
- **C**oerenza $\rightarrow$ salvo solo i dati validi
- **I**solamento $\rightarrow$ le transazioni non valide non sono salvate
- **D**urabilità $\rightarrow$ i dati sono al sicuro
## Transazioni BASE
All'opposto delle transazioni acide ho le transazioni basiche:
- **B**asically **A**vailable $\rightarrow$ garantisce la disponibilità dei dati anche in presenza di fallimenti multipli.
- **S**oft state $\rightarrow$ la coerenza dei dati viene garantita dallo sviluppatore e non dal database. 
- **E**ventually Consistent $\rightarrow$ alla fine in un certo punto del futuro i dati convergono ad uno stato coerente. 

| ACID | BASE |
|---|---|
| Strong consistency | Weak consistency – stale data OK |
| Isolation | Availability first |
| Focus on “commit” | Best effort |
| Nested transactions | Approximate answers OK |
| Availability? | Aggressive (optimistic) |
| Conservative (pessimistic) | Simpler! |
| Difficult evolution (e.g. schema) | Faster |
|  | Easier evolution |


## Principali DBMS
Esistono 4 tipi di database nel mondo NoSQL 

### Key-Value
Basati su array associativi conosciuti ai più come dizionari o tabella hash. Recupero i dati con la chiave.
La gestione della struttura è sempre compito dello sviluppatore quindi la scelta delle chiavi è un aspetto cruciale. Posso anche avere una tupla di chiavi per identificare i dati ma questo comunque non garantisce di risolvere i problemi. 
Qui le query non sono affatto semplici e dipendono dagli strumenti messi a disposizione dal DBMS e spesso siccome alcune cose non le fa proprio tocca poi farle a livello di programmazione.

![[Assets/Multimedia/Database NoSQL - esempio dato KEY-VALUE.png|300]]
<p align="center">

Esempio di dato nel DB Key-Value

</p>
Le operazioni base sono *GET(key)* e *PUT(key, value)*.

### Database A Colonna
Nonostante usino tabelle i nomi delle colonne possono cambiare da riga a riga. Lo si può vedere come una struttura chiave-valore a due dimensioni. Spotify utilizza Cassandra ad esempio. 
![[Assets/Multimedia/Database NoSQL - esempio A Colonna.png]]


| PRO | CONTRO |
|---|---|
| Aggiunta/eliminazione di colonna | aggiornamento dati lento (insert, delete) |
| molto efficienti nella compressione e/o nel partizionamento dei dati. | lento su query che lavorano su più attributi (join in particolare) |
| efficienza nelle query di aggregazione. |  |
| scalabilità, perché adatti per l'elaborazione parallela. |  |
| operazioni di caricamento molto veloci. |  |

### Database a Grafo
La cosa figa è che rappresentare le relazioni fra nodi è una cosa intrinseca nella struttura del grafo ed esistono un sacco di algoritmi noti in letteratura per navigare e modificare i grafi. 
Ebay utilizza questa struttura avvalendosi del DB Neo4j e lo usa per salvare e analizzare le interazioni di vendita per previsioni future. 
Nel caso preciso Neo4j ha un linguaggio di programmazione suo che mi permette di creare nodi, editarli e di conseguenza scrivere anche algoritmi per gestire il db e fare query. 

### Database orientato ai documenti
Ogni elemento è un documento che ha la sua struttura e le sue caratteristiche peculiari, l'unica cosa che lo contraddistingue nel DB è la chiave primaria. Toyota usa MongoDB per la gestione IoT delle sue fabbriche.
Si può immaginare come un DB fatto di JSON. Qui i problemi sono le query, tutta questa libertà nella forma complica enormemente la composizione di query. 

![[Database NoSQL - riepilogo  famiglie di DB.png]]

# Teorema CAP

![[Database NoSQL - intersezioni CAP.png|450]]
Applicabile ai soli sistemi distribuiti, ci dice che fra tre grosse caratteristiche volute se ne possono avere solo due:
1. **C**onsistency $\rightarrow$ tutti i nodi vedono lo stesso dato allo stesso momento
2. **A**vailaility $\rightarrow$ ogni operazione deve sempre avere una risposta
3. **P**artition Tolerance $\rightarrow$ tollerante alla eliminazione di un nodo del sistema distribuito, di una aggiunta di un dato o alla non disponibilità di un componente.

![[Dataase NoSQL - the 8 facilities of dist computing.png|400]]
I sistemi che garantiscono *P* e *A* non possono garantire *C* in lettura poiché quando aggiorno un dato può essere effettuato su entrambi i lati della partizione. Si basano sulle [[Database NoSQL#Transazioni BASE|Proprietà Basiche]] per garantire prestazioni
Siccome posso avere due caratteristiche su tre, andiamo a vedere le caratteristiche che ci sono con le varie coppie possibili.

### CA (Consistency and Availability)
Questa combinazione implica la mancanza di tolleranza ai partizionamenti di rete. In altre parole, se c'è una partizione, il sistema deve scegliere tra coerenza e disponibilità.

### AP (Availability and Partition Tolerance)
In questo caso, il sistema prioritizza la disponibilità anche a costo della coerenza. Questo significa che, in caso di partizione di rete, il sistema rimane disponibile ma potrebbe fornire dati non coerenti.

### CP (Consistency and Partition Tolerance)
Qui, la coerenza è prioritaria anche a costo della disponibilità in caso di partizione di rete. Il sistema cerca di mantenere i dati coerenti anche durante i fallimenti di rete.

### Eric Brewer: commento a posteriori
Siccome il professore che teorizzò il CAP si rese conto che stava invecchiando male commentò che in realtà la terza lettera non è che non posso averla proprio ma posso averla parzialmente. Infatti, può un sistema distribuito non essere tollerante al partizionamento? La risposta è **NO**, quindi il modello *CA* in teoria non avrebbe senso se non si ha un minimo di *partition tollerance*. 

## Partizionamento

Il partizionamento, nel contesto dei database distribuiti e del teorema CAP, si riferisce alla suddivisione della rete in segmenti isolati, impedendo temporaneamente la comunicazione tra di essi. Questo può verificarsi a causa di guasti di rete o ritardi nella comunicazione.
Ci sono principalmente due tipi di partizionamento:

1. **Partizionamento di rete completo (Total Network Partition):** Tutti i nodi del sistema sono divisi in due o più gruppi, e ciascun gruppo è isolato dagli altri. In questo caso, il sistema deve scegliere tra coerenza e disponibilità.
    
2. **Partizionamento di rete parziale (Partial Network Partition):** Solo alcuni nodi sono coinvolti nella partizione, mentre altri possono ancora comunicare tra loro. Anche in questo caso, il sistema deve affrontare le sfide di coerenza e disponibilità.
    

Per esempi concreti, possiamo guardare alle strategie adottate da alcune big tech:

1. **Google (Bigtable e Cloud Spanner):** Google Cloud Spanner cerca di affrontare il problema del partizionamento offrendo coerenza e disponibilità in presenza di partizionamenti di rete. Utilizza orologi atomici (TrueTime Clock) per sincronizzare i dati tra i nodi e garantire una forma di coerenza anche durante i partizionamenti.
    
2. **Amazon (DynamoDB):** DynamoDB di Amazon è progettato per essere altamente disponibile e tollerante ai partizionamenti. Durante un partizionamento di rete, alcuni nodi possono continuare a rispondere alle richieste, anche se ciò potrebbe portare a eventuali incoerenze nei dati.
    
3. **Microsoft (Azure Cosmos DB):** Anche Azure Cosmos DB cerca di affrontare il problema del partizionamento consentendo ai clienti di scegliere tra livelli di coerenza in base alle proprie esigenze. Offre opzioni che coprono da forte coerenza a disponibilità elevata in caso di partizionamento.

Ci sono vari tipi di partizionamento e ognuno ha delle sue peculiarità:
#### Data Partitioning (Partizionamento dei dati) 
Questo tipo di partizionamento coinvolge la divisione dei dati tra diversi nodi o partizioni. Ogni partizione è responsabile di un sottoinsieme specifico dei dati. Questo può migliorare le prestazioni del sistema distribuito, consentendo una distribuzione efficiente dei dati su più nodi.

#### Operational Partitioning (Partizionamento operativo)
Si riferisce alla suddivisione delle attività operative o delle funzioni di un sistema distribuito. Ad esempio, in un'applicazione web, potrebbe significare distribuire il carico di richieste tra diversi server in base alle funzioni che devono essere eseguite.

#### Functional Partitioning (Partizionamento funzionale)
Questo tipo di partizionamento coinvolge la divisione delle funzionalità del sistema tra nodi o servizi distinti. Ogni nodo è responsabile di un aspetto specifico delle funzionalità complessive del sistema.

#### User Partitioning (Partizionamento utente)
In questo caso, l'obiettivo è suddividere gli utenti del sistema tra diverse partizioni. Ad esempio, in un sistema di gestione di contenuti, è possibile assegnare gruppi di utenti specifici a server o partizioni specifiche.

#### Hierarchical Partitioning (Partizionamento gerarchico)
Questo tipo di partizionamento implica una suddivisione in modo gerarchico. Ad esempio, un sistema distribuito potrebbe avere partizioni principali, ognuna delle quali contiene partizioni secondarie, e così via. Ciò può contribuire a una migliore organizzazione e gestione delle risorse.

### Sharding
Differenti motivi, molti di questi hanno a che fare con gli ambienti aziendali e le dimensioni dei dati. Possiamo guardare alcuni elencati qui:
- Per motivi legali o di privacy, è necessario archiviare alcuni dati in database isolati per proteggere o limitare l'accesso (ad es. leggi GDPR).
- I dati sono già raggruppati in istanze separate per le attività quotidiane, ma potrebbe essere necessario intrecciarli in un grafo unificato (es. knowledge graph)
- Per ridurre al minimo la latenza delle query in varie regioni, i segmenti rilevanti del grafo possono essere archiviati in regioni vicine alle origini delle richieste di query.
- I dati archiviati potrebbero essere separati per data,  ma report ad hoc o altre esigenze potrebbero richiedere query su questi grafi.
- La dimensione del grafico sta diventando grande (decine di miliardi di nodi)  da rendere necessario dividere i dati in grafi più piccoli da eseguire su hardware di dimensioni inferiori e accessibili alle parti necessarie.

![[Database NoSQL - sharding.png|350]]

## PACELC
Il concetto di PACELC è un'estensione del teorema CAP. PACELC aggiunge ulteriori considerazioni alle scelte di progettazione nei sistemi distribuiti, introducendo i seguenti aspetti:
Il teorema PACELC si può riassumere così:

- **P (Partition Tolerance)**: In presenza di partizioni, il sistema deve scegliere tra coerenza e disponibilità.
- **A (Availability)**: Se non ci sono partizioni, il sistema deve decidere tra fornire alta disponibilità...
- **C (Consistency)**: ...o mantenere la coerenza dei dati tra tutti i nodi.
- **E (Else)**: Indica che, anche senza partizioni, esiste un trade-off...
- **L (Latency)**: ...tra latenza minore e...
- **C (Consistency)**: ...migliore coerenza o tra latenza e disponibilità.
![[Database NoSQL - PACELC.png|450]]
In breve, PACELC fornisce una visione più dettagliata delle scelte di progettazione in un sistema distribuito, considerando non solo la triade di coerenza, disponibilità e tolleranza ai partizionamenti, ma anche la latenza e i trade-off associati a coerenza e disponibilità. I progettisti di sistemi distribuiti possono utilizzare PACELC per guidare le decisioni in modo più mirato in base alle esigenze specifiche del loro sistema.

# Database NoSQL: Confrontone
| Database | CAP | Architettura | Caratteristiche Principali | Aziende Famose |
| ---- | ---- | ---- | ---- | ---- |
| Redis | CP con configurazioni che possono favorire A | key-value | Database in memoria, supporta varie strutture dati | Twitter, GitHub, Snapchat |
| DynamoDB | AP ma privilegia A e la scalabilità. | key-value | Servizio NoSQL gestito, prestazioni a bassa latenza | Amazon, Samsung, Netflix |
| Neo4j | CA | Graph | Ottimizzato per dati con relazioni complesse | LinkedIn, eBay, Adobe |
| Cassandra | AP con C configurabile |  | Scalabile, prestazioni elevate, senza SPOF | Facebook, Netflix, Twitter |
| HBase | CP con A configurabile |  | Database colonnare, scalabile su molti server | Facebook, Twitter, Yahoo |
| MongoDB | CP con A migliorabile |  | Orientato ai documenti, supporta varie tipologie di dati | Adobe, SAP, eBay |
| InfluxDB | AP (velocissimo) |  | Database di serie temporali, ottimizzato per la velocità | IBM, PayPal, Tesla |
| NEWSQL | CA |  | Combina SQL tradizionale con scalabilità NoSQL | Varia per prodotto specifico |
### Redis
Redis è stato sviluppato principalmente per superare le limitazioni dei database tradizionali in termini di velocità di accesso ai dati. L'esigenza iniziale derivava dalla necessità di gestire dati in tempo reale per un'applicazione web chiamata "lloogg", che necessitava di un database capace di scrivere e recuperare dati molto rapidamente. Redis è stato quindi progettato come un sistema di memorizzazione chiave-valore in memoria, per garantire tempi di accesso brevi, ideale per applicazioni che richiedono prestazioni elevate, come caching, sessioni di utenti e code di messaggi.

- **Caratteristiche Principali**: Database in memoria, supporta strutture dati come stringhe, hash, liste, set, e set ordinati con query di range.
- **Teorema CAP**: CP (Coerenza e Tolleranza alla Partizione), con configurazioni che possono favorire la disponibilità.
	- È nato come CA per singola macchina
	- *Redis Sentinel* (AP): Sentinel gestisce il failover. Aiuta a configurarlo per l'alta disponibilità.
	- *Redis Cluster* (CP): È una soluzione di scrittura multipla/più grande della RAM. Fondamentalmente una soluzione di sharding. Non fornisce una perfetta disponibilità o coerenza.
		- Lo *sharding* somiglia al RAID nei computer, faccio dei frammenti logici (shard) distribuiti su vari computer.
- **Aziende Famose**: X, GitHub, Snapchat.

### Amazon DynamoDB
La creazione di Amazon DynamoDB è stata motivata dalla necessità di un database NoSQL che potesse offrire prestazioni affidabili e scalabilità gestita, riducendo al contempo la complessità operativa. È stato sviluppato per ridurre la dipendenza dai RDBMS con licenza e per gestire la crescente base di clienti di Amazon, soprattutto durante i picchi di traffico come quelli sperimentati durante le festività natalizie del 2004. DynamoDB è stato progettato per fornire un'esperienza utente ottimale con *capacità di indicizzazione* dei dati efficienti e *bassa latenza* nelle operazioni, il tutto anche oltre i 100TB!

- **Caratteristiche Principali**: Servizio di database NoSQL completamente gestito, offre prestazioni a latenza bassa a qualsiasi scala.
	- La conformità ACID è garantita solo nelle transazioni eseguite all'interno della stessa regione, che sono attualmente 30. Non è disponibile per le tabelle globali.
	- La best practice: organizzare i dati in modo da ottimizzare le sole performance.
- **Teorema CAP**: AP (Disponibilità e Tolleranza alla Partizione), privilegia la disponibilità e la scalabilità.
- **Aziende Famose**: Amazon, Samsung, Netflix.

Non utilizzarlo quando:
- sono richieste transazioni multi-item o cross-table
- sono richieste query e join complessi
- è richiesta l'analisi in tempo reale sui dati storici
### Neo4j
Il focus principale nella creazione di Neo4j è stato di fornire un sistema ottimizzato per interrogazioni complesse e trasversali nelle relazioni tra i dati, superando le limitazioni dei database relazionali tradizionali in scenari dove le connessioni tra i dati sono fondamentali. Le ragioni di creazione includono la necessità di un modello di dati agile e flessibile, la rappresentazione esplicita delle relazioni e la capacità di eseguire query in tempo reale con focus sulle relazioni anziché solo sui dati isolati. È quindi un database che sfrutta la natura intrinsecamente connessa dei dati.

- **Caratteristiche Principali**: Database a grafi, ottimizzato per memorizzare e interrogare dati con relazioni complesse.
	- Supporta a pieno le proprietà ACID
	- I nodi contengono coppie chiave-valore
	- Gli archi sono sempre direzionati
	- Si interroga il DB con il linguaggio dichiarativo *Cypher*
	- Sfruttando una dimensione fissa di 9 byte per i record si sfrutta l'aritmetica dei puntatori garantendo attraversamenti del grafo in complessità $O(n)$
- **Teorema CAP**: CA (Coerenza e disponibilità), per garantire relazioni coerenti.
- **Aziende Famose**: LinkedIn, eBay, Adobe.

#### Neo4j Fabric: Singolo DBMS
![[Database NoSQL - neo4j fabric singolo.png|400]]

#### Neo4j Fabric: Multi DBMS
![[Database NoSQL - neo4j fabric multi.png|400]]

#### Sharding: dove dividere i dati
- Si dovrà prendere decisioni sulla separazione dei dati e rifattorizzare manualmente i dati in frammenti che dovranno essere gestiti da Fabric.
- Determinare i punti migliori per dividere i dati del grafo in grafi separati per Fabric può essere complicato se i dati sono strettamente collegati o se crescono nel tempo.
- L’idea è cercare di pensare/trovare nei dati dei  sottografi naturali o strutture disconnesse dove c'è la divisione più netta.
- Nell’esempio, ci sono divisioni naturali e nette nei dati per continente. Possiamo suddividere i nostri dati in persone che condividono tutte lo stesso continente.
- L'unica eccezione a questo è se il nostro continente è basato sulla cittadinanza/residenza, in quanto è possibile (anche se improbabile) che molte persone abbiano la cittadinanza in più continenti. In tal caso, potremmo aver bisogno di una duplicazione minima. Se i nostri dati sul continente si basano sulla nascita, nessuna duplicazione, poiché una persona non può nascere in più di un continente.
- Comprendere il contesto e le definizioni (dominio) dei dati può essere importante per prendere la decisione migliore su dove suddividere i dati.
- Un'altra prospettiva è il modo in cui i dati vengono modellati, in quanto ciò può influire sulla presenza naturale di sottografi chiari nei dati in base al modello.
### Cassandra
Cassandra è stato creato per affrontare specifiche esigenze di scalabilità e disponibilità dei dati, nello specifico per gestire grandi volumi di dati distribuiti su più server senza un singolo punto di fallimento. Questo è stato particolarmente cruciale per Facebook, dove Cassandra è stato originariamente sviluppato, per supportare la ricerca nell'Inbox di Facebook con un grande volume di dati e con la necessità di una scalabilità orizzontale efficiente e di una gestione flessibile della consistenza dei dati.

- **Caratteristiche Principali**: Database distribuito, offre scalabilità lineare e prestazioni elevate con architettura senza singoli punti di fallimento.
- **Teorema CAP**: AP (Disponibilità e Tolleranza alla Partizione), con coerenza configurabile.
- **Aziende Famose**: Facebook, Netflix, Twitter.

### HBase
HBase è stato creato per soddisfare il bisogno di un sistema di storage efficiente e scalabile per grandi quantità di dati, in particolare per supportare le funzionalità di ricerca in linguaggio naturale all'interno di progetti come Hadoop. È stato progettato per superare le limitazioni dell'elaborazione in batch di HDFS, fornendo ricerca rapida di record, supporto per inserimenti e aggiornamenti a livello di record e conservazione efficiente delle versioni dei dati. Questo obiettivo è stato raggiunto creando un database che potesse lavorare con i dati in modo più granulare e che fosse ottimizzato per le operazioni casuali di lettura e scrittura, essenziali per l'analisi online e altre operazioni analitiche su set di dati di grandi dimensioni.

- **Caratteristiche Principali**: Database colonnare, progettato per scalare su un grande numero di server.
- **Teorema CAP**: CP (Coerenza e Tolleranza alla Partizione), ma può essere configurato per migliorare la disponibilità.
- **Aziende Famose**: Facebook, Twitter, Yahoo.

### MongoDB
  
MongoDB è stato creato per rispondere alla necessità di un database che potesse gestire grandi volumi di dati con schemi flessibili, fornendo un'alta velocità di sviluppo e facilitando la scalabilità. È progettato pensando sia alla scalabilità sia all'agilità degli sviluppatori, consentendo di memorizzare documenti in un formato simile a JSON con schemi dinamici. Questo approccio permette di superare i limiti dei database relazionali tradizionali, specialmente quando si tratta di scalabilità orizzontale e di gestione di dati non strutturati o semi-strutturati.

- **Caratteristiche Principali**: Database orientato ai documenti, supporta varie tipologie di dati.
- **Teorema CAP**: CP (Coerenza e Tolleranza alla Partizione), con opzioni per aumentare la disponibilità.
- **Aziende Famose**: Adobe, SAP, eBay.

### InfluxDB
  
InfluxDB è stato sviluppato per rispondere alla crescente necessità di analizzare e memorizzare grandi quantità di dati di serie temporali generati da sensori, applicazioni in tempo reale e infrastrutture IT. È progettato per gestire carichi di lavoro ad alta velocità di scrittura e per eseguire query complesse su dati temporali. L'obiettivo era creare un database che potesse non solo memorizzare in modo efficiente grandi volumi di dati temporali, ma anche fornire una piattaforma per l'analisi e il monitoraggio in tempo reale di questi dati.

- **Caratteristiche Principali**: Database di serie temporali per eventi ad alta velocità di scrittura.
- **Teorema CAP**: AP (Disponibilità e Tolleranza alla Partizione), ottimizzato per la velocità.
- **Aziende Famose**: IBM, PayPal, Tesla.

### NEWSQL (Generalmente riferito a database come Google Spanner)
Questi sistemi sono stati sviluppati per colmare il divario tra le prestazioni e la scalabilità dei sistemi NoSQL e le garanzie ACID dei database relazionali tradizionali. L'obiettivo era fornire la scalabilità necessaria per l'elaborazione delle transazioni online (OLTP), mantenendo le proprietà ACID di un sistema di database tradizionale. Questa esigenza è nata in risposta alle limitazioni di scalabilità dei sistemi SQL tradizionali e alla mancanza di supporto transazionale nei primi sistemi NoSQL. NEWSQL mira a offrire un'architettura distribuita che supporti transazioni distribuite con coerenza ACID, scalabilità attraverso sharding e replica automatica, e prestazioni elevate mantenendo i dati in RAM.

- **Caratteristiche Principali**: Combina elementi dei database SQL tradizionali con la scalabilità dei sistemi NoSQL.
- **Teorema CAP**: CA (Coerenza e Disponibilità), grazie a innovazioni come gli orologi TrueTime di Google.
- **Aziende Famose**: Google (per Spanner), per NEWSQL varia in base al prodotto specifico.

# Conclusione
### Supporto per Multipli Modelli di Dati

I database NoSQL sono estremamente flessibili nella gestione di dati strutturati, semi-strutturati e non strutturati, a differenza dei database relazionali che sono più rigidi.

### Facilmente Scalabile tramite Architettura Peer-to-Peer

I database NoSQL utilizzano un'architettura peer-to-peer per una scalabilità facile ed economica, superando le limitazioni dell'architettura master-slave dei database relazionali.

### Flessibilità: Gestione Versatile dei Dati

La gestione dei dati nei database NoSQL è altamente flessibile, permettendo di elaborare dati strutturati, semi-strutturati e non strutturati con facilità.

### Capacità di Distribuzione

I database NoSQL sono progettati per distribuire dati su scala globale, supportando operazioni di lettura e scrittura in più data center e/o regioni cloud.

### Zero Downtime

L'architettura senza master dei database NoSQL consente di mantenere più copie dei dati su nodi diversi, garantendo un accesso facile e veloce ai dati e minimizzando i tempi di inattività.

### Decisioni tra NoSQL e SQL

La scelta tra NoSQL e database relazionali dipende dalle esigenze specifiche dell'azienda, con la possibilità di utilizzare entrambi per complementarsi.

### Valutazione delle Funzionalità e Capacità dei Database NoSQL per la Gestione di Data Lake di Smart City

MongoDB e Redis mostrano alte prestazioni, mentre Neo4j e Cassandra hanno valori più modesti. I database NoSQL compromettono la coerenza per fornire alte prestazioni e scalabilità.

### Limitazioni dei Database NoSQL

La mancanza di standard definiti, la variabilità dei linguaggi di progettazione e di query, la curva di apprendimento più ripida, e la sfida nel mantenere le proprietà ACID sono alcune delle limitazioni.

Questi punti offrono una visione conclusiva delle caratteristiche distintive e delle considerazioni da tenere a mente quando si valutano i database NoSQL per applicazioni specifiche.