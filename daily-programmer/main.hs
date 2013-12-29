import qualified Data.List.Split as Sp

main = do
    contents <- readFile "input.txt"
    print $ Sp.splitOn "\n" contents


