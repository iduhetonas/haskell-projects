module Main where

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder
import System.Glib.Signals
import System.Exit

main = do
    initGUI
    builder <- builderNew
    builderAddFromFile builder "helloworld.glade"

    mainWindow <- builderGetObject builder castToWindow "mainwindow"
    --onDestroy mainWindow mainQuit
    

    button1 <- builderGetObject builder castToButton "button1"
    on button1 buttonActivated $ do
      putStrLn "Hello, world!"

    button2 <- builderGetObject builder castToButton "button2"
    on button2 buttonActivated $ do
      exitWith ExitSuccess
      
    --buttonActivated (on button1ko

    widgetShowAll mainWindow
    mainGUI
