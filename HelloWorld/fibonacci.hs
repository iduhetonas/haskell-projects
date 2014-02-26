main = do
    print "Give me a fibonacci number to start!"
    fibInput <- getLine
    let fibOutput = fibonacci $ read fibInput :: Int
    print $ "Your fibonacci result is " ++ show fibOutput ++ "!"

fibonacci :: Int -> Int
fibonacci 0 = 0
fibonacci 1 = 1
fibonacci x = fibonacci (x - 1) + fibonacci (x - 2)
