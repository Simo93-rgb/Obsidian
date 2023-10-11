Il **CBR** è una metodologia per risolvere problemi nuovi adattando le soluzioni di problemi simili precedenti. 
![[CBRSchema.png]]
Ci sono vari esempi di CBR e vediamone alcuni.

#### Esempi di CBR
- **Classificazione** di un paziente clinico in base alla sintomatologia/esami
- **Soluzione Compilata** ossia la spiegazione del problema $x$ è derivabile da quello già visto col problema $y$
- **Valutazione del Valore** ossia verificare che il valore di qualcosa sia corretto osservando l'ambiente
- **Giustificare coi Precedenti** ossia risolvere il problema nello stesso modo in cui si è risolto un precedente. Un po' come accade nella legislatura anglosassone. 
- **Valutazione delle Opzioni** ossia valutare le possibili conseguenze in base a cosa è successo nei casi simili. "*Se attaccassimo Cuba/Russia otterremo una situazione come Pearl Harbor*"

## Architettura R4
![[ArchR4CBR2.png]]
1. **Problem**: descrivo il problema da risolvere con una *tupla* di attributi. Il problema è il punto di partenza dello schema
2. **Retrieve**: passo di recupero dai *previous cases* per recuperare i casi più simili che sono presenti in memoria. 
	1. **Retrieved Case**: ho recuperato un caso simile
		1. **Solved Case**: ho una soluzione proposta
	2. **New Case**: il mio problema non è simile a nessun caso in memoria
3. **Revise**: avendo la *domain knowledge* posso fare questo passo. Ad esempio provo a dare un antibiotico differente ma questo adattamento ha bisogno di essere costruito con conoscenza del dominio.
	1. Se la soluzione è adoperabile allora confermo la soluzione, altrimenti fallisco
4. **Retain**: il caso esaminato lo voglio aggiungere in memoria per ampliare la KB? 
	1. Caso fallito: interessante inserirlo così un esperto del dominio inserisce la soluzione e lui per la prossima volta saprà qualcosa in più.
	2. Retrived Case: non ha senso aggiungere perché già lo avevo in memoria già molto simile e diventa uno spreco di memoria oltre che, molto peggio, i sistemi vanno in tilt se ci sono troppi dati.
Curiosità, il primo schema è del 1993! 

