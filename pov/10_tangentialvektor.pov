#include "golds.inc"
#include "metals.inc"
#include "mymacros.inc"

anpassen(0.3)
#declare surfaceline_thickness = .003;

camera {
  orthographic
  location <2,1.4,3> 
  look_at<0,0,0>
}

light_source {
  <0,100,100>
  color rgb <1,1,1> * 1
  shadowless
}

background{ color rgb<1,1,1> }

#declare Fx = function(x,z) { x }
#declare Fz = function(x,z) { z }
#declare Fy = function(x,z) { .3*(-x*x-z*z) +1.3 }

#declare Graph = union {
  ParamNetNN(-1,1,-1,1,100,100,4,4) 
}

object{
  Graph
  texture{
    pigment{ color rgbt<.9,.9,.9,0> }
    finish{ ambient .4 }
  }
  texture{ Raster(4,0.005) rotate -30*y }
}


object{
  Netz
  texture{
    pigment{ color <0.5,0.5,0.5> }
    finish{ ambient .2 }
  }
  texture{ Raster(4,0.005) rotate -30*y }
}



#declare w = 0.03;

#declare __RasterClr__ = rgbt<.5,.5,.5,0>;
#declare obj = union {
  box{ <-1,0,-1>,<1,.001,1>
    texture{ 
      pigment{ color rgbt<1,1,1,.4> }
      finish{ ambient .6 }
    }
    
    texture{ Raster(2,.006) translate <1,0,0> }
    texture{ Raster(2,.006) rotate 90*y translate <0,0,1> }
  }

  union{
    object{
      Pfeil (<0,0,0>, <0,0,-1>) 
      rotate -30*y
    }
    scale <0,.1,0>
    pigment{ color Black }
  }  
}

#declare xx = 0;
#declare zz = 0;
#declare dd = .001;

#local A = <Fx(xx,zz),Fy(xx,zz),Fz(xx,zz)>;
#local Dx = <Fx(xx+dd,zz),Fy(xx+dd,zz),Fz(xx+dd,zz)>;
#local Dz = <Fx(xx,zz+dd),Fy(xx,zz+dd),Fz(xx,zz+dd)>;

#local B = 1000*(Dx-A);
#local C = 1000*(Dz-A);
#local N = vnormalize(vcross(C,B));

union{
  object{obj}
  get_tangent_transform(0,0)
}  



