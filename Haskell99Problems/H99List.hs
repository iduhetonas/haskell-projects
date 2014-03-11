{- 
 This is a bunch of Haskell list problems, defined here:
 http://www.haskell.org/haskellwiki/H-99:_Ninety-Nine_Haskell_Problems
-}
module H99List where
import Data.List (foldl')
import System.Random



-- Problem #1!
myLast :: [a] -> a
myLast (x:xs) | null xs = x 
              | otherwise = myLast xs

-------------------------------------------------------------------------------

-- Problem #2!
-- Efficient implementation
myButLast :: [a] -> a 
myButLast (x:_:[]) = x
myButLast (_:xs) = myButLast xs
                     

-- This is very inefficient, since it's O(n^2) with the length calls
myButLast' :: [a] -> a
myButLast' (x:xs) = if length xs == 1
                   then x
                   else myButLast' xs

-------------------------------------------------------------------------------

-- Problem #3!
-- Yes, we could easily do "list !! index", but I don't believe
-- this is in the spirit of the problem

elementAt :: [b] -> Int -> b
elementAt (x:xs) index | index == 0 = x
                       | otherwise = elementAt xs (index - 1)

-------------------------------------------------------------------------------

-- Problem #4!
myLength :: [a] -> Int
myLength [] = 0
myLength (_:xs) = (myLength xs) + 1


-------------------------------------------------------------------------------


-- Problem #5!
-- This time using folds, with a really awesome article: 
-- http://www.haskell.org/haskellwiki/Foldr_Foldl_Foldl'
myReverse :: [a] -> [a]
myReverse list = foldl' (\acc x -> x : acc) [] list


-------------------------------------------------------------------------------

-- Problem #6!
isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome list = 
  let reverseList = myReverse list
  in list == reverseList

-------------------------------------------------------------------------------

-- Problem #7!

-- Data definition of NestedList in the problem
data NestedList a = Elem a | List [NestedList a]

flatten :: NestedList a -> [a]
flatten (List a) = foldl' (++) [] $ map flatten a
flatten (Elem a) = [a]


-------------------------------------------------------------------------------

-- Problem #8!

compress :: (Eq a) => [a] -> [a]
compress (x:y:xs) | x == y = compress (y:xs)
                  | otherwise = x : compress (xs)
compress (x:[]) = x : []

-------------------------------------------------------------------------------

-- Problem #9!
--
-- [a,a,a,a,b,b,b,c,c,c]
-- ([a,a,a,a],[b,b,b,c,c,c])
-- first = [a,a,a,a]
-- second = [b,b,b,c,c,c]
--
-- [[a,a,a,a], second]
--
-- So close!
--pack ::(Eq a) => [a] -> [[a]]
--pack all@(x:xs) = 
--  let list = break (x /=) all
--      first = fst list
--      second = snd list
--  in [first, second]

-- Adapted from http://www.haskell.org/haskellwiki/99_questions/Solutions/9
pack ::(Eq a) => [a] -> [[a]]
pack [] = []
pack (x:xs) = (x : takeWhile (==x) xs) : pack (dropWhile (==x) xs)


-------------------------------------------------------------------------------

-- Problem #10!
-- Due to the nature of map functions, I guarantee there's a 
-- cooler way to do this
encode :: (Eq a) => [a] -> [(Int, a)]
encode list =
  let pkList = pack list
  in toTuple pkList 
  where toTuple (x:xs) = _toTuple x : toTuple xs
        toTuple _ = []
        _toTuple (x:[]) = (1, x)
        _toTuple rest@(x:_) = (length rest, x)


-------------------------------------------------------------------------------

data Encode a b = Multiple Int b 
                | Single b 
                deriving (Eq, Show)

-- Problem #11!
encodeModified :: (Eq a) => [a] -> [Encode b a]
encodeModified list = 
  let pkList = pack list
  in toTuple pkList
  
    where toTuple (x:xs) = _toTuple x : toTuple xs
          toTuple [] = []
          _toTuple (x:[]) = Single x
          _toTuple rest@(x:_) = Multiple (length rest) x

-------------------------------------------------------------------------------

-- Problem #12!
decodeModified :: [Encode a Char] -> String
decodeModified = concat . map (dMod) 
  where dMod (Multiple x y) = replicate x y
        dMod (Single x) = [x]

-------------------------------------------------------------------------------

-- Problem #13!
-- Didn't I already do this?


-------------------------------------------------------------------------------

-- Problem #14!
dupli :: (Eq a) => [a] -> [a]
dupli (x:xs) = x : x : dupli xs
dupli _ = []


-------------------------------------------------------------------------------

-- Problem #15!
-- Easy way to solve
repli :: (Eq a) => [a] -> Int -> [a]
repli (x:xs) idx = replicate idx x ++ repli xs idx
repli _ _ = []

-- Direct way to solve
--repli :: String -> Int -> String
--repli (x:xs) index =
--  case rep x


-------------------------------------------------------------------------------

-- Problem #16!
-- Bit of an awkward solution
dropEvery :: (Eq a) => [a] -> Int -> [a]
dropEvery list 0   = list
dropEvery _    1   = []
dropEvery list idx = 
  case splitAt (idx - 1) list of
    (first, []) -> first
    (first, rest) -> first ++ dropEvery (tail rest) idx


-------------------------------------------------------------------------------

-- Problem #17!
-- Inefficient, since it walks through the list twice
split :: [a] -> Int -> ([a], [a])
split list idx = 
  let l1 = splitLeft  list idx 
      l2 = splitRight list idx
      in (l1, l2)
    where
      splitLeft  (x:xs) ix  | ix /= 0   = x : splitLeft xs (ix - 1)
                            | otherwise = [] 
      splitLeft    _    _   = []
      splitRight (x:xs) ix  | ix /= 0   = splitRight xs (ix - 1)
                            | otherwise = x : splitRight xs 0
      splitRight   _    _   = []


-------------------------------------------------------------------------------

-- Problem #18!
slice :: [a] -> Int -> Int -> [a]
slice _      1   0    = []
slice (x:xs) 1   high = x : slice xs 1 (high - 1)
slice (_:xs) low high = slice xs (low - 1) (high - 1)


-------------------------------------------------------------------------------

-- Problem #19!
-- Despite being two-star, this was incredibly straight-forward. Still
-- inefficient though, as the list is sequenced twice
rotate :: [a] -> Int -> [a]
rotate list idx = 
  let l0 = take idx list
      l1 = drop idx list
  in l1 ++ l0

-------------------------------------------------------------------------------

-- Problem #20!
removeAt :: Int -> [b] -> (b, [b])
removeAt idx list = 
  let p0 = list !! (idx - 1)
      l1 = dropLetter idx list
  in (p0, l1)
    where 
      dropLetter 1   (_:xs) = dropLetter (0) xs
      dropLetter ix  (x:xs) = x : dropLetter (ix - 1) xs
      dropLetter _   []     = []

-------------------------------------------------------------------------------

-- Problem #21!
insertAt :: a -> [a] -> Int -> [a]
insertAt elmnt  []    idx | idx == 1  = elmnt : []
                          | otherwise = []
insertAt elmnt (x:xs) idx | idx == 1  = elmnt : x  : insertAt elmnt xs (idx - 1)
                          | otherwise = x     :      insertAt elmnt xs (idx - 1) 

-------------------------------------------------------------------------------

-- Problem #22!
range :: Int -> Int -> [Int]
range low high = take high [low..]

-------------------------------------------------------------------------------

-- Problem #23!
rnd_select :: [a] -> Int -> IO [a]
rnd_select list idx = do
  globRand <- newStdGen
  let upper        = (length list) - 1
      randomInf    = randomRs (0, upper) globRand
      randomSelect = take idx randomInf
  return $ toRand randomSelect
    where
      toRand []      = []
      toRand (x:xs)  = (list !! x) : toRand xs

-------------------------------------------------------------------------------
--
-- Problem #24!
diff_select :: Int -> Int -> [Int]
diff_select num size = do
  x <- [1..size] 
  guarded (randomIO :: IO Bool) $ return x
  where
    guarded :: IO Bool -> Bool
    guarded xs = return xs



-------------------------------------------------------------------------------
--
-- Problem #25!
--
-------------------------------------------------------------------------------

-- Problem #26!
combination :: Int -> String -> [String]
combination num list = do
  x <- list
  return [x]
