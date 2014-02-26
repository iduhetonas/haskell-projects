main = do
    print "How old are you?"
    age <- getLine
    let amountOfPunches = birthdayPunches $ read age :: Int
    print $ "You get " ++ show amountOfPunches ++ " birthday punches!!"

birthdayPunches :: Int -> Int
birthdayPunches 0 = 0
birthdayPunches x = x + birthdayPunches (x - 1)
