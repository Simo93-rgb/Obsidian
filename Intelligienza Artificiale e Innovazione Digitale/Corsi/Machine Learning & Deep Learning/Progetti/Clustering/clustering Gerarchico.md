# Approccio Iniziale
Siccome ho scelto un [dataset molto grande]([Anuran Calls (MFCCs) - UCI Machine Learning Repository](https://archive.ics.uci.edu/dataset/406/anuran+calls+mfccs)) ho deciso di approcciare con la tecnica  *Two Step Clustering*. Quindi, al primo passo utilizzo il k-means per ridurre il dataset ad una dimensione scarsa e successivamente agglomero con il clustering gerarchico. 

## Two Step Clustering
Siccome il k-means è molto performante conviene usarlo come primo step per la riduzione della dimensione del dataset, ciò che otterremo in risultato si definisce come un insieme di ***super osservazioni***. 

La tecnica di clustering in due fasi, applicando prima k-means e poi il clustering gerarchico, si rivela particolarmente efficace per il dataset Anuran Calls (MFCCs). Questo approccio offre diversi vantaggi:

* Riduce significativamente la dimensionalità del dataset da 7195 a circa 10 cluster, creando una rappresentazione più compatta dei dati.
* Migliora l'efficienza computazionale, rendendo il successivo clustering gerarchico più gestibile.
* Permette di catturare sia le macro-strutture (attraverso k-means) che le relazioni più sottili (mediante clustering gerarchico) nei dati acustici degli anuri.
* Facilita la gestione del rumore nei dati, con i centroidi k-means che fungono da "super-osservazioni" rappresentative.

Questa strategia si adatta bene alla complessità del dataset, consentendo un'analisi che bilancia generalizzazione e dettaglio, cruciale per esplorare la struttura gerarchica naturale presente nelle chiamate degli anuri.