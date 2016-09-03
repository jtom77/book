#include "mymacros.inc"

#declare camera_loc = <1,.1,1> * 1.5;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .25;
#declare pfeilbreite = pfeillaenge/4;

camera {
  orthographic
  location <1.5,1,-1>*6
  look_at <0,0,0>
}

light_source {
  <100,100,100>
  color rgb <1,1,1> 
  shadowless
}

#declare _scale_ = .8;
#declare diff = 2*_scale_;

#declare Fx = function(x,z) { x}
#declare Fz = function(x,z) { z}
#declare Fy = function(x,z) { exp(x)*sin(z) }

#declare Graph = union{ 
  ParamNetNN( -5,1.3, -2*pi, 2*pi,160, 160, 20,10 ) 
}


object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.1> }
    finish{ ambient .9 diffuse .5 }
  }
  texture{Raster(6.3,.005) translate<-5,0,0> }
  texture{Raster(4*pi,.005) rotate 90*y translate<0,0,2*pi> }
  texture{Raster(10,.005) rotate 90*y  }
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}


object{
  box {
    <-5,-1,-2*pi>, <1.3,1,2*pi>
  }
  scale .01*y
  texture{
    pigment{ color rgbt<.8,.8,.8,.8> }
    finish{ ambient .7 }
  }
  texture{Raster(6.3,.005) translate<-5,0,0> }
  texture{Raster(4*pi,.005) rotate 90*y translate<0,0,2*pi> }
  texture{Raster(10,.005) translate<0,0,0> }
  texture{Raster(10,.005) rotate 90*y  }
}


#declare inner = texture{
  pigment{White}
  finish{ambient .9}
}

#declare outer = texture{
  pigment{Black}
}



background{ color rgb<1,1,1> }




