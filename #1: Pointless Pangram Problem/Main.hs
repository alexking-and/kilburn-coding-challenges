module Main where

import System.Environment

import Data.Char
import Data.List

main :: IO ()
main = do
    [f] <- getArgs
    s <- readFile f
    print (calculateResult (countPangrams (lines s)))

calculateResult :: (Integer, Integer, Integer) -> Integer
calculateResult (perf, nonperf, non) = perf * nonperf - non

countPangrams :: [String] -> (Integer, Integer, Integer)
countPangrams xs = countPangrams' xs (0, 0, 0)

countPangrams' :: [String] -> (Integer, Integer, Integer) -> (Integer, Integer, Integer)
countPangrams' [] count = count
countPangrams' (x:xs) (perf, nonperf, non) =
    if isPangram x
        then if length (toAlphaString x) == 26
            then countPangrams' xs (perf + 1, nonperf, non)
            else countPangrams' xs (perf, nonperf + 1, non)
        else countPangrams' xs (perf, nonperf, non + 1)

toAlphaString :: String -> String
toAlphaString = map toLower . filter isAlpha

isPangram :: String -> Bool
isPangram = (==26) . length . nub . toAlphaString
