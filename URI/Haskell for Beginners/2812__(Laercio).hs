import Data.List

(<|) f g = \x -> f (g x)

toCases [] = []
toCases (a:b:xs) = (a,b):toCases xs

merge [] [] = []
merge [] (b:[]) = [b]
merge (a:xa) (b:xb) =
  b:a:merge xa xb

solve (_,b) =
  let
    num = map (read::String -> Int) $ words b
    odds = sort $ filter (\x -> mod x 2 /= 0) num
    lenOdd = length odds
    (low, high) = splitAt (div lenOdd 2) odds
  in
    unwords $ map show $ merge low (reverse high)

main = do
  interact $ unlines <| map solve <| toCases <| tail <| lines
