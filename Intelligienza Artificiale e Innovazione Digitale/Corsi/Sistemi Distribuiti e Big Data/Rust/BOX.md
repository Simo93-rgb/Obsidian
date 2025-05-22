In Rust, `Box` è una smart pointer che consente di allocare memoria sul heap. È utile quando si desidera possedere un valore che non si conosce la dimensione in fase di compilazione o quando si desidera trasferire la proprietà di un dato valore a un altro proprietario in modo efficiente. Nel contesto del pattern State, `Box<dyn Stato>` viene utilizzato per ottenere il polimorfismo di runtime e per permettere il passaggio di oggetti che implementano il trait `Stato`.

### Come Funziona `Box`

Ecco una spiegazione dettagliata su come funziona `Box` e perché è utile nel nostro esempio:

#### 1. Allocazione su Heap

Rust, per default, alloca variabili locali sullo stack, che è veloce ma ha una dimensione limitata. Quando usi `Box`, il valore viene allocato sul heap, che ha una dimensione maggiore, ma l'accesso è un po' più lento. Questo è utile per valori di dimensioni non note a tempo di compilazione o per grandi strutture dati.

#### 2. Polimorfismo e Trait Objects

In Rust, i trait possono essere usati per definire comportamenti comuni. Tuttavia, non puoi avere un campo di una struttura direttamente di tipo trait. Devi usare un trait object per ottenere il polimorfismo di runtime. Un trait object è un puntatore che punta a un'istanza di un tipo che implementa un dato trait. `Box<dyn Stato>` è un trait object che punta a qualsiasi tipo che implementa il trait `Stato`.

#### 3. Proprietà e Sicurezza

Il tipo `Box` possiede il valore che contiene. Quando il `Box` esce dallo scope, il valore viene deallocato. Questo aiuta a gestire la memoria in modo sicuro e impedisce problemi come doppia deallocazione o dangling pointers.