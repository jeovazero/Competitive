(<|) f g = \x -> f (g x)

{-|
  we have b < c
  a is unknown
-}
medianPoint a b c = min (max a b) c


dist cp p1 p2 =
  let
    m = medianPoint cp p1 p2
  in
    abs (cp - m)


toCases [] = []
toCases (a:b:xs) = (a,b):toCases xs


radiusDamageBy power level =
  let
    pos = level - 1 
  in
  case power of
    "fire" -> ([20, 30, 50] !! pos, 200)
    "water" -> ([10, 25, 40] !! pos, 300)
    "earth" -> ([25, 55, 70] !! pos, 400)
    "air" -> ([18, 38, 60] !! pos,100)


solve (a, b) =
  let
    (power:xb) = words b
    [w, h, x, y] = map read $ words a
    [level, cx, cy] = map read xb
    (r, damage) = radiusDamageBy power level
    dx = dist cx x (x + w)
    dy = dist cy y (y + h)
    hit = (dx * dx) + (dy * dy) <= (r * r)
  in
    case hit of
      True -> damage
      False -> 0

main = do
  interact $ unlines <| map (show <| solve) <| toCases <| tail  <| lines
