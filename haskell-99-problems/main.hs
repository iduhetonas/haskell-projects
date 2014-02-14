module Main (main) where
import H99Prob 

main = do
  print . isPalindrome $ "The pig thought he could fly"
  print . isPalindrome $ "racecar"
  print . isPalindrome $ "Racecar"
