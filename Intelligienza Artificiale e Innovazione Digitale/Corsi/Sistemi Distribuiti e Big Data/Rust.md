# Ownership

## Move e Copy


# Borrowing
Permette di sospendere in modo controllato la ownership

## Immutable
```Rust
fn is_nat ( b : & Box<i32 >) -> bool {
    (** b ) >= 0
}
fn es_borrow () -> (Box<i32> , bool) {
    let mut b = Box:: new (10);
    let temp = & b ;
    let y = is_nat ( temp );
    (b , y )
}
```
## Mutable
```Rust
fn swap(x:&mut i32, y:&mut i32){
    let z = *x;
    *x = *y;
    *y = z;
}

fn main(){
    let mut x = 1;
    let mut y = 2;
    swap(&mut x, mut y);
}
```

# Proprietà dei Riferimenti
Le proprietà dei riferimenti che devono valere perchè sia possibile una gestione automatica “sicura” della memoria sono le seguenti:
- le locazioni nell’heap sono “owned” da una sola variabile
- ci possono essere più riferimenti “borrowed” immutabili alla stessa locazione, ma
	- se esiste un riferimento borrowed mutabile allora non ci possono essere altri
	- riferimenti borrowed alla stessa locazione
- il lifetime di un riferimento borrowed deve essere contenuto in quello della variabile che ha l’ownership della locazione
- la variabile che ha l’ownership della locazione NON può essere usata fin quando il “lifetime” di tutti i suoi riferimenti “borrowed” non finiscono!
Queste proprietà ci permettono di dimostrare che non ci saranno mai riferimenti “dangling” e che non ci possono essere “date races”

# La Memoria
