# LightGrid

This is a solution to the first problem of the functional programming
challenge for CS Games 2018. I have used this as an exercise in learning
the functional programming paradigm through Haskell.

This solution may not be optimal, but I think it works :)

## Dependencies

 - `split ^0.2.3.3`
    ```
    cabal install split
    ```

## Building and running

Install `stack`, clone this repo, and run:

    stack build
    stack exec lights-exe input.txt

## Results

The number of lit squares that this program calculates (after executing
all the instructions from input.txt sequentially) is 640436.

I don't know if this is the correct solution, but I learned how basic
parsing and `foldr` work :smile:

## TODO

Test this?
