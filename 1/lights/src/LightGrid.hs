module LightGrid where

import Data.Bool
import Data.List
import Data.List.Split

-- typedefs and helper functions that better define the problem
type Light = (Int, Int, Bool)
type Grid = [Light]
type Pos = (Int, Int)

getX :: Light -> Int
getX (x, _, _) = x

getY :: Light -> Int
getY (_, y, _) = y

getB :: Light -> Bool
getB (_, _, b) = b

turnon :: Light -> Light
turnon (x, y, b) = (x, y, True)

turnoff :: Light -> Light
turnoff (x, y, b) = (x, y, False)

toggle :: Light -> Light
toggle l = if getB(l) == True then turnoff l else turnon l

-- createGrid creates a grid where all lights are initialized to off
createGrid :: Int -> Int -> Grid
createGrid w h = [(x,y,b) | x <- [0,1..w-1], y <- [0,1..h-1], b <- [False]]

-- instruction data type describes the action that is to be performed;
-- either turn on, turn off, or toggle the state of a light
data Instruction = On Pos Pos | Off Pos Pos | Toggle Pos Pos deriving Show

-- parse parses a string into an instruction
-- note: this function is horribly fragile!
parse :: String -> Instruction
parse s
    | isInfixOf "turn on" s = On p q
    | isInfixOf "turn off" s = Off p q
    | isInfixOf "toggle" s = Toggle p q
    where s' = splitOn " to " s
          p = read ("(" ++ (last $ splitOn " " (s' !! 0)) ++ ")") :: Pos
          q = read ("(" ++ (s' !! 1) ++ ")") :: Pos

-- execute executes an instruction on a grid, modifying the light states for the
-- rectangle that is defined by the coodinates p and q in the Instruction
execute :: Instruction -> Grid -> Grid
execute (On p q) grid = map (\(x,y,b) ->
                            if (x,y) >= p && (x,y) <= q then
                                turnon (x,y,b)
                            else (x,y,b)) grid
execute (Off p q) grid = map (\(x,y,b) ->
                             if (x,y) >= p && (x,y) <= q then
                                 turnoff (x,y,b)
                             else (x,y,b)) grid
execute (Toggle p q) grid = map (\(x,y,b) ->
                                if (x,y) >= p && (x,y) <= q then
                                    toggle (x,y,b)
                                else (x,y,b)) grid
