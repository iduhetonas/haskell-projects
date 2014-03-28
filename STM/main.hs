-- file: ch28/GameInventory.hs
-- From http://book.realworldhaskell.org/read/software-transactional-memory.html
{-# LANGUAGE GeneralizedNewtypeDeriving #-}
module STM where

import GHC.Conc.Sync
import Control.Monad

data Item = Scroll
          | Wand
          | Banjo
            deriving (Eq, Ord, Show)

newtype Gold = Gold Int
    deriving (Eq, Ord, Show, Num)

newtype HitPoint = HitPoint Int
    deriving (Eq, Ord, Show, Num)

type Inventory = TVar [Item]
type Health = TVar HitPoint
type Balance = TVar Gold

data Player = Player {
      balance :: Balance,
      health :: Health,
      inventory :: Inventory
    }
