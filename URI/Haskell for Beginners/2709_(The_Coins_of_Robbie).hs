 {-# LANGUAGE UnicodeSyntax #-}
import System.IO
import Text.Printf

(<|) f g = \x -> f (g x)

hasDivisor n k
  | k * k > n = False
  | otherwise = (mod n k == 0) || hasDivisor n (k + 1)

isPrime 0 = False
isPrime 1 = False
isPrime 2 = True
isPrime n =
  not (hasDivisor n 2)

toCases [] = []
toCases (x:xs) =
  let
    (h, hs) = splitAt (x + 1) xs
  in
    (x:h):toCases hs

summ [] _ _ = 0
summ (c:cs) j n
  | n == j = c + (summ cs j nn)
  | otherwise = summ cs j nn
    where
      nn = if modn == 0 then j else modn
      modn = mod (n + 1) j

solve (x:xs) =
  let
    (coins, [jump]) = splitAt x xs
    n = summ (reverse coins) jump jump
    ans = isPrime n
  in
   -- show n ++ " " ++ show ans
   case ans of
      False -> "Bad boy! I\8217ll hit you."
      True -> "You\8217re a coastal aircraft, Robbie, a large silver aircraft."

main = do
  input <- getContents
  hSetEncoding stdout utf8
  printf "%s" $ (unlines <| map solve <| toCases <| map read <| lines) input
