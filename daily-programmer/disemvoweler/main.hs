{- This function reads input.txt, and separates the vowels from the consonants 
 - and prints them both
 -}

main = do
  str <- readFile "input.txt"
  (consonants, vowels) <- splitVowels str
  print $ reverse consonants
  print $ reverse vowels

splitVowels :: String -> IO (String, String)
splitVowels path = return $ foldl _splitVowels ([],[]) path

_splitVowels :: (String, String) -> Char -> (String, String)
_splitVowels (consonants, vowels) inVal 
  | (`elem` "aeiou") inVal = (consonants, (inVal : vowels))
  | otherwise = ((inVal : consonants), vowels)
