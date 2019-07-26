solve line
  | diff < 0  = "Eu odeio a professora!"
  | diff >= 3 = "Muito bem! Apresenta antes do Natal!"
  | otherwise = "Parece o trabalho do meu filho!\n" ++ natalResult
  where
    (a:b:_) = fmap (\x -> read x::Int) (words line)
    diff = b - a
    natalResult
      = if a + 2 >= 24
          then
             "Fail! Entao eh nataaaaal!"
          else
             "TCC Apresentado!"

main = do
  fmap solve getLine >>= putStrLn
