import Data.List

answer = 1 + length $ nub [hoge | base <- [2..9],expo <- takeWhile (\x -> digit (base ^ x) <= x) [1..],let hoge = base ^ expo, digit hoge == expo]
digit = ceiling . logBase 10 . fromIntegral
