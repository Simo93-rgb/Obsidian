![[Intro DB e BI - CopertinaEsteticaSchemaBI.png]]
# Introduzione Business Intelligence
Alcune definizioni:
+ An umbrella term that encompasses tools, architectures, databases, data warehouses, performance management, methodologies, and so forth, all of which are integrated into a unified software suite.” (Turban et al. (2007).
+ It is an architecture and a collection of integrated operational as well as decision-support applications and databases that provide the business community easy access to business data.“ (Moss and Atre (2003).
+ Il focus punta sull’analisi di grandi quantità di dati che vengono raccolti, e poi organizzati per questo scopo.

Quindi, una suit software facile da leggere e da utilizzare alla comunità dei business man, ossia gente senza esperienza e competenza informatica. Un esempio è WebDesk!!! 

### Finalità BI
**Business Performance Measurement Systems**: stupida ma percorribile con sistemi standard
**Decision Support System**: richiede della IA per poter funzionare
Quindi i sistemi di BI hanno lo scopo di:
+ mettere le informazioni a disposizione dei decisori aziendali in modo efficiente, dinamico e profilato
	+ Efficiente -> dipende dalle scelte implementative
	+ Dinamico -> devo poter aggiornare la vista della mia interfaccia in base ai miei bisogni senza difficoltà
	+ Profilato -> Personalizzazione in base a chi utilizza lo strumento
+ fornire strumenti di analisi potenti e dinamici per creare facilmente elaborazioni (filtri e formule) e di “navigare nei dati” seguendo il ragionamento analitico, senza prevedere un’elevata cultura informatica
+ automatizzare produzione e distribuzione di reportistica aziendale, ritagliata per i diversi destinatari
### Architettura super semplificata di un DW
![[Intro DB e BI - ArchSemplificataDataWarehouse.png]]
Possiamo distinguere due parti, un po' come già detto in precedenza, ossia una parte tecnologica e una informativa. La prima è la parte della cattura dei dati e soprattutto la parte **ETL** (Extraction Transformation Load). 

# Basi di Dati e Sistemi informativi
Una base di dati è un insieme organizzato di dati, non necessariamente in forma automatizzata. 
Prima di parlare di sistemi informativi credo sia carino vedere una immagine che rappresenta la situazione

>[!todo] Sistema Azienda
>>[!success] Sistema Organizzativo
>>>[!failure] Sistema Informativo
>>>>[!warning] Sistema Informatico

Un sistema informativo è:
+ Componente di una organizzazione che gestisce le informazioni di interesse (cioè utilizzate per il perseguimento degli scopi dell’organizzazione) 
+ Ogni organizzazione ha un sistema informativo, eventualmente non esplicitato nella struttura 
+ Il sistema informativo è di supporto ad altri sottosistemi, e va quindi studiato nel contesto in cui è inserito
+ indipendente da qualsiasi automatizzazione
	+ ad esempio il censimento è un sistema di gestione dei dati non automatizzato

Parlando di sistema informatico si può dire che un sistema Informatico è una porzione automatizzata del sistema informativo. Nelle aziende moderne sistema informativo e sistema informatico praticamente coincidono.

## Gestione Informazioni
Sicuramente eterogenea sia nei mezzi che nei supporti in quanto coesistono idee formali, linguaggio naturale, disegni e grafici che stanno su chiavette usb, carta e perché no, mente umana!
Attenzione che dato e informazione NON sono sinonimi e quindi val la pena dare una definizione formale:
**Dato**: ciò che è immediatamente presente alla conoscenza, prima di ogni elaborazione; (in informatica) elementi di informazione costituiti da simboli che debbono essere elaborati
**Informazione**: notizia, dato o elemento che consente di avere conoscenza più o meno esatta di fatti, situazioni, modi di essere.
### Perché i dati?
I dati costituiscono spesso una risorsa strategica, perché più stabili nel tempo di altre componenti (processi, tecnologie, ruoli umani); ad esempio i dati delle banche o delle anagrafi.
Qui è stata poi fatta una digressione parlando di tassonomie e ontologie in quanto ci sta aver presente che i dati fra loro possono avere delle relazioni che vanno rappresentate. Copio e incollo dalla mia tesi della triennale:

>*Prima di parlare di cosa sia una tassonomia, si vuole introdurre il concetto di ontologia: essa è un modello formale e concettuale che descrive le entità, le proprietà, le relazioni e le regole all’interno di un dominio di conoscenza. Le ontologie possono rappresentare una gamma ampia di relazioni tra le entità, come relazioni non gerarchiche, attributi e vincoli. Le ontologie sono ampiamente utilizzate nel campo dell’intelligenza artificiale, in particolare nell’ambito della rappresentazione della conoscenza e del web semantico, per modellare la conoscenza in modo esplicito e consentire il ragionamento automatico. 
>
>In questo lavoro però è stata creata una tassonomia, ossia dei sistemi che si concentrano principalmente sulla classificazione gerarchica delle entità, non andando a precisare come le ontologie anche eventuali relazioni fra entità. Una tassonomia si può vedere come un concetto derivato e limitato di ontologia, limitato appunto alle sole relazioni gerarchiche.*

## DBMS (DataBase Management System)
Sistema che gestisce collezioni di dati, grandi persistenti e condivisi, garantendo:
+ *Privatezza*: si possono definire meccanismi di autorizzazione
+ *Affidabilità*: resistenza a malfunzionamenti hardware e software
+ *Efficienza*: dare risposte alle query in tempo utile, utilizzare le risorse nel modo migliore possibile.
+ *Efficacia*: rendere produttive le attività dell'utilizzatore
Ci sono tanti DBMS (PostgreSQL, Oracle) e la loro scelta dipende come sempre da prezzo, features, prestazioni generali...  
Spesso gestiscono collezioni di dati enormi con l'unico limite dato dallo storage disponibile. 
Ad esempio gli esperimenti di genetica o genomica producono centinai di gigabyte per volta con i mini-wafer e pensare di lasciare "ad un foglio excel" quei dati è impensabile.

## Organizzazioni dei dati
Partiamo subito con introdurre due grossi problemi ossia ridondanza e incoerenza. Perché esistono? Perché senza controlli specifici da parte di un sistema formale e ben strutturato si può avere l'inserimento di record con errore umano.
Con *ridondanza* si intende la ripetizione dei dati mentre con *incoerenza* s'intende che due versioni dello stesso dato non coincidono.
Usare la stessa base di dati per servizi differenti è il modo con cui risolvere entrambi problemi, soprattutto quello dell'incoerenza.
Per mantenere l'affidabilità del DBMS lato coerenza bisogna definire l'***operazione di transazione***ossia modificare i dati. La transazione è un insieme di operazioni atomiche ed è corretta anche in fase di concorrenza con effetti definitivi. Immaginando le operazioni su un conto corrente (cerotti vibes xD) risulta facile comprendere questi concetti. 

**DBMS vs File System**
Salvare le cose su un FS significa avere il classico albero di cartelle e file con scarsissime funzionalità. Oramai ogni software commerciale ha abbandonato l'idea di usare il FS e ricorrono ad altre soluzioni tecniche.

## Modello dei dati 
Insieme di costrutti utilizzati per organizzare i dati di interesse e descriverne la dinamica. Componente fondamentale: meccanismi di strutturazione (o costruttori di tipo).
Come nei linguaggi di programmazione esistono meccanismi che permettono di definire nuovi tipi, così ogni modello dei dati prevede alcuni costruttori. Esempio: il modello relazionale prevede il costruttore relazione, che permette di definire insiemi di record omogenei

#### Schema e Istanza
Lo schema è sostanzialmente invariante nel tempo, descrive la struttura della tabella, mentre le istanze sono i valori, sono i record delle tabelle che popolano la base di dati. Ad esempio, lo schema è l'intestazione della tabella e l'istanza le sue righe. Spesso si parla di aspetti intensionali riferendosi allo schema delle cose mentre l'aspetto estensionale è un riferimento ai dati ossia al contenuto dello schema.

**Insegmanenti**

|**nome** | **insegnamenti** | **orario** | 
|:-----:|:-------------:|:------:|
| Giorgio Leonardi | BI | LUN 2-10| 
| Pippo Rossi | SO | MAI 11-9 |

### Modello Logico
Adottati nei DBMS esistenti per l’organizzazione dei dati – utilizzati dai programmi – indipendenti dalle strutture fisiche 
Esempi: relazionale, reticolare, gerarchico, a oggetti, basato su XML.
![[Intro DB e BI - ModelloLogico.png]]
### Modello Concettuale
Usato in fase di progettazione è un modo di rappresentare le cose a livello umano. Il più diffuso è il modello entity-relationship.
![[Intro DB e BI - ModelloConcettuale.png]]
Quindi prendo una realtà e fisso le idee su uno schema ad alto livello con la quale poi potrò costruire la mia base di dati. Questo lo si riesce a tradurre facilmente in un modello logico.

## Architetture Sistemi DBMS

![[Intro DB e BI - arch a 3 livelli.png]]
<center>Arch. ANSI/SPARC standard a tre livelli</center>

Lo **schema interno** (o fisico) è la rappresentazione dello schema logico per mezzo di strutture di memorizzazione (file; ad esempio, record con puntatori, ordinati in un certo modo)
Lo **schema logico** è la descrizione della base di dati nel modello logico (ad esempio, la struttura della tabella). Questo può essere riorganizzato in sottoinsiemi chiamati **schemi esterni**
che sono una rappresentazione parziale della base di dati in modo che gli utenti abbiano viste differenti. 

## Indipendenza dei Dati
Esistono in due forme, ossia indipendenza fisica ed indipendenza logica. 

### Indipendenza Fisica
il livello logico e quello esterno sono indipendenti da quello fisico. 
Una relazione è utilizzata nello stesso modo qualunque sia la sua realizzazione fisica
La realizzazione fisica può cambiare senza che debbano essere modificati i programmi

### Indipendenza Logica
Il livello esterno è indipendente da quello logico, quindi le viste sono indipendenti infatti modifiche o aggiunte alle viste non alterano lo schema logico. Alcune modifiche alloschema logico sono trasparenti allo schema esterno.

## Linguaggi per Database

Un altro contributo all’efficacia: disponibilità di vari linguaggi e interfacce
+ linguaggi testuali interattivi (SQL - Structured Query Lang.)  
+ comandi (SQL)  immersi in un linguaggio ospite (Python, Java, C ...)  
+ comandi (SQL) immersi in un linguaggio ad hoc, con anche altre funzionalità (p.es. per grafici o stampe strutturate) 
+ con interfacce amichevoli (senza linguaggio testuale)

Breve esempio

|Corso|Docente|Aula|
|:----:|:----:|:----:|
|Database|Rossi|DS3|
|Sistemi|Neri|N3|

|Nome|Edificio|Piano|
|:----:|:----:|:----:|
|DS1|OMI|Terra|
|N3|OMI|Terra|
|G|Pincherle|Primo|

Trovare i corsi in aule al primo piano --> 
<code>SELECT corso, aula, piano 
FROM Aule, Corsi 
WHERE Piano = "Terra" AND Aule.Nome = Corsi.Aula</code>

### DDL vs DML
Data Definition Lang. è la parte di linguaggio che definisce le strutture del database e delle tabelle. 
Data Manipulation Lang. è la parte che gestisce i dati nel DB, quindi interrogazione e aggiornamento.

## Attori
Ci sono i **progettisti del DBMS** cre sviluppano tecnologie, i **progettisti del DB** che mettono in piedi la base di dati, ci sono i **progettisti e programmatori delle applicazioni** che sviluppano i SW che gli utenti utilizzeranno.  Gli **utenti** sono di due tipi:
+ Finali, ossia il normale utente per cui la applicazione è stata creata
+ Casuali, ossia un eventuale tecnico che utilizza l'applicazione in modo in usuale

### Transazioni per l'utente (spoiler nameclash)
Sono realizzate in linguaggio ospite e degli esempi sono i versamenti allo sportello ATM oppure l'emissione di un certificato anagrafico. Quindi:
+ Per l'utente: – programma a disposizione, da eseguire per realizzare una funzione di interesse
+ Per il sistema: – sequenza indivisibile di operazioni (cfr. affidabilità)


## DBMS Server
![[Intro DB e BI - DBMS.png]]

### PRO
+ dati come risorsa comune, base di dati come modello della realtà 
+ gestione centralizzata con possibilità di standardizzazione ed “economia di scala” 
+ disponibilità di servizi integrati 
+ riduzione di ridondanze e inconsistenze 
+ indipendenza dei dati (favorisce lo sviluppo e la manutenzione delle applicazioni)

### Contro
+ costo dei prodotti e della transizione verso di essi 
+ non scorporabilità delle funzionalità (con riduzione di efficienza)