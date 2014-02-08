{- |
Module      :  checksum.hs
Description :  Creates a simple Fletcher's checksum on a file
Copyright   :  (c) Tyler Huffman, reddit.com/r/dailyprogrammer
License     :  BSD3

Maintainer  :  tyler.huffman@tylerh.org
Stability   :  experimental 
Portability :  portable 


-}
import Data.ByteString as B
import Data.Bits
import Data.Word
import Control.Monad.State


checksumWord :: [Word8] -> Word16
checksumWord bytes = 
  let (c0, c1) = checksumWord' Prelude.foldr (\acc x -> acc + x `mod` 255) 0 bytes
  in  bytePack c0 c1

checksumWord' :: State ->
checksumWord' [] = []
checksumWord' (x:xs) = (x + checksumWord' xs, 

bytePack :: Word8 -> Word8 -> Word16
bytePack byte1 byte2 = (toWord16 byte1 .|. (shift (toWord16 byte2) 8)) :: Word16

toWord16 :: Word8 -> Word16
toWord16 byte = fromIntegral byte 



main = print $ checksumWord [1, 2]
  
  
