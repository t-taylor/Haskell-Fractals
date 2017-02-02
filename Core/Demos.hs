import DataTypes
import CoreSVG
import CoreIO
import Utils
import Recursive
import Constants
import AdvConstants
import Colouring

boundingBox = publishFullFigure $ centreFullFigure $ blueSq++greySq where
    greySq = [(greyF,greyL,findBBFullFigure blueSq)]
    blueSq = [(blueF,blueL,[(rot 35),(scale 2 1)] |=> square)]

infiniSquare = publishFullFigure colouredFractal where
    colouredFractal = colourizeFig (14,14,14,14,14,14) (0,0,255) recursiveSquare
    recursiveSquare = recursivePolygon newSquare [(scale 0.9 0.9),(translate 10 10),(rot 0.01)] 1000
    newSquare = [(scale 4 4), (translate 10 10)] |=> square

fibonacci = publishFullFigure $ colourizeFig greyF blueL $ centreFigure $ recursivePolygon ([(scale 0.01 0.01)] |=> square) [(rot 1),(scale 1.01 1.01), (translate 0 (-0.05))] 400

firstTree = publishFullFigure $ colourizeFig greyF blueL finalTree where
    finalTree = centreFigure $ concat $ concat tree
    tree = recursiveFigure_adv base treeFunc 10
    base = [[[(scale 0.4 1.4)] |=> square]]
    treeFunc = (\fig -> (leaf1 fig)++(leaf2 fig))
    leaf1 = map (\x -> [(translate 14 (-140)),(scale 0.75 0.75),(rot (-20))] |=> x)
    leaf2 = map (\x -> [(translate 0 (-140)),(scale 0.75 0.75),(rot 20)] |=> x)

customTree :: Fill -> Outline -> Int -> Float -> Float -> FullFigure
customTree fill outline branches scl rt = finalTree where
    finalTree = colourizeFig fill outline $ centreFigure $ concat $ concat tree
    tree = recursiveFigure_adv base treeFunc branches
    base = [[[(scale 0.4 1.4)] |=> square]]
    treeFunc = (\fig -> (leaf1 fig)++(leaf2 fig))
    leaf1 = map (\x -> [(translate 14 (-140)),(scale (scl) (scl)),(rot (-rt))] |=> x)
    leaf2 = map (\x -> [(translate 14 (-140)),(scale (scl) (scl)),(rot (rt))] |=> x)
    
publishTiling =  publishFullFigure $ colourizeFig greyF blueL $ centreFigure $ concat $ concat tiling
tiling =  recursiveFigure_adv [[base]] tile_func 2 where
    base = regularPolygon 100 6
    tile_func = (\fig -> (tile 60 fig)++(tile 120 fig)++(tile 180 fig)++(tile 240 fig)++(tile 300 fig)++(tile 360 fig))
    tile r = map (\x -> [(translate 0 0),(scale 0.75 0.75),(rot r)] |=> x)
    
main = publishTiling
    
-- main = do
    -- putStrLn "Fill Colour? "
    -- fillList <- getInts 6
    -- putStrLn "Outline Colour? "
    -- outlineList <- getInts 3
    -- putStr "Number of branches? "
    -- branches <- getInt
    -- putStr "scaling Factor? "
    -- scl <- getFloat
    -- putStr "angle? "
    -- rt <- getFloat
    -- let tree = customTree (r1,r2,g1,g2,b1,b2) (r,g,b) branches scl rt 
        -- r1:r2:g1:g2:b1:b2:_ = fillList
        -- r:g:b:_ = outlineList
    -- publishFullFigure tree
    -- putStrLn "Success!"
