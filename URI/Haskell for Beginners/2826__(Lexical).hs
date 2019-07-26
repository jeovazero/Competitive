import Data.List
(<|) a f = \x -> a (f x)

-- resolve :: [Char] -> [Char] -> ([Char], [Char]) -> [[Char]]
resolve [] (bx:_) (c, d) = [c, d]
resolve (_) [] (c,d) = [d, c]
resolve (a:xa) (b:xb) (c, d)
  | a == b = resolve xa xb (c,d)
  | a > b = [d, c]
  | otherwise = [c, d]

-- solve :: ([Char], [Char]) -> [[Char]]
solve (a, b)
  = resolve a b (a, b)

main = 
  interact $ unlines <| solve <| (\(a:b:_) -> (a,b)) <| lines
