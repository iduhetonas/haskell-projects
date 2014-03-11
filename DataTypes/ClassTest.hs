-- In this class, I can USE the data instance of AnonClass, but I'm not allowed 
-- to actually construct it
module Main where
import ClassExample


main :: IO ()
main = printAnon $ anonClass "Hello"

printAnon :: (Show a) => AnonClass a -> IO ()
printAnon = print
