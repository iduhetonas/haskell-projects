--See "A fistful of monads" on learnyouahaskell.com

type Birds = Int
type Pole = (Birds,Birds)

applyMaybe :: Maybe a -> (a -> Maybe b) -> Maybe b
applyMaybe Nothing f = Nothing
applyMaybe (Just x) f = f x

x -: f = f x

landLeft :: Birds -> Pole -> Maybe Pole  
landLeft n (left,right)  
    | abs ((left + n) - right) < 4 = Just (left + n, right)  
    | otherwise                    = Nothing  
  
landRight :: Birds -> Pole -> Maybe Pole  
landRight n (left,right)  
    | abs (left - (right + n)) < 4 = Just (left, right + n)  
    | otherwise                    = Nothing  

foo :: Maybe String
foo = do
    x <- Just 3
    y <- Nothing
    Just (show x ++ y)

pierre :: Maybe Pole
pierre = do
    start <- return (0,0)  
    first <- landLeft 2 start  
    Nothing  
    second <- landRight 2 first  
    landLeft 1 second  

wopwop :: Maybe Char  
wopwop = do  
    (x:xs) <- Just ""  
    return x 
