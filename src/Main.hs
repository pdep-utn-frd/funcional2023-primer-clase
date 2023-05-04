-- Funcional - Primera Clase
-- Temas:
-- Introduccion y tipos de datos, pattern matching


factorial :: Integer -> Integer
factorial 0 = 1
factorial n = n * factorial (n - 1)

--     1er arg  2do     retorno  
conjuncion True  True  = True
conjuncion False _     = False
conjuncion True  False = False

esPar :: Integer -> Bool
esPar unNumero = mod unNumero 2 == 0

esImpar :: Integer -> Bool
esImpar unNumero = not (esPar unNumero)

-- Pattern Matching
esVocal :: Char -> Bool
esVocal unaLetra = False
esVocal 'a'      = True
esVocal 'e'      = True
esVocal 'i'      = True
esVocal 'o'      = True
esVocal 'u'      = True



f 2 = 2
f x = x * x

palabra :: String
palabra = "hola"

palabra2 :: String
palabra2 = " como estas?"

palabra3 :: [Char]
palabra3 = palabra ++ palabra2

-- Cosas que se pueden hacer con un string:
-- - concatenar  (++)
-- - take y drop 
-- - 


reemplazar :: String -> String -> String
reemplazar reemplazo _ = reemplazo ++ "hola"


sumarTupla :: (Bool, Bool, Bool) -> Bool
sumarTupla (x, y, z) = x && not y || x && z

-- Aca se usa where para definir variables locales
-- suma 2 vectores en R2
sumarVectores :: (Float, Float) -> (Float, Float) -> (Float, Float)
sumarVectores primerTupla segundaTupla = (primerComponente, segundaComponente)
    where
    primerComponente  = fst primerTupla + fst segundaTupla
    segundaComponente = snd primerTupla + snd segundaTupla

concatenarListas l1 l2 = l1 ++ l2
concatenarTupla :: (a, b) -> (c, d) -> (a, b, c, d)
concatenarTupla (x, y) (w, z) = (x, y , w , z)

primerYUltimaLetra :: String -> (Char, Char)
primerYUltimaLetra palabra = (head palabra, last palabra)
