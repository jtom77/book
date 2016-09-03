#include "golds.inc"
#include "metals.inc"
#include "mymacros.inc"

anpassen(0.3)
#declare surfaceline_thickness = .006;

camera {
  orthographic
  location <2,1,3> 
  look_at<0,0,0>
}

light_source {
  <0,100,100>
  color rgb <1,1,1> * 1
  shadowless
}

background{ color rgb<1,1,1> }

#declare Fx = function(x,z) { cos(x)*cos(z) }
#declare Fz = function(x,z) { cos(x)*sin(z) }
#declare Fy = function(x,z) { sin(x) }

#declare Graph = union {
  ParamNetNN(-pi/2,pi/2, 0, 2*pi, 100,120,2,8) 
}

object{
  Graph
  texture{
    pigment{ color rgbt<.9,.9,.9,.7> }
    finish{ ambient .1 }
  }
  texture{ Raster(4,0.002) rotate 90*z translate <0,sin(pi/5),0>}
  texture{ Raster(4,0.002) rotate 90*z }
}

object{
  Netz
  texture{
    pigment{ color <0.5,0.5,0.5> }
    finish{ ambient .2 }
  }

}


object{
  sphere{<0,0,0>, 1}
  scale 0.001*y
  pigment{ color White }
  finish{ ambient .9 }
}

object{
  sphere{<0,0,0>, 1}
  scale 0.001*y
  scale cos(pi/5)
  translate <0,sin(pi/5),0>
  pigment{ color White }
  finish{ ambient .9 }
}


#declare w = 0.03;

#declare __RasterClr__ = rgbt<.5,.5,.5,0>;
#declare obj = union {
  box{ <-1,0,-1>,<1,.001,1>
    texture{ 
      pigment{ color rgbt<1,1,1,0> }
      finish{ ambient .9 }
    }
    
    texture{ Raster(2,.006) translate <1,0,0> }
    texture{ Raster(2,.006) rotate 90*y translate <0,0,1> }
  }
}


// union{
//   object{obj}
//   object{obj translate <0,sin(pi/5),0> }
// }  
