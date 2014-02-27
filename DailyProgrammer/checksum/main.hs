{- |
Module      :  checksum.hs
Description :  Creates a simple Fletcher's checksum on a file
Copyright   :  (c) Tyler Huffman, reddit.com/r/dailyprogrammer
License     :  BSD3

Maintainer  :  tyler.huffman@tylerh.org
Stability   :  experimental 
Portability :  portable 


-}
import qualified Data.ByteString as BS (unpack)
import qualified Data.ByteString.Char8 as CBS (pack)
import Data.Bits (shift, (.|.))
import Data.Word (Word8, Word16)
import Data.Char


checksumWord :: [Word8] -> Word16
checksumWord bytes = 
  let result = Prelude.foldl addValues (0,0) bytes
  in  bytePack result

addValues :: (Word8, Word8) -> Word8 -> (Word8, Word8)
addValues (c0, c1) byte = 
  let r0 = c0 + byte `mod` 255
      r1 = c1 + r0 `mod` 255
  in (r0, r1)

bytePack :: (Word8, Word8) -> Word16
bytePack (byte1, byte2) = (toWord16 byte1 .|. (shift (toWord16 byte2) 8)) :: Word16

toWord16 :: Word8 -> Word16
toWord16 byte = fromIntegral byte 


main :: IO ()
main = do
  print "Run Fletcher checksum!"
  -- This probably doesn't need to be packed and unpacked...
  print $ checksumWord . BS.unpack $ CBS.pack "HelloHelloHello" 
