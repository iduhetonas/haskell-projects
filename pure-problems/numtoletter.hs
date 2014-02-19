-- Swapping letters to numbers

class LetterDigit a where
  digit ::  a -> Int
  letter :: a -> Char

-- Is there a better way to do this?
instance LetterDigit Int where
  letter 1 = 'a'
  letter 2 = 'b'
  letter 3 = 'c'
  -- Ugh

instance LetterDigit Char where
  digit

--letterToNum :: String -> [Int]
--letterToNum (x:xs) = 
