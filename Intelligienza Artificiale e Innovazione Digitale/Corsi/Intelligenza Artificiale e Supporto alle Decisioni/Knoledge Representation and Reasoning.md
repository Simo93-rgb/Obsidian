Sono sistemi basati su conoscenza e che quindi usano questa conoscenza per impostare ragionamenti e risolvere i problemi. Si parla spesso di **inferenza** e si riferisce al ragionamento della conoscenza. Ad esempio c'è la statistica descrittiva (plot, grafici, diagrammi...) e la statistica inferenziale ossia ragionamento statistico per stime e predizioni.
L'idea è di avere un sistema molto specializzato, ossia un sistema esperto, nel quale ho bisogno di rappresentare la conoscenza per ottenere risultati migliori. Questo crea due domande:
- come rappresento la conoscenza?
- come la uso? (ragionamento/inferenza)
Per anni l'utilizzo della logica si è pensato essere il modo migliore di rappresentare la conoscenza ma, spoiler, NO! Si sono pure inventati le logiche non monotone per ammettere eccezioni e rappresentare meglio il mondo ma alla fine era impossibile star dietro alla complessità di questa logica e comunque la statistica era migliore sotto tutti i punti di vista.  

# Knowledge Base Systems
![[Knoledge Representation and Reasoning - KnowledgeBaseSystem.png]]
Componenti:
- KB: ossia la base di conoscenza
- Motore Inferenziale: usa la KB per fare ragionamenti per rispondere alle query
- Learner: modulo di apprendimento che se presente modifica la KB aggiungendo roba utile e modificando o eliminando quella inutile o errata.
