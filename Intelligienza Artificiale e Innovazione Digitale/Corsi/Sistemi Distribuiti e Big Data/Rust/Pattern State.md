Il pattern State è un design pattern comportamentale utilizzato in ingegneria del software per permettere a un oggetto di modificare il proprio comportamento quando il suo stato interno cambia. Questo pattern è particolarmente utile per rappresentare e gestire oggetti che possono trovarsi in diversi stati, ognuno dei quali richiede un comportamento diverso.
Questo pattern è utile per evitare grandi blocchi di istruzioni `if` o `switch` e per mantenere il codice modulare e facilmente estendibile.

## Concetti Principali del Pattern State

1. **Context (Contesto)**: È la classe che mantiene un riferimento a un'istanza di una sottoclasse di `State`. Questo riferimento può essere usato per delegare il comportamento dipendente dallo stato alle istanze delle classi concrete di `State`.
    
2. **State (Stato)**: È un'interfaccia o una classe astratta che definisce i metodi comuni che devono essere implementati da tutti gli stati concreti. Questi metodi rappresentano il comportamento che varia a seconda dello stato.
    
3. **Concrete States (Stati Concreti)**: Sono le implementazioni specifiche dell'interfaccia `State`. Ogni classe concreta implementa il comportamento associato a uno specifico stato del `Context`.
    

### Vantaggi del Pattern State

- **Manutenzione del Codice**: Permette di aggiungere nuovi stati e comportamenti senza modificare il `Context` o gli altri stati concreti.
- **Chiarezza e Pulizia**: Separa il codice relativo ai diversi comportamenti, rendendo il codice più leggibile e gestibile.
- **Flessibilità**: Consente agli oggetti di cambiare il loro comportamento a runtime in modo flessibile.

## Esempio

Immaginiamo di avere un oggetto `Document` che può trovarsi in tre stati: `Draft`, `Moderation`, e `Published`. A seconda dello stato in cui si trova, il metodo `publish` avrà un comportamento diverso.

#### Context
```java
public class Document {
    private State currentState;

    public Document() {
        this.currentState = new DraftState();
    }

    public void setState(State state) {
        this.currentState = state;
    }

    public void publish() {
        currentState.publish(this);
    }

    public void moderate() {
        currentState.moderate(this);
    }

    // Altri metodi che delegano ai metodi di stato...
}

```

#### State
```java
public interface State {
    void publish(Document doc);
    void moderate(Document doc);
    // Altri metodi...
}
```

#### Concrete State
```java
public class DraftState implements State {
    @Override
    public void publish(Document doc) {
        // Transizione a Moderation
        doc.setState(new ModerationState());
    }

    @Override
    public void moderate(Document doc) {
        // Non fa niente, perché un draft non può essere moderato
    }
}

public class ModerationState implements State {
    @Override
    public void publish(Document doc) {
        // Transizione a Published
        doc.setState(new PublishedState());
    }

    @Override
    public void moderate(Document doc) {
        // Azione di moderazione
    }
}

public class PublishedState implements State {
    @Override
    public void publish(Document doc) {
        // Non fa niente, perché un documento pubblicato non può essere ripubblicato
    }

    @Override
    public void moderate(Document doc) {
        // Non fa niente, perché un documento pubblicato non può essere moderato
    }
}
```


### Diagramma UML

Un diagramma UML per il pattern State:

- Una classe `Context` che mantiene un riferimento a `State`.
- Un'interfaccia `State` con i metodi che variano.
- Diverse classi concrete che implementano `State`.

```scss
+------------+      +-------------+
|  Context   |<---->|    State    |
+------------+      +-------------+
| -state     |      | +publish()  |
| +setState()|      | +moderate() |
| +publish() |      +-------------+
| +moderate()|            ^
+------------+            |
                          |
      +-------------------+-------------------+
      |                   |                   |
+-------------+    +---------------+    +--------------+
| DraftState  |    |ModerationState|    |PublishedState|
+-------------+    +---------------+    +--------------+
| +publish()  |    | +publish()    |    | +publish()   |
| +moderate() |    | +moderate()   |    | +moderate()  |
+-------------+    +---------------+    +--------------+

```

