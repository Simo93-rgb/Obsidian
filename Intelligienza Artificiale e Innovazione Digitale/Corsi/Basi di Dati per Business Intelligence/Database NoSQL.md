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

