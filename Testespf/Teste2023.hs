module TestePf.Teste2023 where

--9 de Janeiro de 2023

--1 
unlines' :: [String] -> String
unlines' [] = ""
unlines' (h:t) = h ++ "\n" ++ unlines' t 

-- 2
-- (a)
type Mat = [[Int]]

stringToMat :: String -> Mat
stringToMat s = map stringToVector (lines s)

stringToVector :: String -> [Int]
stringToVector s = map read (words s)


-- (b)  não sei 


--3 
-- (a)
data Lista a = Esq a (Lista a) | Dir (Lista a) a | Nula

semUltimo :: Lista a -> Lista a
semUltimo (Esq a l) = Esq a (semUltimo l)
semUltimo (Dir l a) = l
semUltimo Nula = Nula 

-- (b)
instance Show a => Show (Lista a) where 
  show :: Lista a -> String 
  show l = show (conv l)

conv :: Lista a -> [a]
conv Nula = [] 
conv (Esq a l) = a : conv l 
conv (Dir l a) = conv l ++  [a]

--4 

data BTree a = Empty | Node a (BTree a) (BTree a)


inorder :: BTree a -> [a]
inorder Empty = []
inorder (Node r e d) = (inorder e) ++ (r:inorder d)

--a 
numera :: BTree a -> BTree (a,Int)
numera arv = snd (numeraAux 1 arv)

numeraAux :: Int -> BTree a -> (Int,BTree (a,Int))
numeraAux n Empty        = (0,Empty)
numeraAux n (Node i e d) = let (ne,e1) = numeraAux n e
                               (nd,d1) = numeraAux (n+ne+1) d
                           in (ne+nd+1, Node (i,n+ne) e1 d1)

--b  não sei se está certo 
unInorder :: [a] -> [BTree a]
unInorder [] = [Empty]
unInorder (h:t) = Node h Empty Empty : concatMap (\tree -> [Node h tree Empty, Node h Empty tree]) (unInorder t)

