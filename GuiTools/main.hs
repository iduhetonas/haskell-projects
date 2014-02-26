{-# Language TemplateHaskell #-}
module Main where

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder
import System.Glib.Signals
import System.Exit
import qualified Data.ByteString.Char8 as CB
import qualified Data.ByteString as B
import Data.FileEmbed


myFile :: B.ByteString
myFile = $(embedFile "./helloworld.glade")

main = do
    initGUI
    builder <- builderNew
    builderAddFromString builder (CB.unpack myFile)

    mainWindow <- builderGetObject builder castToWindow "mainwindow"
    --onDestroy mainWindow mainQuit
    

    button1 <- builderGetObject builder castToButton "button1"
    on button1 buttonActivated $ do
      putStrLn "Hello World!"

    button2 <- builderGetObject builder castToButton "button2"
    on button2 buttonActivated $ do
      exitWith ExitSuccess
      
    --buttonActivated (on button1ko

    widgetShowAll mainWindow
    mainGUI
