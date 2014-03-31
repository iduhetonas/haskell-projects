-- Example on 
-- http://book.realworldhaskell.org/read/concurrent-and-multicore-programming
-- .html
module MVar where
import Control.Concurrent

communicate = do
  m <- newEmptyMVar
  forkIO $ do
    v <- takeMVar m
    putStrLn ("received " ++ show v)
  putStrLn "sending"
  putMVar m "wake up!"
