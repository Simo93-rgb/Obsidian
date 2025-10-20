
```mermaid
flowchart TD
    A -->|x/100| C
    A -->|45| D
    C -->|45| B
    D -->|x/100| B
```


```mermaid
graph LR
    START -->|x/100| C
    START -->|45| D
    C -->|45| END
    D -->|x/100| END
```

```mermaid
graph LR
    A -->|x/100| C
    A -->|45| D
    C -->|45| B
    D -->|x/100| B
    C -->|0| D
```


```mermaid
graph LR
    START -->|x/100| C
    START -->|45| D
    C -->|45| END
    D -->|x/1000| END
```

```mermaid
graph LR
    A -->|x/100| C
    A -->|45| D
    C -->|45| B
    D -->|x/100| B
    C -->|1000| D
```
