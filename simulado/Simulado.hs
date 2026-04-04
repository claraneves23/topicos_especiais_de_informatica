module Simulado where
import Data.Monoid
-- 1. (2.5 pontos) Considere o tipo Produto contendo os campos nome, valor e categoria. Os campos nome e valor
-- são String e Double, respectivamente, ao passo que categoria  ́e um tipo Categoria que possui os valores
-- Livro, Brinquedo e Escritorio. Crie os dois tipos com instˆancias necess ́arias para a solu ̧c ̃ao deste exercıcio e
-- implemente as funcoes:

-- tipo algebrico
data Categoria = Livro String | Brinquedo String | Escritorio String deriving (Show, Eq)

-- record
data Produto = Produto { nome:: String, valor:: Double, categoria:: Categoria} deriving Show

-- •extrair :: [Produto] -> [Double] que retorna uma lista com todos os preços de produto;
extrair :: [Produto] -> [Double]
extrair = map valor

-- •minValor :: [Produto] -> Double que retorna o preco do produto de valor mınimo;
minValor :: [Produto] -> Double
minValor produto = minimum (map valor produto)

-- •livrEscr :: [Produto] -> [Produto] que retorna os produtos que nao sejam brinquedos;
-- livrEscr :: [Produto] -> [Produto] 
-- livrEscr = filter (\p -> categoria p /= Brinquedo ) 

livrEscr :: [Produto] -> [Produto] 
livrEscr =
  filter (\p -> case categoria p of
                  Brinquedo _ -> False
                  _           -> True)

livrEscrito = filter (\p -> not (isBrinquedo (categoria p)))

isBrinquedo (Brinquedo _) = True
isBrinquedo _  = False

-- •avgLivrEscr :: [Produto] -> Double que retorna a media dos produtos que nao sao brinquedos;
avgLivrEscr :: [Produto] -> Double
avgLivrEscr produto = sum(map valor (livrEscr produto))/fromIntegral (length (livrEscr produto))

-- •maxMinLivr :: [Produto] -> (Double,Double) que retorna o maior e o menor preco dos livros;
maxMinLivr p =
  ( maximum (map valor (filter (\x -> isLivro (categoria x)) p))
  , minimum (map valor (filter (\x -> isLivro (categoria x)) p))
  )

isLivro (Livro _) = True
isLivro _  = False

-- •countBrinq :: [Produto] -> Int que retorna a quantidade de itens de brinquedo.
countBrinq :: [Produto] -> Int
countBrinq p = length(filter (\x -> (isBrinquedo (categoria x))) p)


-- 2. (2.5 pontos) Sobre monoides:
-- •Considere o tipo data Sozinho = Sozinho, crie uma instˆancia de Monoid para este tipo.
data Sozinho = Sozinho

instance Semigroup Sozinho where
  Sozinho <> Sozinho = Sozinho

instance Monoid Sozinho where  -- era para parar em semigroup?
  mempty = Sozinho


-- •Considere o operador binario:
-- ign :: String -> String -> String
-- ign l m = m
-- O tipo String com esta operacao ign e o elemento neutro [] formam um monoide? Justifique sua resposta.

-- ign a (ign b c) == ign (ign a b) c
-- ign a c == ign b c
-- c = c  ASSOCIATIVA

-- ign a [] == ign [] a FALSE 
-- NAO É MONOIDE

-- 3. (2.5 pontos) Considere o tipo data Dupla a = Dupla a [Int]
-- •Qual o kind de Dupla Bool?
-- Tipo Completo -> (Dupla Bool) :: *

-- •Crie uma instˆancia de Functor para Dupla.

data Dupla a = Dupla a [Int]

instance Functor Dupla where
    fmap f (Dupla x xs) = Dupla (f x) xs

-- •Qual o tipo da expressao Dupla ’5’ [0,1]?
-- O construtor Dupla possui tipo a -> [Int] -> Dupla a.
-- Na expressão Dupla '5' [0,1], o primeiro argumento '5' é do tipo Char, logo a = Char.
-- O segundo argumento [0,1] é uma lista de inteiros ([Int]), compatível com a definição.
-- Portanto, o tipo da expressão é Dupla Char.

-- •Qual o tipo da expressao Dupla?
-- Dupla :: a -> [Int] -> Dupla a

-- •Crie uma instˆancia de Show que mostre na tela uma dupla em formato de tuplas do Haskell. Por exemplo,
-- Dupla ’k’ [1,2,3] dever ́a ser mostrado (k,[1,2,3]).

instance Show a => Show (Dupla a) where
    show (Dupla x xs) = "("++ show x ++ "," ++ show xs ++ ")"

-- •Faca uma funcao mostra :: Dupla a -> Either [Int] a que mostra a lista de inteiros caso o seu ta-
-- manho seja maior que zero ou o campo de tipo a caso contrario.

mostra :: Dupla a -> Either [Int] a
mostra (Dupla x xs)
  | length xs > 0 = Left xs
  | otherwise     = Right x
     

-- 4. (2.5 pontos) De o tipo das express ̃oes abaixo da maneira mais gen ́erica poss ́ıvel:
-- (a) \x -> x
    -- p -> p

-- (b) id . tail $ "HELLO"
    -- [Char]

-- (c) 4*9
-- Num a => a

-- (d) ("FATEC", False, 'K')
-- (String, Bool, Char)

-- (e) [(False,False),(True,False),(False,True),(True,True)]
-- [(Bool, Bool)]

-- (f) filter id
-- [Bool] -> [Bool]


-- 5. (2.5 pontos) Considere data () = () e complete:
f1 :: (a,b) -> (b,a,a)
f1 (a,b) = (b, a, a)

f2 :: a -> (a,a,a,())
f2 a = (a,a,a,())

f3 :: Either a () -> Maybe a
f3 (Left x) = Just x 
f3 (Right ()) = Nothing

f4 :: (a -> b) -> (b -> z) -> (a -> z)
f4 f g x = g (f x)

f5 :: (a -> b) -> (c,a) -> (c,b)
f5 g = \(y, x) -> (y, g x)