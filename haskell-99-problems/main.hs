module Main (main) where
import H99Prob 

main = do
  --print . isPalindrome $ "The pig thought he could fly"
  --print . isPalindrome $ "racecar"
  --print . isPalindrome $ "Racecar"
  --print . flatten $ (List [Elem 1, List [Elem 2, List [Elem 3, Elem 4], Elem 5]])
  print . compress $ "kkkkkkkkkkkkkkaaaaaaayyyyyyyyyyyyyyyyyylllllllllaaaaaaaaaaaaaaaaa"
