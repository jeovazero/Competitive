(<|) f g = \x -> f (g x)

steps _ prev [] list = [prev:list]
steps diff prev (next:ys) list
  | curDiff == diff = steps diff next ys (prev:list)
  | otherwise = list:(steps curDiff next ys [])
    where curDiff = next - prev

solve (x:[]) = 1
solve (prev:next:xs)
  = length $ steps (next - prev) next xs [prev]

main = do
  interact $ show <| solve <| map read <| words <| head <| tail <| lines
  putChar '\n'
