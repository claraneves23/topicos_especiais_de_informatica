module Lista where

import Data.Monoid
import Data.Time.Clock.TAI (taiEpoch)


-- -- tipo algébrico
-- data Categoria = Livro String | Brinquedo String | Escritorio String deriving (Show, Eq)

-- -- record
-- data Produto = Produto { nome:: String, valor:: Double, categoria:: Categoria} deriving Show

-- 1.1 Defina um tipo  Clima  com os construtores  Sol ,  Chuva  e  Nublado .
-- Implementa a função  precisaGuardaChuva :: Clima -> Bool

data Clima = Sol String | Chuva String | Nublado String deriving (Show, Eq)

precisaGuardaChuva :: Clima -> Bool
precisaGuardaChuva clima = isChuva(clima)

isChuva (Chuva _) = True
isChuva _  = False


-- Tipo algébrico → múltiplos construtores
-- Record → tipo algébrico com campos nomeados
-- _ → wildcard (ignora valor no pattern matching)
-- isChuva → usa pattern matching + desestruturação

-- 1.2 Considere o tipo  data Forma = Circulo Double | Retangulo
-- Double Double . Implemente a função  area :: Forma -> Double 

data Forma = Circulo Double | Retangulo Double Double

area :: Forma -> Double
area (Retangulo largura altura) = largura * altura
area (Circulo raio) = pi * raio * raio

-- 1.3 Crie um tipo  Pessoa  usando a sintaxe de Records com os campos
-- nome :: String ,  idade :: Int  e  profissao :: String .

data Pessoa = Pessoa { nome:: String, idade:: Int, profissao :: String} deriving (Show, Eq)

-- 1.4 Dada a definição de  Nat  vista em aula ( data Nat = Z \| S Nat ),
-- implemente a função  somaNat :: Nat -> Nat -> Nat

data Nat = Z | S Nat
somaNat :: Nat -> Nat -> Nat
somaNat Z n     = n
somaNat (S m) n = S (somaNat m n)

-- 1.5 Implemente a função  ehAdulto :: Pessoa -> Bool  que retorna
-- verdadeiro se a idade for maior ou igual a

ehAdulto :: Pessoa -> Bool 
ehAdulto pessoa = idade pessoa >= 18

-- 1.6 Explique a diferença entre um construtor de tipo e um construtor de
-- dados usando o exemplo  data Talvez a = Nada | Justo a .

-- data Talvez é um construtor de tipo 
-- e Nada ou Justo são construtores de dados

-- 2.1 Dada uma lista de inteiros, use  filter  para retornar apenas os
-- números que são múltiplos de 3

mult3 :: [Int] -> [Int]
mult3 xs = filter(\x -> x `mod` 3 == 0 )xs

-- 2.2 Implemente uma função que receba uma lista de  String  e retorne
-- uma lista com o tamanho de cada string usando  map .

tamanhoString :: [String] -> [Int]
tamanhoString xs = map length(xs)


-- 2.3 Use  foldr  para implementar a função  produtoLista :: [Int] ->
-- Int , que calcula o produto de todos os elementos.

-- foldr: reduz uma lista a um único valor, processando da direita para a esquerda
produtoLista :: [Int] -> Int 
produtoLista xs = foldr (*) 1 xs

-- 2.4 Crie uma função  zipWithSum :: [Int] -> [Int] -> [Int]  que
-- soma os elementos correspondentes de duas listas

-- combina duas listas elemento a elemento
zipWithSum :: [Int] -> [Int] -> [Int]
zipWithSum xs ys = zipWith (+) xs ys

-- 2.5 Escreva uma expressão usando List Comprehension que gere todos
-- os números pares entre 1 e 50
-- LIST COMPREHENSION: PERMITE GERAR LISTAS A PARTIR DE EXPRESSOES E FILTROS
lista :: [Int]
lista = [x | x <- [1 .. 50], even(x)]

-- Dada a função  f = filter (>5) . map (*2) , qual o resultado de  f
-- [1, 2, 3, 4, 5] ? Justifique o processo.

-- . = composição (direita → esquerda)
-- map (*2) transforma a lista
-- filter (>5) seleciona elementos
-- fluxo: entrada → map → filter → saída
-- [6,8,10]
f = filter (>5) . map (*2)

-- 3.1 Crie uma instância de  Show  para o tipo  Forma  (do ex 1.2) que mostre
-- “Círculo de raio X” ou “Retângulo de base B e altura A

instance Show Forma where
    show (Circulo r) = "Circulo de raio: " ++ show r
    show (Retangulo a b) = "Retangulo de base " ++ show b ++ " e altura " ++ show a

c = Circulo 5
r = Retangulo 10 4

-- 3.2 Considere  data Caixa a = Caixa a . Crie uma instância de  Functor  para
-- Caixa .

data Caixa a = Caixa a

instance Functor Caixa where
    fmap f (Caixa a) = Caixa (f a)

-- 3.3 O tipo  String  com a operação  (++)  e o elemento neutro  ""  formam um
-- Monóide? Justifique com as leis de Monóide.
-- | Propriedade              | Lei Formal                          | Aplicação em String          | Exemplo                         | Resultado |
-- |--------------------------|-------------------------------------|------------------------------|----------------------------------|-----------|
-- | Operação binária         | x <> y :: String                   | (++)                         | "ab" ++ "cd"                     | "abcd"    |
-- | Elemento neutro          | mempty :: String                   | ""                           | ""                               | ""        |
-- | Associatividade          | (x ++ y) ++ z = x ++ (y ++ z)      | Concatenação é associativa   | ("ab"++"c")++"d" = "ab"++("c"++"d") | "abcd"    |
-- | Identidade à esquerda    | "" ++ x = x                        | "" não altera a string       | "" ++ "abc"                      | "abc"     |
-- | Identidade à direita     | x ++ "" = x                        | "" não altera a string       | "abc" ++ ""                      | "abc"     |

-- Implemente a instância de  Semigroup  e  Monoid  para um tipo  Soma Int
-- que realiza a adição de inteiros.

data Soma = Soma Int 

instance Semigroup Soma  where
    (Soma x) <> (Soma y)  = Soma (x + y)

instance Monoid Soma where
    mempty = Soma 0

-- 3.6 Dada a estrutura  data Par a = Par a a , implemente a instância de
-- Functor  de modo que a função seja aplicada a ambos os elementos.

data Par a = Par a a

instance Functor Par where
    fmap f(Par a x) = Par(f a)(f x)

-- data Dupla a = Dupla a [Int]

-- instance Functor Dupla where
--     fmap f (Dupla x xs) = Dupla (f x) xs

-- 4.1 Qual o tipo de  \x y -> x + y ?
-- \x y -> x + y :: Num a => a -> a -> a 

-- 4.2 Qual o tipo da função  head ? E da função  tail ?
-- head: pega o primeiro da lista
-- head :: GHC.Stack.Types.HasCallStack => [a] -> a

-- tail: pega o resto da lista
-- tail :: GHC.Stack.Types.HasCallStack => [a] -> [a]

-- 4.3 Determine o tipo de  (map . map)  e explique o que essa composição faz.
-- (map . map) :: (a -> b) -> [[a]] -> [[b]]

-- 4.4 Qual o kind de  Either String ?
-- Either String :: * -> *

-- 4.5 Dê o tipo mais genérico para  f x = x : [x]
-- f :: a -> [a]

-- Analise a expressão  reverse . take 3 . Qual o seu tipo se aplicada a
-- uma  String ? 
-- [a] -> [a]
