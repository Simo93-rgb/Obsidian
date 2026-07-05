# Obsidian
In questo progetto si vuole rappresentare la conoscenza appresa durante il corso magistrale in IA utilizzando Obsidian in modo da avere un grafo della conoscenza. L'idea è di interconnettere tutte le note che hanno effettivamente una connessione anche nella realtà così da evitare ridondanze oppure da creare un sottografo della conoscenza per quel capitolo specifico. 

## Markdown in Obsidian
Giusto due parole sul linguaggio di markup e il software Obsidian, niente di tedioso. Alcuni standard del linguaggio MD potrebbero non essere compatibili in obsidian ma più probabilmente alcune formattazioni proprietarie del software non saranno disponibili al di fuori. 
Obsidian renderizza in tempo reale tutti i linguaggi di markup che gli si inserisce: HTML, LateX, MD. Molto comodo perchè studiare su una formula LateX non è il massimo. 
Attenzione, non valgono le iniezioni di iniezioni ossia non posso mettere del testo formattato HTML dentro LateX o viceversa. Posso però fare un elenco puntato in MD e ogni punto avere sia LateX sia HTML. 
Se stai pensando che ho già detto troppo hai ragione, tanto poi lo vivrai leggendo e scrivendo le note. 

# Come è fatto il Grafo? 

1. C'è una nota principale - [[Intelligienza Artifciale e Innovazione Digitale]] - che fa da "radice", questa contiene i link alle materie che verranno svolte
    1. Ogni link fa riferimento ad una pagina che sarà a sua volta "radice" del singolo corso
    2. La nota omonima al corso va formattata come meglio si ritiene in base alla natura del corso, in generale però considerare di mettere in prima pagina
        * chiacchiere introduttive del corso fatte alla prima lezione
        * un modo per suddividere in note il corso: nomi argomenti; titoli libro, numero lezione... In modo che ognuno di essi sia una nota
2. Ogni corso ha una sua cartella nella quale ci sono:
    * Le note relative agli argomenti svolti
    * Una cartella "Asset" che contiene tutto ciò che può servire al corso
    * la cartella Asset è bene suddividerla in sottocartelle per argomento: Multimedia, Libri...
        * I file multimediali, tipicamente immagini, per avere ordine e tracciabilità vanno rinominati con {nome_nota - nome_caratteristico_a_piacere.estensione}

## Esempio 
È un esempio scarno ma la pagina di [[Statistica Computazionale]] è fatta con un riferimento al libro e poi un elenco numerato fatto così:
1. [[Richiami di Probabilità]]
2. Seconda Lezione
	1. [[Variabili Casuali Notevoli]]
	2. [[TLC e LGN]]
	3. [[Formula di Bayes e Teorema Probabilità Totali]]
3. Terza Lezione
	1. [[Generazione Variabili Casuali]]
	2. [[Metodo dell'inversione]]
	3. [[Metodo del Rigetto]]
	4. [[Somme e Misture di Variabili Casuali]]
4. Quarta Lezione
	1. [[Richiami Stimatori e loro Proprietà]]
	2. [[Metodi Montecarlo]]

 
