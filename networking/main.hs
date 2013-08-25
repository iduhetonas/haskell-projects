
main = do
    putStrLn "Tell me a fact"
    fact <- getLine
    putStrLn ("Wow, I didn't know that " ++ map toLower fact ++ " was true!")
