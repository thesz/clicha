module Main where

import qualified Data.List as List

import System.Random

celsius0 :: Double
celsius0 = 271.3

logCelsius0 :: Double
logCelsius0 = log celsius0

gaussians01 :: [Double] -> [Double]
gaussians01 (x:y:xys)
	| r2 >= 1 || r2 == 0 = gaussians01 xys
	| otherwise = u : v : gaussians01 xys
	where
		r2 = x^2 + y^2
		r = sqrt r2
		u = x / r
		v = y / r

baseRandoms :: [Double]
baseRandoms = gaussians01 $ randomRs (-1.0, 1.0) (mkStdGen 19730414)

temperatures :: [Double]
temperatures = map (exp . (+ logCelsius0)) baseRandoms

avg :: [Double] -> Double
avg xs = (/ fromIntegral (length xs)) $ sum xs

cuts :: Int -> Int -> [Double] -> ([[Double]], [Double])
cuts nsamples len xs = loop nsamples [] xs
	where
		loop n cs xs
			| n <= 0 = (cs, xs)
			| otherwise = loop (n-1) (cut : cs) xs'
			where
				(cut, xs') = List.splitAt len xs

simulateIncreaseOfObservations :: [Double] -> [(Int, Double)]
simulateIncreaseOfObservations rs = loop 1 100 rs
	where
		loop ns len rs = map (\c -> (len, avg c)) cs ++ loop ns (len+1) rs'
			where
				(cs, rs') = cuts ns len rs

main = do
	putStrLn "nsamples;avg"
	mapM_ (\(l, x) -> putStrLn $ show l ++ ";"++show x) $ take 20 $ simulateIncreaseOfObservations temperatures
