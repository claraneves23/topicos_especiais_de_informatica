module Aula5 where

-- Problema: Quero eliminar os numeros negativos, mas eu nao quero validar.

-- Ou um numero eh 0 ou temos uma funcao sucessora.
-- Nat eh um tipo recursivo e do jeito que esta definido, eh uma lista ligada
data Nat = Z | S Nat deriving Show
-- Inteiros: -7, -8, -56454848, 4, 5, 99, ...
-- Naturais: Z, S Z, S (S Z), S (S (S Z)), S (S (S (S Z)))

toInt :: Nat -> Int
toInt Z     = 0
toInt (S n) = 1 + toInt n
-- n = (S (S Z))
-- toInt (S (S (S Z))) = 1 + toInt (S (S Z))
-- n = (S Z)

-- da para melhorar
toNat :: Int -> Nat
toNat n
    | n < 0 = error "Erro"
    | n == 0 = Z
    | otherwise = S (toNat (n-1))
-- toNat 3 = S (toNat 2) = (S (S (S Z)))
-- toNat 2 = S (toNat 1) = (S (S Z))
-- toNat 1 = S (toNat 0) = (S Z)
-- toNat 0 = Z

fat'' :: Nat -> Nat
fat'' Z     = S Z
fat'' (S n) = toNat (toInt(S n) * toInt (fat'' n))

fib' :: Nat -> Nat
fib' Z      = Z
fib' (S Z)    = S Z
fib' (S (S n))  = toNat (toInt (fib' (S n)) + toInt (fib' n))

fib :: Int -> Int
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

-- Recursao: Eh uma funcao que chama ela mesma ate que um caso base seja encontrado.
fat :: Int -> Int
fat 0 = 1
fat 1 = 1
fat n = n * fat(n-1)
-- fat 5 = 5 * fat 4 = 5 * 24 = 120
-- fat 4 = 4 * fat 3 = 4 * 6  = 24
-- fat 3 = 3 * fat 2 = 3 * 2  = 6
-- fat 2 = 2 * fat 1 = 2 * 1  = 2
-- fat 1 = 1

-- PILHA:
-- fat 1 ----------> SAIU0
-- fat 2 ----------> SAIU1
-- fat 3 ----------> SAIU2
-- fat 4 ----------> SAIU3
-- fat 5 ----------> SAIU4

-- GUARDS: Sao condicoes booleanas checadas sequencialmente
fat' :: Int -> Int
fat' n
    | n == 0 || n == 1 = 1
    | otherwise = n * fat' (n-1)

modulo :: Int -> Int
modulo x
    | x >= 0 =  x
    | x <  0 = -x

-- Arvore Binaria

data Arvore = Null | Leaf Int | Branch Int Arvore Arvore
    deriving Show

emOrdem :: Arvore -> [Int]
emOrdem Null                = []
emOrdem (Leaf x)            = [x]
emOrdem (Branch r esq dir)  = emOrdem esq ++ [r] ++ emOrdem dir

minhaArvore :: Arvore
minhaArvore = Branch 10 (Branch 5 (Leaf 3) (Leaf 7)) 
                        (Branch 11 Null (Leaf 15))
-- 
-- emOrdem minhaArvore = emOrdem (Branch 5 (Leaf 3) (Leaf 7)) 
-- 

-- livros estrutura de dados
-- Algorithm Design with Haskell
-- Nivio Ziviani
-- Estrutura de dados paulo feofiloff