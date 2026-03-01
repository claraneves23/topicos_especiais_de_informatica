module Teste where

-- 2.1) Gere as listas:
-- a) [1,11,121,1331,14641,161051,1771561]

lista :: [Integer]
lista = iterate (*11) 1

listaLimitada :: [Integer]
listaLimitada = take 7 lista

outraForma = take 7([11^n | n <- [0..]])
                       --12     16       20          24               12         36
-- b) [1,2,3,5,6,7,9,10,11,13,14,15,17,18,19,21,22,23,25,26,27,29,30,31,33,34,35,37,38,39]

multiplo :: Int -> Bool
multiplo n = n `mod` 4 == 0

menorQue12 :: Int -> Bool
menorQue12 n =  n >= 12 

sequencia :: [Int]
sequencia = [n | n <- [1 .. 39], not(multiplo n && menorQue12 n)]

-- c) ["AaBB", "AbBB", "AcBB", "AdBB", "AeBB", "AfBB","AgBB"]

sequenciaLetras :: [String]
sequenciaLetras = ["A" ++ [x] ++ "BB" | x <- ['a'..'g']]

-- d) [5,8,11,17,20,26,29,32,38,41]
lista3 :: [Int]
lista3 = [x | x <- [5, 8 .. 41], x /= 14, x/=23, x /= 35]

-- e) [1.0,0.5,0.25,0.125,0.0625,0.03125]
listaMetade :: [Double]
listaMetade = iterate (/2) 1
metade = take 6 listaMetade

outraMetade = take 6([1/2^n | n <- [0..]])

-- f) [1,10,19,28,37,46,55,64]
sequencia9 :: [Int]
sequencia9 = [1, 10 .. 64]

-- g) [2,4,8,10,12,16,18,22,24,28,30]
novaSequencia :: [Int]
novaSequencia = [x | x <- [2, 4..30], x `notElem` [6,14,20,26]]


-- h) ['@','A','C','D','E','G','J','L']
sequenciaCaracter :: String
sequenciaCaracter = [x | x <- ['@','A'..'L'], x `notElem` ['B','F','H','I','K']]

-- 2.2) Crie uma função que verifique se o tamanho de uma
-- String é par ou não. Use Bool como retorno.
tamanhoString :: String -> Bool
tamanhoString xs = even (length xs)

-- 2.3) Escreva uma função que receba um vetor de Strings e
-- retorne uma lista com todos os elementos em ordem reversa
listaInversa :: [String] -> [String]
listaInversa = reverse 
-- 2.4) Escreva uma função que receba um vetor de Strings e
-- retorne uma lista com o tamanho de cada String. As palavras de
-- tamanho par devem ser excluídas da resposta.
tamanhosImpares :: [String] -> [Int]
tamanhosImpares xs = [ length s | s <- xs, odd (length s) ]

-- 2.5) Escreva a função head como composição de duas outras.
pseudoHead :: [String] -> String
pseudoHead = last . take 1

-- 2.6) Faça uma função que receba uma String e retorne True
-- se esta for um palíndromo; caso contrário, False .
ehPalindromo :: String -> Bool
ehPalindromo retorno = reverse retorno == retorno

-- 2.7 Faça uma função que receba um inteiro e retorne uma
-- tupla, contendo: o dobro deste número na primeira coordenada, o
-- triplo na segunda, o quádruplo na terceira e o quíntuplo na quarta.

novaTupla' :: Int -> (Int, Int, Int, Int)
novaTupla' xs = ( xs * 2, xs * 3, xs * 4, xs * 5)