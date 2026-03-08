module Aula3 where
-- Usuário Garcia Github:@romefeller

-- Tipos de dados algebricos: Tipos que carregam informações (records).
data Curso = ADS | SI | CD | RH | LOG | GE | GP
    deriving Show

-- data Aluno = Aluno String Int Curso deriving Show
data Aluno = Aluno {
    nomeAluno :: String,
    idadeAluno :: Int,
    cursoAluno :: Curso
} deriving Show

-- com pattern matching
fazerAniversario :: Aluno -> Aluno
fazerAniversario (Aluno nome idade curso) = 
    Aluno nome (idade + 1) curso

-- sem pattern matching
fazerAniversario' :: Aluno -> Aluno
fazerAniversario' aluno = Aluno {
    nomeAluno = nomeAluno aluno,
    idadeAluno = idadeAluno aluno + 1,
    cursoAluno = cursoAluno aluno
}

-- TIPOS DE ENUMERACAO
-- Show eh um typeclass que rege os tipos imprimiveis na tela
data DiaSemana = Domingo | Segunda | Terca | Quarta | Quinta | Sexta | Sabado
                deriving (Enum, Show, Eq, Ord, Read)

toInt :: DiaSemana -> Int
toInt x = 
    case x of
        Domingo -> 0
        Segunda -> 1
        Terca   -> 2
        Quarta  -> 3
        Quinta  -> 4
        Sexta   -> 5
        Sabado  -> 6

-- Pattern Matching: Desconstroi a variavel de entrada da funcao de acordo com o padrao definido no tipo
toInt' :: DiaSemana -> Int
toInt' Domingo  = 0
toInt' Segunda  = 1
toInt' Terca    = 2
toInt' Quarta   = 3
toInt' Quinta   = 4
toInt' Sexta    = 5
toInt' Sabado   = 6

-- Funcao Parcial: Uma funcao ao qual o pattern matching ou case não cobre todos os casos
-- Funcao Total: PM ou case cobre todos os casos
toDia :: Int -> Maybe DiaSemana
toDia 0 = Just Domingo
toDia 1 = Just Segunda
toDia 2 = Just Terca
toDia 3 = Just Quarta
toDia 4 = Just Quinta
toDia 5 = Just Sexta
toDia 6 = Just Sabado
toDia _ = Nothing


-- Tipo da esquerda (String): Erro
-- Tipo da direita (DiaSemana): Acerto
toDia' :: Int -> Either String DiaSemana
toDia' 0 = Right Domingo
toDia' 1 = Right Segunda
toDia' 2 = Right Terca
toDia' 3 = Right Quarta
toDia' 4 = Right Quinta
toDia' 5 = Right Sexta
toDia' 6 = Right Sabado
toDia' _ = Left "Dia invalido"

agenda :: DiaSemana -> String
agenda Segunda  = "Dia de trabralhar"
agenda Terca    = "Dia de Haskellao"
agenda Quinta   = "Dia de Bagre"
agenda Sexta    = "Dia de maldade"
agenda Sabado   = "Dia de balada"
agenda _        = "Dia nada"
