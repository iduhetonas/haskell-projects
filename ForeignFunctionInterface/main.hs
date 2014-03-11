-- Found at http://book.realworldhaskell.org/read/interfacing-with-c-the-ffi.html
module Main where

import Math

main :: IO ()
main = mapM_ (print . fastsin) [0/10, 1/10 .. 10/10]
