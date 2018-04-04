module Main where

import System.Environment
import Data.Bool
import LightGrid

main :: IO ()
main = do
    args <- getArgs
    content <- readFile (args !! 0)
    let inputLines = lines content
    let grid = createGrid 1200 1200
    let instructions = map parse inputLines
    let soln = foldr execute grid instructions
    -- putStrLn $ show soln
    let lights = filter (\x -> (getB x) == True) soln
    putStrLn $ show $ length lights
    -- putStrLn $ show lights
    -- putStrLn $ show instructions
