Perché farlo? Quasi filosofica la domanda ma senza addentrarsi in argomenti profondi possiamo dire che serve per organizzare la struttura aziendale nella gestione opportuna dei dati sia per sicurezza sia per aumento di produttività. Ci sono spesso problemi legati a come l'azienda salvava i dati precedentemente oppure un'aspettativa troppo elevata da parte dell'utente.
Ci sono più approcci per realizzare un sistema

## Approccio Top-Down  
Analizza i bisogni globali dell’intera azienda e pianifica lo sviluppo del DW per poi progettarlo e realizzarlo nella sua interezza.
Con questo sistema creiamo un DW consistente e ben integrato ma ovviamente ha il rovescio della medaglia: costi realizzazione elevati, analisi e riconciliazione in contemporanea, impossibile accontentare tutti i reparti a priori, prime consegne molto distanti dall'inizio del progetto. 

## Approccio Bottom-Up
SI approccia la costruzione del DW in modo incrementale e quindi molti dei contro del precedente approccio vengono risolte con un grosso contro che è la visione parziale del dominio di interesse poiché lavoro su un reparto alla volta dell'azienda. Soprattutto è difficile lavorare mantenendo sempre il focus sul fatto che alla fine i datamart creati fra i vari reparti devono poi essere integrati.
![[Business Intelligence - approccio bottom-up.png]]

## Ciclo di Sviluppo
1. Definizione obbiettivi e pianificazione
	1. ![[Business Intelligence - definizione obbiettivi.png|300]]
2. Progettazione Infrastruttura
	1. ![[Business Intelligence - progettazione struttura.png|300]]
3. Progettazione e sviluppo dei datamart
	1. ![[Business Intelligence - Progettazione e sviluppo dei datamart.png|300]]
Vale questo schema con il focus che il punto 1 e il punto 2 sono definiti di solito una volta sola e all'inizio.
![[Business Intelligence - schema pianificazione.png]]

### Progettazione e Sviluppo dei Data Mart
![[Business Intelligence - Progettazione e Sviluppo dei Data Mart.png]]

# Progettazione Concettuale
Non ci sono formalismi o convenzioni standard anche se, per i sistemi con architettura ROLAP esiste una traduzione diretta col modello ER che si usa per i DB. Ma di base il modello ER non è uno standard. 

### Dimensional Fact Model
Il DFM è un modello concettuale grafico per data mart, pensato per supportare efficacemente il progetto concettuale, creare un ambiente su cui formulare in modo intuitivo le interrogazioni dell’utente e permettere il dialogo tra progettista e utente finale per raffinare le specifiche dei requisiti. Importante anche creare una piattaforma stabile da cui partire per il progetto logico (indipendentemente dal modello logico target) e restituire una documentazione a posteriori espressiva e non ambigua.
I costrutti di base sono:
- Fatto: concetto di interesse per il processo decisionale
- Misura: misure numeriche associate all'istanza del fatto.
- Dimensione: sempre discretizzato è una proprietà con dominio finito di un fatto
![[Business Intelligence - DFM esempio Vendita.png]]
La traduzione diretta come modello ER è intuitiva e fa diventare così il modello DFM
![[Business Intelligence - traduzione DFM to ER.png]]

# Integrare mancanze
cose tipo le operazioni rolap etc...

## Misure Derivate
Sono quelle che ottengo quando combino delle dimensioni. In alcuni casi si combinano molte dimensioni e il percorso per arrivarci non prevede scambi di posizioni, si consideri che il prodotto delle somme non è uguale alla somma dei prodotti. Quindi, passando attraverso vari livelli di aggregazione ha senso creare delle viste intermedie. Questi passaggi intermedi creano delle *misure di supporto*. 

# Progettazione Logica del DW
![[Business Intelligence - confronto DB vs DW con progettazione concettuale e logica.png]]
