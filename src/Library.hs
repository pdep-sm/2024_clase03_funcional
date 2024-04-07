module Library where
import PdePreludat
import ShowFunction
{-
-- Otro ejemplo de como puede ser la Cobertura
type TipoDeChocolate = String
data Cobertura = Chocolate TipoDeChocolate | SinCobertura
-}
data Cobertura = ChocolateAmargo | ChocoateBlanco | ChocolateLeche | SinCobertura deriving Show
-- data Cobertura con multiples constructores

data Churro = Churro {
    relleno :: String,
    cobertura :: Cobertura,
    precio :: Number,
    esVegano :: Bool
} deriving Show
-- Data Churro, definido con Record Syntax

churroBase = Churro "dulce de leche" SinCobertura 100 False

veganizar churro = churro{ esVegano = True }
-- copiamos un data churro, gracias al record syntax
length' :: [a] -> Number
length' [] = 0
length' (_:xs) = 1 + length' xs

-- elem' unAlgo [ListaDeAlgo] 
elem' _ [] = False
elem' e (x:xs) = e == x || elem' e xs 
-- Short Circuit: si e==x es True, no hace falta que siga evaluando el resto
-- Podemos pensar el Short Circuit, como un caso fundamental y básico de Lazy Evaluation
{-
Pregunta surgida de clase: Cómo podemos evitar lo que causa la recursividad? (Uso de stack, baja performance...)
La respuesta es "tail recursion", lo pueden googlear, no es parte de la materia, ni lo vamos a pedir.
En particular, evitamos el uso de recursividad siempre, debido a que nos aleja de la declaratividad.
-}

-- Consultas que hicimos para jugar con Lazy Evaluation:
-- > [1..]
-- > take 10 [1..]
-- > (take 10 . drop 20) [1..]
-- > (repeat . veganizar) churroBase
-- > (take 10 . repeat . veganizar) churroBase
-- > 1/0 -- produce un error, como toda divisón por 0
-- > fst (1, 1/0) -- anda perfecto gracias a Lazy Evaluation

{- 
Importante vincular la existencia de la Lazy Evaluation, con la Transparencia referencial.
Dado que no puedo causar ningun efecto colateral en mi programa, puedo decidir no ejecutar expresiones que no necesito.
-}





