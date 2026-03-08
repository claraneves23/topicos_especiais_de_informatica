# Tópicos Especias de Informática🐋

Disciplina ministrada pelo professor Alexandre Garcia de Oliveira

Lattes: https://lattes.cnpq.br/3197525814082326

## Programação Funcional em Haskell

### Aulas 1 e 2 - Fundamentos Teóricos e Práticos

### 1. Fundamentação Teórica

#### 1.1 Paradigma Funcional

Na programação funcional:

* Programas são definidos como **composição de funções**
* Não existe atribuição mutável (`a = a + 1` não é permitido)
* Não há estado compartilhado modificável
* O foco está na **expressão do que deve ser calculado**, e não em como iterar

Diferentemente do paradigma imperativo:

* Não há laços tradicionais (`for`, `while`)
* Não existe variável mutável
* Funções substituem estruturas de repetição

---

#### 1.2 Funções Puras

Uma função é considerada **pura** quando:

1. Para uma mesma entrada, sempre produz a mesma saída
2. Não possui efeitos colaterais
3. Não depende de estado externo

Exemplo:

```haskell
dobro :: Int -> Int
dobro x = 2 * x
```

Interpretação do tipo:

```
Int -> Int
```

Significa: recebe um inteiro e retorna um inteiro.

---

#### 1.3 Sistema de Tipos

Haskell utiliza **tipagem estática e forte**.

A assinatura de uma função segue o padrão:

```haskell
nomeDaFuncao :: TipoEntrada1 -> TipoEntrada2 -> TipoRetorno
```

Exemplo com múltiplos parâmetros:

```haskell
soma :: Int -> Int -> Int
soma x y = x + y
```

Também é possível utilizar tuplas:

```haskell
soma' :: (Int, Int) -> Int
soma' (x, y) = x + y
```

---

### 2. Estruturas de Dados

#### 2.1 Listas

Características:

* Estruturas homogêneas (mesmo tipo de dados)
* Tamanho variável
* Podem ser infinitas
* Avaliação preguiçosa

Exemplos:

```haskell
lista1 :: String
lista1 = ['A' .. 'Z']
```

```haskell
tabuada7 :: [Int]
tabuada7 = [7, 14 .. 70]
```

---

#### 2.2 Avaliação Preguiçosa (Lazy Evaluation)

Haskell avalia expressões **apenas quando necessário**.

Exemplo conceitual:

```haskell
[1, 2, 3, 900*123, 0]
```

O cálculo `900*123` só será executado se o valor for acessado.

Essa característica permite:

* Definição de listas infinitas
* Otimização de desempenho
* Composição eficiente de operações

---

### 3. Manipulação de Listas

#### 3.1 Funções Básicas

Algumas funções padrão:

* `take n lista` → retorna os primeiros n elementos
* `drop n lista` → descarta os primeiros n elementos
* `reverse lista` → inverte a lista
* `head lista` → primeiro elemento (erro se lista vazia)
* `tail lista` → lista sem o primeiro elemento
* `!!` → acesso por índice

Exemplo:

```haskell
pegarDuasReverso :: String -> String
pegarDuasReverso xs = take 2 (reverse xs)
```

---

### 4. Compreensão de Listas (List Comprehension)

Permite gerar listas com base em expressões e filtros.

Estrutura geral:

```haskell
[expressao | elemento <- lista, condicao]
```

Exemplo:

```haskell
lista4 :: [Int]
lista4 = [x + 2 | x <- [1 .. 5], x /= 4]
```

Interpretação:

* Percorre os valores de 1 a 5
* Remove o valor 4
* Soma 2 aos demais elementos

---

### 5. Produto Cartesiano e Tuplas

Simulação de combinações possíveis de dois dados:

```haskell
dado :: [(Int, Int)]
dado = [(d1, d2) | d1 <- [1 .. 6], d2 <- [1 .. 6]]
```

Aqui são geradas todas as combinações possíveis entre dois conjuntos.

---

### 6. Listas vs Tuplas

| Característica     | Lista      | Tupla                  |
| ------------------ | ---------- | ---------------------- |
| Tipo dos elementos | Homogêneo  | Pode variar            |
| Tamanho            | Variável   | Fixo                   |
| Uso comum          | Sequências | Agrupamento estrutural |

---



