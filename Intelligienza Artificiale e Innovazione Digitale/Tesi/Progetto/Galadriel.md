# Diagrammi di Flusso - Modalità Aggregata GALADRIEL XAI

## Analisi dei Punti Critici per Clinical Tokens

  

### 1. FLUSSO PRINCIPALE - Da Lancio a Risultati Finali

  

```mermaid

flowchart TD

    A[👤 User: ./launching_analysis.sh] --> B{Scelta Modalità}

    B -->|5| C[Modalità Aggregated Analysis]

    C --> D[🚀 run_refactored_clinical_xai.py]

    D --> E[📊 XAICoordinator.run()]

    E --> F[🔬 AggregatedAnalysisModeHandler]

    F --> G[🤖 _load_model()]

    G --> H[📖 XAIDataLoader.load_stories()]

    H --> I[📚 List[StoryData]]

    I --> J[🔍 analyze_story() per ogni storia]

    J --> K[📋 List[XAIAnalysisResult]]

    K --> L[🎯 generate_output()]

    L --> M[📈 _perform_mass_analysis()]

    M --> N[🧮 _extract_class_patterns()]

    N --> O[📊 _compute_statistical_summary()]

    O --> P[🎨 _generate_aggregated_plots()]

    P --> Q[📁 Salvataggio Risultati]

    Q --> R[✅ Report HTML + Plots]

    style A fill:#e1f5fe

    style F fill:#fff3e0

    style M fill:#f3e5f5

    style P fill:#e8f5e8

    style R fill:#fff9c4

```

  

### 2. FLUSSO DETTAGLIATO - Dove Possono Sparire i Clinical Tokens

  

```mermaid

flowchart TD

    subgraph "🔧 INIZIALIZZAZIONE"

        A1[Model Loading]

        A2[📖 CustomTokenizer con 585 Clinical Tokens]

        A3[🤖 BERT Model]

    end

    subgraph "📚 CARICAMENTO STORIE"

        B1[XAIDataLoader.load_stories()]

        B2[🔍 Parsing JSON Stories]

        B3[📋 StoryData Objects]

        B4[✅ story_text contiene [CLIN_XXX]]

    end

    subgraph "🔍 ANALISI SINGOLA STORIA"

        C1[analyze_story()]

        C2[⚠️ LIGHTWEIGHT - No GPU]

        C3[XAIAnalysisResult Base]

        C4[❌ predicted_class = 0]

        C5[❌ confidence_score = 0.0]

    end

    subgraph "📈 MASS ANALYSIS"

        D1[_perform_mass_analysis()]

        D2[🔥 Individual Story Inference]

        D3[AttentionAnalyzer.extract_attention_for_sample()]

        D4[🤖 Model Prediction + Attention]

        D5[✅ predicted_class aggiornato]

        D6[✅ confidence_score aggiornato]

    end

    subgraph "📋 EXTRACT METRICS"

        E1[AggregateAnalyzer.extract_aggregated_metrics()]

        E2[❓ PUNTO CRITICO 1]

        E3[Estrazione story_text, predicted_class, etc.]

        E4[🔍 attention_data processing]

        E5[❓ Clinical tokens ancora presenti?]

    end

    subgraph "🧮 CLASS PATTERNS"

        F1[_extract_class_patterns()]

        F2[❓ PUNTO CRITICO 2]

        F3[FrequencyAnalysisHelper]

        F4[🔤 Token Frequency by Class]

        F5[❓ Clinical tokens rilevati qui?]

    end

    subgraph "🎨 VISUALIZZAZIONE"

        G1[VisualizationHelper]

        G2[❓ PUNTO CRITICO 3]

        G3[Clinical Token Mapping Load]

        G4[🔍 _filter_clinical_tokens_only()]

        G5[📊 Plot Generation]

        G6[❓ Clinical plots creati?]

    end

    A1 --> A2

    A2 --> A3

    A3 --> B1

    B1 --> B2

    B2 --> B3

    B3 --> B4

    B4 --> C1

    C1 --> C2

    C2 --> C3

    C3 --> C4

    C4 --> C5

    C5 --> D1

    D1 --> D2

    D2 --> D3

    D3 --> D4

    D4 --> D5

    D5 --> D6

    D6 --> E1

    E1 --> E2

    E2 --> E3

    E3 --> E4

    E4 --> E5

    E5 --> F1

    F1 --> F2

    F2 --> F3

    F3 --> F4

    F4 --> F5

    F5 --> G1

    G1 --> G2

    G2 --> G3

    G3 --> G4

    G4 --> G5

    G5 --> G6

    style E2 fill:#ffebee

    style F2 fill:#ffebee

    style G2 fill:#ffebee

    style E5 fill:#fff3e0

    style F5 fill:#fff3e0

    style G6 fill:#fff3e0

```

  

### 3. ANALISI PUNTI CRITICI - Dove Debug

  

```mermaid

flowchart LR

    subgraph "🔍 PUNTO CRITICO 1: AggregateAnalyzer.extract_aggregated_metrics()"

        PC1A[📋 Input: List[XAIAnalysisResult]]

        PC1B[🔍 story_text extraction]

        PC1C[❓ Clinical tokens in story_text?]

        PC1D[📊 Output: List[Dict]]

        PC1E[❓ story_text preserved?]

        PC1A --> PC1B

        PC1B --> PC1C

        PC1C --> PC1D

        PC1D --> PC1E

    end

    subgraph "🔍 PUNTO CRITICO 2: FrequencyAnalysisHelper"

        PC2A[📋 Input: aggregated_data]

        PC2B[🔤 Token extraction da story_text]

        PC2C[❓ Tokenizer con clinical tokens?]

        PC2D[📈 Frequency calculation]

        PC2E[❓ [CLIN_XXX] nei risultati?]

        PC2A --> PC2B

        PC2B --> PC2C

        PC2C --> PC2D

        PC2D --> PC2E

    end

    subgraph "🔍 PUNTO CRITICO 3: VisualizationHelper"

        PC3A[📊 Input: frequency_analysis]

        PC3B[🗂️ Load clinical_token_mappings.json]

        PC3C[🔍 _filter_clinical_tokens_only()]

        PC3D[🎨 Clinical plots generation]

        PC3E[❓ Plot files created?]

        PC3A --> PC3B

        PC3B --> PC3C

        PC3C --> PC3D

        PC3D --> PC3E

    end

    PC1E -->|Data Flow| PC2A

    PC2E -->|Data Flow| PC3A

    style PC1C fill:#ffcdd2

    style PC1E fill:#ffcdd2

    style PC2C fill:#ffcdd2

    style PC2E fill:#ffcdd2

    style PC3C fill:#ffcdd2

    style PC3E fill:#ffcdd2

```

  

### 4. FLUSSO DATI CLINICAL TOKENS - Tracciamento Specifico

  

```mermaid

flowchart TD

    subgraph "🔬 TOKENIZER STATE"

        TS1[📖 CustomTokenizer]

        TS2[🔢 31,198 total tokens]

        TS3[🏥 585 clinical tokens [CLIN_XXX]]

        TS4[🗂️ clinical_token_mappings.json]

    end

    subgraph "📚 STORY CONTENT"

        SC1[📄 Story JSON Files]

        SC2[📝 story_text field]

        SC3[🏥 Contains [CLIN_312] etc.]

        SC4[✅ Test Extraction WORKS]

    end

    subgraph "🤖 MODEL INFERENCE"

        MI1[🔤 Tokenization]

        MI2[🧠 Model Forward Pass]

        MI3[📊 Attention Weights]

        MI4[🎯 Predictions]

        MI5[❓ Clinical tokens preserved?]

    end

    subgraph "📋 AGGREGATION PHASE"

        AP1[📊 extract_aggregated_metrics()]

        AP2[📝 story_text copying]

        AP3[❓ [CLIN_XXX] still in text?]

        AP4[📈 Frequency analysis input]

    end

    subgraph "🔤 FREQUENCY ANALYSIS"

        FA1[🔍 Token extraction per class]

        FA2[❓ Uses same tokenizer?]

        FA3[📊 Token counting]

        FA4[❓ Clinical tokens detected?]

        FA5[📈 Results by class]

    end

    subgraph "🎨 VISUALIZATION"

        VZ1[📊 Plot generation]

        VZ2[🗂️ Load mappings]

        VZ3[🔍 Filter clinical only]

        VZ4[❓ Clinical tokens found?]

        VZ5[📈 Clinical plots]

    end

    TS1 --> TS2

    TS2 --> TS3

    TS3 --> TS4

    SC1 --> SC2

    SC2 --> SC3

    SC3 --> SC4

    SC3 --> MI1

    TS3 --> MI1

    MI1 --> MI2

    MI2 --> MI3

    MI3 --> MI4

    MI4 --> MI5

    MI5 --> AP1

    SC3 --> AP2

    AP2 --> AP3

    AP3 --> AP4

    AP4 --> FA1

    TS3 --> FA2

    FA1 --> FA2

    FA2 --> FA3

    FA3 --> FA4

    FA4 --> FA5

    FA5 --> VZ1

    TS4 --> VZ2

    VZ1 --> VZ2

    VZ2 --> VZ3

    VZ3 --> VZ4

    VZ4 --> VZ5

    style MI5 fill:#ffcdd2

    style AP3 fill:#ffcdd2

    style FA2 fill:#ffcdd2

    style FA4 fill:#ffcdd2

    style VZ4 fill:#ffcdd2

```

  

## 🎯 PIANO DI DEBUG

  

### Priorità Debug Points:

  

1. **🔴 CRITICO - FrequencyAnalysisHelper**: Verifica se usa il tokenizer corretto

2. **🟡 IMPORTANTE - extract_aggregated_metrics**: Conferma story_text preservation  

3. **🟡 IMPORTANTE - VisualizationHelper**: Debug clinical token detection

  

### Test da Eseguire:

  

1. ✅ **Test tokenizer isolation** (GIÀ FATTO - funziona)

2. 🔄 **Test aggregated analysis pipeline** (DA FARE)

3. 🔄 **Test frequency analysis** (DA FARE)  

4. 🔄 **Test visualization generation** (DA FARE)