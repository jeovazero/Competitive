{-# LANGUAGE OverloadedStrings #-}
import Data.List
import qualified Data.ByteString.Char8 as B8

readInt' b =
  case B8.readInt b of
    Just (v, _) -> v
    _ -> error "bs: not read int"


groupPair :: [B8.ByteString] -> [[Int]]
groupPair [] = []
groupPair (_:b:xs) = (fmap readInt' $ B8.words b):groupPair xs

solve la = solveCase (sort la) 1 0 

solveCase [] _ ans = ans
solveCase (x:xs) i ans
  | i <= x = solveCase xs (i + 1) (ans + 1)
  | otherwise = solveCase xs i ans

main = do
  B8.interact
    $ B8.unlines
    . fmap (\(a,b) -> B8.concat ["Case #", B8.pack $ show a, ": ", B8.pack $ show b])
    . zip [1..]
    . fmap solve
    . groupPair
    . tail
    . B8.lines
