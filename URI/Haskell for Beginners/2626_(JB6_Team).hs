dodo = "Os atributos dos monstros vao ser inteligencia, sabedoria..."
leo = "Iron Maiden's gonna get you, no matter how far!"
pepper = "Urano perdeu algo muito precioso..."
draw = "Putz vei, o Leo ta demorando muito pra jogar..."

-- papel - tesoura - pedra

test (a, pa) (b, pb)
  | a == b = 0
  | mod (b - a + 3) 3 == 1 = 0
  | otherwise = 1

indexed list = im list 0
  where
    im [] n = []
    im (x:xs) n = (y,n):(im xs (n + 1))
      where
        y = case x of
              "papel" -> 0
              "tesoura" -> 1
              "pedra" -> 2

analize list x = (sum $ map (test x) list, snd x)

resolve list =
  let
    listx = indexed list
    ans = filter (\x -> fst x == 2) $ fmap (analize listx) listx
  in
    if ans == [] then draw
    else
      let
        ((_, pa):_) = ans
      in
        case pa of
          0 -> dodo
          1 -> leo
          2 -> pepper

solve list
  = fmap (resolve . words) list
    
main = do
  interact $ unlines . solve . lines
