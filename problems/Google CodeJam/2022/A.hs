{-# LANGUAGE OverloadedStrings #-}
import Data.List
import qualified Data.ByteString.Char8 as B8


b1 = "+"
b2 = "-+"
c1 = "|"
c2 = ".|"

l1 = "..+"
l2 = "..|"
l3 = B8.concat [b1, b2]

unlines' b = B8.concat (intersperse (B8.singleton '\n') b)

gen1 c =
  let
    l1' = l1:replicate c b2
    l2' = l2:replicate c c2
    l3' = l3:replicate c b2
  in
    unlines' $ fmap B8.concat [l1',l2',l3']


gen r c =
  let
    r1 = B8.concat (c1:replicate c c2)
    r2 = B8.concat (b1:replicate c b2)
    row = unlines' [r1,r2]
  in
    unlines' $ replicate r row
  

readInt' b =
  case B8.readInt b of
    Just (v, _) -> v
    _ -> error "bs: not read int"


input :: B8.ByteString -> (Int,Int)
input xs =
  case fmap readInt' $ B8.words xs of
    (a:b:_) -> (a,b)

solve (r,c) =
  unlines' [gen1 (c - 1),gen (r - 1) c]


solveCase [] _ ans = ans
solveCase (x:xs) i ans
  | i <= x = solveCase xs (i + 1) (ans + 1)
  | otherwise = solveCase xs i ans

main = do
  B8.interact
    $
    B8.unlines
    . fmap (\(a,b) -> B8.concat ["Case #", B8.pack $ show a, ":\n", b])
    . zip [1..]
    . fmap (solve . input)
    . tail
    . B8.lines
