module Aula2 where

-- Entrada -> Retorno
dobro :: Int -> Int 
dobro x = 2*x

-- nomeDaFuncao::Tipo1 -> Tipo2 .. -> Tn -> TipoRetorno
-- nomeDaFuncao e1 e2 ... en = EXPRESSAO(e1, e2, ..., en)

pegarDuasReverso :: String -> String
pegarDuasReverso xs = take 2 (reverse xs)

-- LIST COMPREHENSION: PERMITE GERAR LISTAS A PARTIR DE EXPRESSOES E FILTROS
-- 'A' :: Char e "A" :: String ou "A" = [Char]
-- String = [Char]
lista1 :: String
lista1 = ['A' .. 'Z']

lista2 :: String
lista2 = ['A', 'C' .. 'Z']

tabuada7 :: [Int]
tabuada7 = [7, 14 .. 70]

tabuada9 :: [Int]
tabuada9 = [9, 18 .. 90]

lista4 :: [Int]
lista4 = [x + 2  | x <- [1 ..5], x /= 4]
-- [1 + 2, 2 + 2, 3 + 2, 5 + 2] = [3,4,5,7]
-- 1 /= 4 TRUE
-- 2 /= 4 TRUE
-- 3 /= 4 TRUE
-- 4 /= 4 FALSE
-- 5 /= 4 TRUE
-- FAZER A CONTA AO FINAL

--  Conjunto: idempotente, comutativo
-- {1,2,2} = {1,2} V para conjunto

multiplos :: Int -> [Int]
multiplos n = [x | x <- [1 .. n], mod n x == 0] 

ehPrimo :: Int -> Bool
ehPrimo n = length (multiplos n) == 2

ateMilPrimos :: [Int]
ateMilPrimos = [n | n <- [1 .. 1000], ehPrimo n]

-- 1) Gerar a lista [4,11,18, 25, 32, 39, 46]
sequenciaSete :: [Int]
sequenciaSete = [4, 11 .. 46]

-- 2) Gerar a lista [0, 2, 4, 6, 8, 12, 16, 18, 20, 22, 24, 26]
sequenciaDois :: [Int]
sequenciaDois = [n | n <- [0, 2 .. 26], n /= 10, n /= 14]
-- ou [n | n <- [0 .. 26], even n, n /= 10, n /= 14]

-- Listas: São estrutura contiguas que possuem valores do mesmo tipo. Podem ter infinitos elementos se ncessário
-- O tamanho da lista é variável

-- Tuplas: São estruturas contiguas que possuem valores de tipos diferentes. Aqui, temos apenas uma quantidade finita
-- de elementos e seu tamanho é constante

soma :: Int -> Int -> Int
soma x y = x + y

soma' :: (Int, Int) -> Int
soma' (x,y) = x + y

dado :: [(Int, Int)]
dado = [(d1, d2) | d1 <- [1 .. 6], d2 <- [1 .. 6]]

-- final cap2 livro