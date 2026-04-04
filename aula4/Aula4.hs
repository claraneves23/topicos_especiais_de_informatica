module Aula4 where

-- Lambdas: Sao funcoes anonimas, sao cidadaos de primeira ordem.

-- \p1 p2 ... pn -> Expressao(p1,p2,...,pn)

-- High-order functions: Sao funcoes que recebem ou retornam outras funcoes


-- Nota: (Int -> Int) -> Int eh direfente de Int -> Int -> Int
func :: (Int -> Int) -> Int
func f = 1 + f 5
-- func (\x -> 3*x) = 1 + (\x -> 3*x) 5
--                  = 1 + 3*5
--                  = 1 + 15
--                  = 16

-- func (3*) = 1 + (3*)5
--           = 1 + 3*5
--           = 1 + 15
--           = 16

foo :: (Int -> Int -> Int) -> Int
foo g = 2 * g 3 4
-- foo (\x y -> x + y)
-- = 2 * (\x y -> x + y) 3 4
-- = 2 * (3+4)
-- = 2 * 7
-- = 14

-- Currying: Eh o ato de chamar uma funcao com menos parametros do que o definido.
-- O resultado é uma nova funcao com o restante dos parametros

somar :: Int -> Int -> Int -> Int
somar x y z = x + y + z
-- somar 4 5 = \z -> 4 + 5 + z
-- func (somar 4 5) = 1 + (somar 4 5) 5
--                  = 1 + (\z -> 4 + 5 + z) 5
--                  = 1 + (\z -> 9 + z) 5
--                  = 1 + 5 + 9
--                  = 15

-- map: Eh uma funcao que recebe uma funcao f
-- e uma lista [e1, e2, ..., en].
-- A expressao
-- map f [e1,e2, ..., en] = [f e1, f e2, ..., f en]

-- map (\x -> 2*x) [1 .. 5]
-- = map (\x -> 2*x) [1,2,3,4,5]
-- = [(\x -> 2*x) 1, (\x -> 2*x) 2, (\x -> 2*x) 3, (\x -> 2*x) 4, (\x -> 2*x) 5]
-- = [2*1, 2*2, 2*3, 2*4, 2*5]
-- = [2,4,6,8,10]

-------------
--Propriedade:

--(Elemento Neutro): forall xs. map id xs = xs

-------------

--Filter: Recebe um predicado (Funcao que retorna Bool) e uma lista. O filter retorna todos elementos
--True

-------------

-- Fold (Dobra): Recebe uma funcao de dois parametros (operador),
-- um valor inicial, e uma lista. Retorna o valor acumulado da dobra.

--foldl (+) 0 [1,2,3,4,5]
-- = foldl (+) (0+1) [2,3,4,5]
-- = foldl (+) ((0+1)+2) [3,4,5]
-- = foldl (+) (((0+1)+2)+3) [4,5]
-- = foldl (+) ((((0+1)+2)+3)+4) [5]
-- = foldl (+) (((((0+1)+2)+3)+4)+5) []
-- = (((((0+1)+2)+3)+4)+5) = 1+2+3+4+5 = 15

-- fatorial: foldl (*) 1 [2,3,4,5]
-- =120

fat :: Int -> Int
fat n = foldl (*) 1 [2 .. n]