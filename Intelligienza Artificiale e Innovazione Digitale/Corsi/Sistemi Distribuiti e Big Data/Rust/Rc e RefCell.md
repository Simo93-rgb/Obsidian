In Rust, `Rc` e `RefCell` sono due tipi usati per gestire la proprietà e la mutabilità degli oggetti in modo sicuro e flessibile. Questi tipi sono particolarmente utili quando si lavora con strutture dati che richiedono condivisione e mutabilità, come le liste doppiamente collegate.

### `Rc` (Reference Counted)

`Rc` è una smart pointer che fornisce conteggio dei riferimenti per un valore. È utile quando si ha bisogno di condividere un valore tra più parti del programma senza preoccuparsi manualmente della gestione della memoria. Ecco alcune caratteristiche chiave di `Rc`:

- **Condivisione Immutabile**: `Rc` consente la condivisione di un valore tra più proprietari. Ogni volta che si clona un `Rc`, il conteggio dei riferimenti aumenta.
- **Gestione Automatica della Memoria**: Quando l'ultimo riferimento a un `Rc` viene eliminato, il valore a cui punta viene automaticamente deallocato.
- **Immutabilità**: I dati contenuti in un `Rc` sono immutabili per impostazione predefinita. Se hai bisogno di mutabilità, devi combinarlo con altre primitive come `RefCell`.

### `RefCell`

`RefCell` è una smart pointer che fornisce mutabilità interna tramite il pattern di prestito dinamico di Rust. Ecco alcune caratteristiche chiave di `RefCell`:

- **Mutabilità Interna**: `RefCell` consente di mutare i dati anche quando `RefCell` stesso è immutabile.
- **Controllo a Runtime**: A differenza del sistema di prestito di Rust, che verifica i prestiti a compile time, `RefCell` verifica i prestiti a runtime. Ciò significa che puoi mutare i dati contenuti in un `RefCell` a runtime, ma riceverai un panic se infrangi le regole di prestito.
- **Metodi di Prestito**:
    - `borrow()`: Ottiene un riferimento immutabile ai dati. Fallisce a runtime se esiste già un riferimento mutabile.
    - `borrow_mut()`: Ottiene un riferimento mutabile ai dati. Fallisce a runtime se esiste già un riferimento immutabile o un altro riferimento mutabile.

### Uso Combinato di `Rc` e `RefCell`

Quando `Rc` e `RefCell` vengono combinati, si ottiene una struttura dati che può essere condivisa tra più proprietari e modificata a runtime. Questa combinazione è particolarmente utile per strutture dati complesse come le liste doppiamente collegate.

Ecco un esempio:
```rust
use std::cell::RefCell;
use std::rc::Rc;

struct Node {
    value: i32,
    next: Option<Rc<RefCell<Node>>>,
}

fn main() {
    let node1 = Rc::new(RefCell::new(Node { value: 1, next: None }));
    let node2 = Rc::new(RefCell::new(Node { value: 2, next: Some(node1.clone()) }));

    node1.borrow_mut().next = Some(node2.clone());

    println!("Node 1 value: {}", node1.borrow().value);
    println!("Node 2 value: {}", node2.borrow().value);
}
```

In questo esempio:

- `Rc` consente a `node1` e `node2` di essere condivisi tra più parti del programma.
- `RefCell` consente a `node1` e `node2` di essere mutati anche se sono contenuti in un `Rc`.

Questo approccio risolve il problema della condivisione e della mutabilità delle strutture dati complesse in Rust.