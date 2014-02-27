mean :: Fractional a => [a] -> a
mean list = sum(list) / fromIntegral(length(list))
