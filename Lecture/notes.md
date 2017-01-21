# Lecture Notes

## Aims of this Lecture

* Understand how the Bounding Box image was created
  * The svg generation
  * How the initial Square was made
    * [Affine transformations](https://en.wikipedia.org/wiki/Affine_transformation)
    * DataTypes.hs and Haskell's module structure
  * How we can use Haskell's type system to make the bounding box

### What is SVG?

So understanding svg isn't crucial to understanding the rest of this program.
Hence why i am going to cover only the basics. Firstly svg stands for Scalable Vector Graphics.
And it is essentially a mark-up language which can be used to create vector shapes.
For our purposes we can consider svg to be made of 2 main components:
  * A start tag, which contains the attributes and metadata about the graphic.

``` svg
<svg height="100" width="100" xmlns="http://www.w3.org/2000/svg"> shape stuff here </svg>
```

  * A list of 'polygons' which can also contain attributes
  
``` svg
shape stuff here = <polygon points="0,0 0,100 100,100 100,0 " style="fill:#000000;stroke:rgb(221,221,221);stroke-width:5"/>
```

This polygon we just defined is a list of x,y points. It goes from one point to the next
so this will draw a line from 0,0 to 0,100 then to 100,100 then 100,0 and
implicitly it goes back to the starting point as its a polygon.

It also has fill specified by the Hex code and the outline is 5 pixel thick and is coloured
by the rgb value.

Finally the full SVG for this square would be as such:

``` svg
<svg height="100" width="100" xmlns="http://www.w3.org/2000/svg">
    <polygon points="0,0 0,100 100,100 100,0 " style="fill:#000000;stroke:rgb(221,221,221);stroke-width:5"/>
</svg>
```

Which when rendered looks like such:

![eg1](eg1.svg)

### Using Haskell to Produce SVG

Thinking about the SVG in a different way, if we think about what a polygon actually is
it can really be broken down into a list of points. Where each point is an x,y value.

By looking at a snippet from DataTypes.hs I have made some new types in Haskell which 

### Building the initial square
