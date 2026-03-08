module Teste where

-- Faça o tipo Temperatura que pode ter valores Celsius ,
-- Farenheit ou Kelvin . Implemente as funções:

-- converterCelsius : recebe um valor double e uma
-- temperatura, e faz a conversão para Celsius.
-- converterKelvin : recebe um valor double e uma
-- temperatura, e faz a conversão para Kelvin.
-- converterFarenheit : recebe um valor double e
-- uma temperatura, e faz a conversão para Farenheit.


data Temperatura = Celsius | Farenheit | Kelvin  deriving (Show, Read)

-- toInt' :: DiaSemana -> Int
-- toInt' Domingo  = 0
-- toInt' Segunda  = 1
-- toInt' Terca    = 2
-- toInt' Quarta   = 3
-- toInt' Quinta   = 4
-- toInt' Sexta    = 5
-- toInt' Sabado   = 6


converterCelsius :: Double -> Temperatura -> Double
converterCelsius t Celsius = t
converterCelsius t Kelvin = t - 273.15
converterCelsius t Farenheit = (t - 32) * 5/9

converterKelvin :: Double -> Temperatura -> Double
converterKelvin t Kelvin = t
converterKelvin t Celsius = t + 273.15
converterKelvin t Farenheit = (t - 32) * 5/9 + 273.15

converterFarenheit :: Double -> Temperatura -> Double
converterFarenheit t Farenheit = t
converterFarenheit t Celsius = (t * 9/5) + 32
converterFarenheit t Kelvin = (t - 273.15) * 9/5 + 32

-- Implemente uma função que simule o vencedor de uma
-- partida de pedra, papel e tesoura usando tipos criados. Casos de
-- empate devem ser considerados em seu tipo.

data PedraPapelTesoura = Pedra | Papel | Tesoura  deriving (Show, Read)

partida :: (PedraPapelTesoura, PedraPapelTesoura) -> String

partida (Papel, Papel) = "Empate"
partida (Papel, Tesoura) = "Tesoura venceu"
partida (Papel, Pedra) = "Papel venceu"

partida (Tesoura, Papel) = "Tesoura venceu"
partida (Tesoura, Tesoura) = "Empate"
partida (Tesoura, Pedra) = "Pedra venceu"

partida (Pedra, Papel) = "Papel venceu"
partida (Pedra, Tesoura) = "Pedra venceu"
partida (Pedra, Pedra) = "Empate"

-- Tendo como base o exercício de conversão de medidas,
-- crie uma função que faça conversão de câmbio. Você deve criar o
-- tipo Cambio contendo os value constructors Euro , Real e
-- Dollar . Crie também o tipo Moeda que possui os campos val
-- :: Double e cur :: Cambio . Use record syntax e as taxas de
-- conversão do dia no qual você fez o exercício.

data Cambio = Euro | Real | Dollar
  deriving (Show)

data Moeda = Moeda
  { val :: Double
  , cur :: Cambio
  } deriving (Show)

paraReal :: Moeda -> Double
paraReal (Moeda v Real) = v
paraReal (Moeda v Dollar) = v * 5.0
paraReal (Moeda v Euro) = v * 5.4

cambio :: Moeda -> Cambio -> Moeda
cambio m Real = Moeda (paraReal m) Real
cambio m Dollar = Moeda (paraReal m / 5.0) Dollar
cambio m Euro = Moeda (paraReal m / 5.4) Euro


-- Faça uma função chamada revNum , que receba uma
-- String s e um Int n . Esta deverá retornar as n primeiras letras
-- em ordem reversa e o restante em sua ordem normal. Exemplo:
-- revNum 4 "FATEC" = "ETAFC"

revNum :: String -> Int -> String
revNum s n = reverse (take n s) ++ drop n s 

-- Faça uma função chamada binList , usando list
-- compreeshion, que recebe uma lista de Binarios (ver exercício
-- anterior) e retorna outra lista com elemento somado Um e
-- convertido para Int . Exemplo:
-- binList [Um, Zero, Zero, Um, Zero] = [0,1,1,0,1]

data Binario = Um | Zero 

binList :: [Binario] -> [Int]
binList xs = [conv (soma b) | b <- xs]

soma :: Binario -> Binario
soma Zero = Um
soma Um = Zero

conv :: Binario -> Int
conv Zero = 0
conv Um = 1