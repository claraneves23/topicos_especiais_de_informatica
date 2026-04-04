module Aula6 where

mapa :: (a -> b) -> [a] -> [b]
mapa f [] = []
-- x :: a
mapa f (x : xs) = (f x) : mapa f xs

-- mapa :: (a -> b) -> [a] -> [b]
-- mapa f [] = []
-- mapa f (x : xs) = (f x) : mapa f xs

-- x = l, xs = [2,3]
-- mapa (+3) [1,2,3] = ((+3) 1) : mapa (+3) [2,3]
-- x = 2, xs = [3]
-- mapa (+3) [2,3] = ((+3) 2) : mapa (+3) [3] = 5 : 6 : []
-- mapa (+3) [3] = ((+3) 3) : mapa (+3) [3]

idd :: a -> a
idd x = x

-- f :: a -> b
-- f x = x

f :: a -> (a,a)
f x = (x,x)

-- TIPOS POLIMORFICOS --

data Bolsa a = Bolsa a a deriving Show

data Mochila a b = Mochila a b Int deriving Show

-- todo valor tem um tipo, todo tipo tem um kind, todo kind tem um sort, todo sort tem um sort 1...
-- :k Int
-- *
-- :k Bolsa
-- :k * -> *
-- :k Mochila
-- :k * -> * -> *

data Resposta = Sim | Nao

-- Typeclass: Conceito que restrunge o polimorfismo parametrico.
-- Ele provera metodos que sao definidos de acordo como cada tipo é definido
-- no instance ou pelo deriving (automatico).

instance Show Resposta where
    show Sim = "Verdadeiro"
    show Nao = "Falso"

class Predicado a where
    validar :: a -> Bool

instance Predicado Resposta where
    validar Sim = True
    validar Nao = False

instance Predicado Bool where
    validar = id

-- números são polimorficos
-- :t 8
-- 8 :: Num a => a

instance Eq Resposta where
    Sim == Sim = True
    Nao == Nao = True
    _ == _ = False

-- Theorems for free!