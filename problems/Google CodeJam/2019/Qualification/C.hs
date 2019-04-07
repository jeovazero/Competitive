module Main where
import Text.Printf
import qualified Data.Map as Map

mapList _ [] = []
mapList char (x:xs) = (x, char):mapList (succ char) xs

removeDup :: Eq a => a -> [a] -> [a]
removeDup c [] = c:[]
removeDup c (a:xs)
  | c == a = removeDup c xs
  | otherwise = c:(removeDup a xs)

partition :: (Ord a) => a -> [a] -> [a] -> [a] -> ([a], [a])
partition _ [] ls hs = (ls, hs)
partition p (x:xs) ls hs
  | x <= p = partition p xs (x:ls) hs
  | otherwise = partition p xs ls (x:hs)

qsort :: Ord a => [a] -> [a]
qsort [] = []
qsort (x:xs) = qsort ls ++ (x:qsort hs)
    where (ls, hs) =  partition x xs [] []

mdc :: Integral a => a -> a -> a
mdc a b
    | b == 0 = a
    | otherwise = mdc b r
    where r = mod a b

splitOnEquals left (x:y:ys)
  | x == y = splitOnEquals (x:left) (y:ys)
  | otherwise = (left, (x:y:ys))

getFirst :: Integral a => [a] -> a
getFirst (a:b:_) = div a q where q = mdc a b

discoverNumbers :: Integral a => a -> [a] -> [a]
discoverNumbers x [] = [x]
discoverNumbers x (h:t) = x:(discoverNumbers x' t) where x' = div h x

getLetter number dict =
  case (Map.lookup number dict) of
    Just x  -> x
    Nothing -> ' '

decodeList enc dict = map (\x -> getLetter x dict) enc

solve :: (Integral a, Show a, PrintfArg a) => a -> a -> [a] -> IO String
solve n l ps = do
    let (left, right) = splitOnEquals [] ps
    let pivo = getFirst right
    let encB = discoverNumbers pivo right
    let encA = reverse (discoverNumbers pivo left)
    let encodedList = (init encA) ++ encB
    let sorted = qsort encodedList
    let keys = removeDup (head sorted) sorted
    let dict = Map.fromList (mapList 'A' keys)
    let decoded = decodeList encodedList dict
    return decoded

readIntegers = do
    line <- getLine
    return ( map (read::String->Integer) (words line) )


testCase :: Int -> Int -> IO()
testCase _ 0 = return ()
testCase i t = do
    [n, l] <- readIntegers
    products <- readIntegers
    ans <- solve n l products
    printf "Case #%d: %s\n" i ans
    testCase (i + 1) (t - 1)

main :: IO()
main = do
    t' <- getLine
    let t = read t' :: Int
    testCase 1 t
