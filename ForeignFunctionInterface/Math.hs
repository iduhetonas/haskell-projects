{-# LANGUAGE ForeignFunctionInterface #-}
-- Found at http://book.realworldhaskell.org/read/interfacing-with-c-the-ffi.html
--
-- The purpose of this module is to do some simple imports of 
-- C functions into Haskell
module Math where

import Foreign
import Foreign.C.Types

foreign import ccall "math.h sin"
  c_sin :: CDouble -> CDouble

fastsin :: Double -> Double
fastsin x = realToFrac (c_sin (realToFrac x))
