# Introduzione NoSQL
*Not Only SQL* non significa che tutti i DBMS che non usano SQL sono NoSQL perché questi ultimi devono avere determinate caratteristiche. Ad esempio i DBMS ad oggetti non sono considerabili dei database NoSQL.
![[Database NoSQL - meme del CV NoSQL.png|400]]
I DBMS relazionali (RDBMS) hanno il problema di non saper gestire bene grandi complessità fino al punto di non perdere solo prestazioni ma proprio di rendere quasi impossibile strutturare un database. 
![[Assets/Multimedia/Database NoSQL - RDBMS vs complex.png]]
La scalabilità dei DBMS è assolutamente accettabile nelle operazioni di lettura ma quando si parla di operazioni in scrittura ci sono grandi problemi. 
Quando si parla di *Big Data* gli RDBMS sono completamente inutili; ricordando che grossolanamente con big data intendiamo dati che non stanno su un solo dispositivo fisico poiché intrinseco il concetto di dati distribuiti. 
Fra le varie caratteristiche dei database NoSQL diventa importante notare che nascono per essere scalabili orizzontalmente. 
![[Assets/Multimedia/Database NoSQL - scalability vert vd horiz.png]]

In questi DB non sono applicabili le proprietà acide:
- **A**tomicità $\rightarrow$ salvo tutto il dato o niente
- **C**oerenza $\rightarrow$ salvo solo i dati validi
- **I**solamento $\rightarrow$ le transazioni non valide non sono salvate
- **D**urabilità $\rightarrow$ i dati sono al sicuro

### Caratteristiche comuni ai DBMS  NoSQL
Sono molto diversi uno dall'altro ma alcune cose sono comuni:
- Schema dei dati non fisso
- Le proprietà acide non sono garantite
- Fortemente orientato alla scalabilità orizzontale e ai Big Data
- Le API sono semplici

## Transazioni BASE
All'opposto delle transazioni acide ho le transazioni basiche:
- **B**asically **A**vailable $\rightarrow$ garantisce la disponibilità dei dati anche in presenza di fallimenti multipli.
- **S**oft state $\rightarrow$ la coerenza dei dati viene garantita dallo sviluppatore e non dal database. 
- **E**ventually Consistent $\rightarrow$ alla fine in un certo punto del futuro i dati convergono ad uno stato coerente. 
![[Assets/Multimedia/Database NoSQL - ACID vs BASE.png]]

## Teorema CAP
Applicabile ai soli sistemi distribuiti, ci dice che fra tre grosse caratteristiche volute se ne possono avere solo due:
1. **C**onsistency $\rightarrow$ tutti i nodi vedono lo stesso dato allo stesso momento
2. **A**vailaility $\rightarrow$ ogni operazione deve sempre avere una risposta
3. **P**artition Tolerance $\rightarrow$ tollerante alla eliminazione di un nodo del sistema distribuito, di una aggiunta di un dato o alla non disponibilità di un componente.

![[Assets/Multimedia/Database NoSQL - coppie del CAP.png]]

## Principali DBMS
Esistono 4 tipi di database nel mondo NoSQL e ognuno ha pregi e difetti ovviamente. 

### Key-Value
Basati su array associativi conosciuti ai più come dizionari o tabella hash. Recupero i dati con la chiave e questa è stata la scelta di Twitter.
![[Assets/Multimedia/Database NoSQL - chiave valore.png|400]]

La gestione della struttura è sempre compito dello sviluppatore quindi la scelta delle chiavi è un aspetto cruciale. Posso anche avere una tupla di chiavi per identificare i dati ma questo comunque non garantisce di risolvere i problemi. 
Qui le query non sono affatto semplici e dipendono dagli strumenti messi a disposizione dal DBMS e spesso siccome alcune cose non le fa proprio tocca poi farle a livello di programmazione. 
![[Assets/Multimedia/Database NoSQL - esempio dato KEY-VALUE.png|400]]
<p align="center">

Esempio di dato nel DB Key-Value

</p>
Le operazioni base sono *GET(key)* e *PUT(key, value)*.

### Database A Colonna
Nonostante usino tabelle i nomi delle colonne possono cambiare da riga a riga. Lo si può vedere come una struttura chiave-valore a due dimensioni. Spotify utilizza Cassandra ad esempio. 
![[Assets/Multimedia/Database NoSQL - esempio A Colonna.png]]
![[Assets/Multimedia/Database NoSQL - pro e contro A Colonna.png]]

### Database a Grafo
La cosa figa è che rappresentare le relazioni fra nodi è una cosa intrinseca nella struttura del grafo ed esistono un sacco di algoritmi noti in letteratura per navigare e modificare i grafi. 
Ebay utilizza questa struttura avvalendosi del DB Neo4j e lo usa per salvare e analizzare le interazioni di vendita per previsioni future. 
Nel caso preciso Neo4j ha un linguaggio di programmazione suo che mi permette di creare nodi, editarli e di conseguenza scrivere anche algoritmi per gestire il db e fare query. 

### Database orientato ai documenti
Ogni elemento è un documento che ha la sua struttura e le sue caratteristiche peculiari, l'unica cosa che lo contraddistingue nel DB è la chiave primaria. Toyota usa MongoDB per la gestione IoT delle sue fabbriche.
Si può immaginare come un DB fatto di JSON. Qui i problemi sono le query, tutta questa libertà nella forma complica enormemente la composizione di query. 

![[Database NoSQL - riepilogo  famiglie di DB.png]]

# Teorema CAP: approfondimento

Valgono le stesse cose dette in [[Database NoSQL#Teorema CAP|Teorema CAP]] 
![[Dataase NoSQL - the 8 facilities of dist computing.png]]
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

1. **Google (Bigtable e Cloud Spanner):** Google Cloud Spanner cerca di affrontare il problema del partizionamento offrendo coerenza e disponibilità in presenza di partizionamenti di rete. Utilizza orologi atomici per sincronizzare i dati tra i nodi e garantire una forma di coerenza anche durante i partizionamenti.
    
2. **Amazon (DynamoDB):** DynamoDB di Amazon è progettato per essere altamente disponibile e tollerante ai partizionamenti. Durante un partizionamento di rete, alcuni nodi possono continuare a rispondere alle richieste, anche se ciò potrebbe portare a eventuali inconsistenze nei dati.
    
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
   

## PACELC
Il concetto di PACELC è un'estensione del teorema CAP. PACELC aggiunge ulteriori considerazioni alle scelte di progettazione nei sistemi distribuiti, introducendo i seguenti aspetti:

1. **PACELC:**
    - **P: Partition Tolerance (Tolleranza ai partizionamenti):** Questo è il componente principale ereditato dal teorema CAP. Indica la capacità del sistema di continuare a funzionare anche in presenza di partizionamenti di rete.
        
    - **A: Availability (Disponibilità):** Questo è simile al componente "Availability" del teorema CAP. Rappresenta la capacità del sistema di rispondere alle richieste, anche in presenza di partizionamenti.
        
    - **C: Consistency (Coerenza):** Questo è simile al componente "Consistency" del teorema CAP. Indica la coerenza dei dati nel sistema.
        
    - **E: Latency (Latency):** Aggiunge un nuovo aspetto al confronto. Rappresenta il tempo di risposta del sistema alle richieste degli utenti.
        
    - **L: Consistency Trade-off (Trade-off di coerenza):** Questo aspetto riflette la possibilità di compromessi nella coerenza dei dati per migliorare la latenza o la disponibilità.
        
    - **C: Consistency Trade-off (Trade-off di coerenza):** Analogamente al componente "Consistency Trade-off," sottolinea la possibilità di negoziare la coerenza dei dati in cambio di altri benefici.
        

In breve, PACELC fornisce una visione più dettagliata delle scelte di progettazione in un sistema distribuito, considerando non solo la triade di coerenza, disponibilità e tolleranza ai partizionamenti, ma anche la latenza e i trade-off associati a coerenza e disponibilità. I progettisti di sistemi distribuiti possono utilizzare PACELC per guidare le decisioni in modo più mirato in base alle esigenze specifiche del loro sistema.

# REDIS
Remote Directory Server, nato per il real time. Secondo solo a MongoDB è un DB chiave-valore che sta in-memory:
- Un server adatto a memeorizzare strutture dati
- Che gestiste esplicitamente repliche 
- Con memorizzazione persistete (durable)
- Gestire in modo atomico transazioni
- consente di creare sistemi di produttori e consumatori di eventi
- la coda asincrona è come una coda standard, tranne per il fatto che quando si rimuove dalla coda un elemento da una coda vuota, il calcolo si blocca invece di fallire.

Per non perdere dati i dati prima o poi devono finire su disco ma ovviamente in modo asincrono altrimenti perderei completamente il vantaggio di stare in ram. Ci sono due approcci principali:
1. *Periodic Dump*: scrivo l'intero DB su disco
2. *Append On File*: ad ogni write appendo il cambio al file di log. 

La *gestione delle chiavi* è un po' quella per la buona programmazione quando usiamo i dizionari in python quindi è preferibile una chiave leggibile piuttosto che una criptica. Come tipo di *dato primitivo* ha solo le stringhe ma ha tre container:
- hashes list
- set
- sorted set

Ci sono anche:
- Bitmaps: operazioni a livello di bit
- Bitfields: gestire contatori in modo efficente
- HyperlogLog: struttura ottimizzata per calcolare (in modo probabilistico) la 
- ardinalità degli insiemi (errore standard 0.81%)
- Geospatial Indexes: coordinate geospaziali 
- Streams: funzionano come append-only log.

Anche REDIS non ha un linguaggio standard e come tanti bisogna studiare come funziona e come si interroga.
![[Database NoSQL - REDIS vs SQL.png]]

## REDIS Cluster
Siccome nei confronti del teorema CAP la base di dati si posiziona come CA è nato ben presto il problema della gestione dei Big Data che pretende un sistema distriuito. Nasce quindi la versione clusterizzata di REDIS, ecco alcune caratteristiche:
1. **Partizionamento orizzontale:** Redis Cluster divide i dati in modo orizzontale tra i nodi, consentendo una distribuzione uniforme dei dati e una migliore scalabilità.
    
2. **Sharding e Replicazione:** Redis Cluster supporta sharding automatico dei dati su più nodi, consentendo di gestire grandi quantità di dati. Inoltre, offre la possibilità di replicare i dati su nodi secondari per garantire la disponibilità in caso di guasto di un nodo.
    
3. **Ruoli dei nodi:** Ogni nodo in Redis Cluster può assumere uno dei tre ruoli principali: master, slave o nodo inattivo. Questi ruoli contribuiscono a garantire la coerenza e la disponibilità, permettendo ai nodi di agire come copie di backup e garantendo che ci siano sempre repliche disponibili.
    
4. **Rilevamento automatico dei partizionamenti:** Redis Cluster è progettato per rilevare automaticamente le partizioni di rete e gestire il failover, garantendo che il sistema possa continuare a funzionare anche in presenza di partizionamenti.
REDIS Cluster è considerato *CP*

## REDIS Sentinel
Redis Sentinel può essere utilizzato per implementare un sistema Redis altamente disponibile e tollerante ai guasti.

Ecco alcune caratteristiche principali di Redis Sentinel:

1. **Monitoraggio:** Redis Sentinel monitora costantemente lo stato dei nodi Redis nel sistema. Può rilevare guasti, ritiri e altre condizioni anomale.
    
2. **Failover automatico:** In caso di guasto di un nodo master, Redis Sentinel può attivare automaticamente il failover, promuovendo un nodo slave a nuovo master. Questo aiuta a mantenere la disponibilità del sistema anche in presenza di fallimenti.
    
3. **Configurazione dinamica:** Redis Sentinel supporta la configurazione dinamica, consentendo l'aggiunta o la rimozione di nodi senza la necessità di riavviare l'intero sistema.
    
4. **Notifiche agli amministratori:** Redis Sentinel può inviare notifiche agli amministratori del sistema quando si verificano eventi significativi, come un failover.
    
5. **Rilevamento di partizionamenti di rete:** Redis Sentinel è in grado di rilevare partizionamenti di rete e prendere decisioni di failover in modo coerente per mantenere l'operatività del sistema.
    

Redis Sentinel non è destinato a garantire la coerenza del database in tutte le condizioni, ma piuttosto a garantire che il sistema rimanga operativo anche in presenza di guasti. Quando un failover è attivato, potrebbe esserci un breve periodo di indisponibilità, e la coerenza potrebbe essere temporaneamente compromessa. Quindi Redis Sentinel è *AP*.

# DynamoDB
È il DB sviluppato interamente da Amazon ed è in hosting al 100%, non si può installare localmente. 
È progettato per offrire prestazioni ad alta velocità, scalabilità automatica e affidabilità elevata. Ecco alcune caratteristiche chiave di DynamoDB:

1. **Modello di Dati:** DynamoDB è basato su un modello di dati NoSQL chiave-valore e può essere utilizzato sia come database di chiave-valore che come database di documenti. Ciò significa che puoi archiviare e recuperare dati utilizzando una chiave primaria.
    
2. **Scalabilità Automatica:** DynamoDB offre una scalabilità automatica, il che significa che può gestire aumenti o diminuzioni di traffico senza richiedere interventi manuali. Puoi iniziare con piccole quantità di dati e aumentare le risorse di calcolo o la capacità di archiviazione in modo dinamico al crescere delle esigenze dell'applicazione.
    
3. **Archiviazione a Basso Livello:** DynamoDB fornisce un'archiviazione a basso livello distribuita su più server. Questo contribuisce a garantire prestazioni elevate e ridondanza dei dati.
    
4. **Tolleranza ai Guasti:** DynamoDB è progettato per essere altamente disponibile e tollerante ai guasti. I dati sono replicati su più zone di disponibilità all'interno di una regione AWS, garantendo la resilienza del sistema in caso di guasto di un'intera zona.
    
5. **Modelli di Consistenza:** DynamoDB offre diverse opzioni di modelli di consistenza per adattarsi alle esigenze dell'applicazione. Puoi scegliere tra consistenza forte o consistenza eventualmente coerente a seconda dei requisiti di lettura e scrittura.
    
6. **Gestione del Traffico:** DynamoDB offre funzionalità per la gestione del traffico, come il controllo della velocità delle richieste tramite provisioned throughput o il nuovo sistema di pagamento basato sulle richieste, che addebita solo le richieste effettive eseguite.
    
7. **Monitoraggio e Logging:** DynamoDB fornisce strumenti di monitoraggio, logging e integrazione con AWS CloudWatch per consentire una gestione efficiente delle risorse e delle prestazioni.
    

DynamoDB è ampiamente utilizzato per applicazioni che richiedono accesso rapido e scalabile ai dati, come app Web, app mobili, giochi, Internet delle cose (IoT) e molto altro ancora. La sua flessibilità e le caratteristiche di gestione automatica lo rendono una scelta popolare per le applicazioni che richiedono prestazioni elevate e scalabilità senza la necessità di gestire manualmente l'infrastruttura del database.

# Neo4j
Neo4j è un sistema di gestione di database di grafi (Graph Database Management System o GDBMS) basato su un modello di dati a grafo, che rappresenta le entità e le relazioni tra di esse come nodi e archi di un grafo. La sua architettura è orientata alla gestione efficiente di dati altamente connessi, rendendolo particolarmente adatto per rappresentare e interrogare reti complesse.

Ecco alcuni concetti e caratteristiche chiave di Neo4j in termini accademici:

1. **Modello di Dati a Grafo:** Neo4j adotta un modello di dati a grafo, dove l'unità fondamentale è il nodo, che rappresenta un'entità, e l'arco, che rappresenta una relazione tra le entità. Questo modello offre una rappresentazione intuitiva e efficiente per dati fortemente connessi.
    
2. **Linguaggio di Query Cypher:** Neo4j utilizza il linguaggio di query Cypher, appositamente progettato per esprimere interrogazioni in grafi. Cypher semplifica la rappresentazione di pattern di grafo, rendendo le query più leggibili e intuitive.
    
3. **Transazioni ACID:** Neo4j supporta transazioni ACID (Atomicità, Consistenza, Isolamento, Durabilità), garantendo che le operazioni di scrittura siano atomiche e mantenendo la coerenza dei dati.
    
4. **Indicizzazione e Ottimizzazione delle Query:** Neo4j utilizza indici per accelerare la ricerca di nodi in base a determinate proprietà. Le query vengono ottimizzate per sfruttare al massimo le strutture a grafo e garantire prestazioni efficienti.
    
5. **API e Driver:** Neo4j fornisce API e driver per una varietà di linguaggi di programmazione, facilitando l'integrazione con applicazioni esterne. Queste interfacce consentono agli sviluppatori di interagire con il database utilizzando il linguaggio di programmazione di loro scelta.
    
6. **Neo4j Browser:** Neo4j offre un'applicazione web chiamata Neo4j Browser che consente agli utenti di esplorare e interrogare il database in modo interattivo, offrendo una visualizzazione grafica dei dati.
    
7. **Community e Supporto:** Neo4j è supportato da una vibrante comunità di utenti e sviluppatori. Inoltre, ci sono opzioni per ottenere supporto commerciale da Neo4j, che include consulenza, formazione e assistenza tecnica.
    
8. **Sicurezza:** Neo4j implementa meccanismi di sicurezza per garantire l'accesso autorizzato ai dati, consentendo la definizione di ruoli e permessi.
    

Neo4j è ampiamente utilizzato in scenari in cui le relazioni tra i dati sono centrali, come reti sociali, analisi delle reti, gestione della conoscenza e applicazioni che richiedono una comprensione approfondita delle connessioni tra entità. La sua struttura di grafo offre un modo potente e intuitivo per modellare e interrogare dati complessi e altamente relazionati.
