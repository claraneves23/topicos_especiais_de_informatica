module Aula7 where

import Data.Monoid

{-
Semigrupo: Sejam m :: *, (<>) :: m -> m -> m uma operação binária.
Então, (m, <>) é um Semigrupo se satisfazer:

Associatividade <>

forall x, y, z :: m. (x <> y) <> z = x <> (y <> z)

Exemplos:

a)
m = Int, (<>) = (+)
(Int, +) eh um Semigrupo, pois a soma de numeros eh associativa.

Por exemplo,
(3 + 5) + 4 = 8 + 4 = 12
3 + (5 + 4) = 3 + 9 = 12

b)
m = Int, (<>) = (*)
(Int, *) eh um Semigrupo, pois a multiplicacao eh associativa

(3 * 5) * 4 = 15 * 4 = 60
3 * (5 * 4) = 3 * 20 = 60

c) CONTRA-EXEMPLO
m = Int e (<>) = (-)

(5 - 7) - 9 = -2 -9 = -11
5 - (7 - 9) = 5 - (-2) = 5 + 2 = 7

R: (Int, -) nao eh um sumigrupo, pois para x=5, y=7 e z=9, 
temos que (5 - 7) - 9 =/= 5 - (7 - 9).

-}

-- newtype eh uma utilizacao para tipos com um construtor de um tipo só
newtype Or = Or Bool deriving Show

instance Semigroup Or where
    Or x <> Or y = Or (x || y)

newtype And = And Bool deriving (Show, Eq)

instance Semigroup And where
    And x <> And y = And (x && y)

andAssoc :: And -> And -> And -> Bool
andAssoc x y z = (x <> y) <> z == x <> (y <> z)

newtype Nand = Nand Bool deriving (Eq, Show)

instance Semigroup Nand where
    (Nand x) <> (Nand y) = Nand (not (x && y))

nandAssoc :: Nand -> Nand -> Nand -> Bool
nandAssoc x y z = (x <> y) <> z == x <> (y <> z)

-- R: (Bool, nand) nao eh um semigrupo, pois para x = (Nand True), y = (Nand True)
-- z = (Nand False), o resultado (x <> y) <> z =/= x <> (y <> z).
{-
nandAssoc (Nand True) (Nand True) (Nand False)
 ((Nand True) <> (Nand True)) <> (Nand False)
 = Nand (not (True && True)) <> Nand False
 = Nand (not True) <> Nand False
 = Nand False <> Nand False
 = Nand (not (False && False))
 = Nand (not False)
 = Nand True

 x <> (y <> z)
 = (Nand True) <> ((Nand True) <> (Nand False))
 = Nand True <> Nand (not (True && False))
 = Nand True <> Nand (not False)
 = Nand True <> Nand True
 = Nand (not (True && True))
 = Nand (not True)
 = Nand False
-}


{-

Funtor: eh um typeclass para tipos de kind
* -> *.

class Functor f where
    map :: (a -> b) -> f a -> f b

instance Functor [] where
    map :: (a -> b) -> [a] -> [b]
    fmap = map

instance Functor Maybe where
    fmap f Nothing = Nothing
    fmap f (Just x) = Just (f x)
-}

safeHead :: String -> Maybe Char
safeHead [] = Nothing
safeHead (x : xs) = Just x

-- CRIACAO DE FUNTOR

data Bolsa a = Bolsa a a Int deriving Show

instance Functor Bolsa where
    fmap f (Bolsa x y z) = Bolsa (f x) (f y) z