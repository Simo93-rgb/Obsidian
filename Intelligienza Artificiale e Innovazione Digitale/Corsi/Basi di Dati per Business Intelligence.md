![[Pasted image 20230512185005.png]]
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
![[Schermata 2023-10-02 alle 14.01.55.png]]
Possiamo distinguere due parti, un po' come già detto in precedenza, ossia una parte tecnologica e una informativa. La prima è la parte della cattura dei dati e soprattutto la parte **ETL** (Extraction Transformation Load). 

# Basi di Dati e Sistemi informativi
Una base di dati è un insieme organizzato di dati, non necessariamente in forma automatizzata. 
Prima di parlare di sistemi informativi credo sia carino vedere una immagine che rappresenta la situazione
![[Schermata 2023-10-02 alle 14.12.57.png]]Un sistema informativo è:
+ Componente di una organizzazione che gestisce le informazioni di interesse (cioé utilizzate per il perseguimento degli scopi dell’organizzazione) 
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
Qui è stata poi fatta una digressione parlando di tassonomie e ontologie in quanto ci sta aver presente che i dati fra loro possono avere delle relazioni che vanno rappresentate. Copio e incollo dalla mia tesi triennale:

>*Prima di parlare di cosa sia una tassonomia, si vuole introdurre il concetto di ontologia: essa è un modello formale e concettuale che descrive le entità, le proprietà, le relazioni e le regole all’interno di un dominio di conoscenza. Le ontologie possono rappresentare una gamma ampia di relazioni tra le entità, come relazioni non gerarchiche, attributi e vincoli. Le ontologie sono ampiamente utilizzate nel campo dell’intelligenza artificiale, in particolare nell’ambito della rappresentazione della conoscenza e del web semantico, per modellare la conoscenza in modo esplicito e consentire il ragionamento automatico. 
>
>In questo lavoro però è stata creata una tassonomia, ossia dei sistemi che si concentrano principalmente sulla classificazione gerarchica delle entità, non andando a precisare come le ontologie anche eventuali relazioni fra entità. Una tassonomia si può vedere come un concetto derivato e limitato di ontologia, limitato appunto alle sole relazioni gerarchiche.*

## DBMS (DataBase Management System)
Sistema che gestisce collezioni di dati, grandi persistenti e condivisi, garantendo:
+ Privatezza: si possono definire meccanismi di autorizzazione
+ Affidabilità: resistenza a malfunzionamenti hardware e software
+ Efficienza: dare risposte alle query in tempo utile
+ Efficacia
Ci sono tanti DBMS (PostgreSQL, Oracle) e la loro scelta dipende come sempre da prezzo, features, prestazioni generali...  
Spesso gestiscono collezioni di dati enormi con l'unico limite dato dallo storage disponibile. 
Ad esempio gli esperimenti di genetica o genomica producono centinai di gigabyte per volta con i mini-wafer e pensare di lasciare "ad un foglio excel" quei dati è impensabile.

## Organizzazioni dei dati
Partiamo subito con introdurre due grossi problemi ossia ridondanza e incoerenza. Perché esistono? Perché senza controlli specifici da parte di un sistema formale e ben strutturato si può avere l'inserimento di record con errore umano.
Con *ridondanza* si intende la ripetizione dei dati mentre con *incoerenza* s'intende che due versioni dello stesso dato non coincidono.
Usare la stessa base di dati per servizi differenti è il modo con cui risolvere entrambi problemi, soprattutto quello dell'incoerenza.



