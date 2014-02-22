module Main where

import Graphics.UI.Gtk
import Graphics.UI.Gtk.Builder

main = do
    initGUI
    builder <- builderNew
    builderAddFromFile builder "helloworld.glade"

    mainWindow <- builderGetObject builder castToWindow "mainwindow"
    --onDestroy mainWindow mainQuit

    helloWorldButton <- builderGetObject builder castToButton "button1"
    --onClicked helloWorldButton (putStrLn "Hello World")

    widgetShowAll mainWindow
    mainGUI

