import Geometry
import qualified Geometry.Sphere as Sphere  
import qualified Geometry.Cuboid as Cuboid  
import qualified Geometry.Cube as Cube  

demo1 = sphereVolume 5
demo1' = Sphere.volume 5

demo2 = sphereArea 5
demo2' = Sphere.area 5

demo3 = cuboidArea 1 2 3
demo3' = Cuboid.area 1 2 3

demo4 = cuboidVolume 1 2 3
demo4' = Cuboid.volume 1 2 3

demo5 = cubeVolume 5
demo5' = Cube.volume 5

demo6 = cubeArea 5
demo6' = Cube.area 5