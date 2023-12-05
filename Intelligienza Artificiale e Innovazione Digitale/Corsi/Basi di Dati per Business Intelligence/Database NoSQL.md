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

# Teorema di CAP
Applicabile ai soli sistemi distribuiti, ci dice che fra tre grosse caratteristiche volute se ne possono avere solo due:
1. **C**onsistency $\rightarrow$ tutti i nodi vedono lo stesso dato allo stesso momento
2. **A**vailaility $\rightarrow$ ogni operazione deve sempre avere una risposta
3. **P**artition Tolerance $\rightarrow$ tollerante alla eliminazione di un nodo del sistema distribuito, di una aggiunta di un dato o alla non disponibilità di un componente.

![[Assets/Multimedia/Database NoSQL - coppie del CAP.png]]

# Principali DBMS
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


