#include "golds.inc"
#include "metals.inc"
#include "mymacros.inc"

anpassen(0.3)
#declare surfaceline_thickness = .003;

camera {
  orthographic
  location <2,.5,3> 
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
  ParamNetNN(-pi/2,pi/2, .5*pi, 2*pi, 100,100,10,10) 
}

object{
  Graph
  texture{
    pigment{ color rgbt<.9,.9,.9,0> }
    finish{ ambient .4 }
  }
  texture{ Raster(4,0.005) rotate -90*y }
  texture{ Raster(4,0.005) }  
  texture{ Raster(4,0.005) rotate 90*z translate <0,sin(pi/5),0>}
}

object{
  Netz
  texture{
    pigment{ color <0.5,0.5,0.5> }
    finish{ ambient .2 }
  }
  texture{ Raster(4,0.005) rotate -90*y }
  texture{ Raster(4,0.005) }  
  texture{ Raster(4,0.005) rotate 90*z translate <0,sin(pi/5),0>}
}

#declare Graph = union {
  ParamNetNN(-pi/2,pi/2, 0, 2*pi, 100,100,10,10) 
}

object{
  Graph
  texture{ Raster(4,0.005) rotate -90*y }
  texture{ Raster(4,0.005) }  
  texture{ Raster(4,0.005) rotate 90*z translate <0,sin(pi/5),0>}
}



object{
  sphere{<0,0,0>, 1}
  scale 0.001*y
  pigment{ color White }
  finish{ ambient .8 }
}


#declare w = 0.03;

#declare __RasterClr__ = rgbt<.5,.5,.5,0>;
#declare obj = union {
  box{ <-1,0,-1>,<1,.001,1>
    texture{ 
      pigment{ color rgbt<1,1,1,.6> }
      finish{ ambient .5 }
    }
    
    texture{ Raster(2,.006) translate <1,0,0> }
    texture{ Raster(2,.006) rotate 90*y translate <0,0,1> }
  }

  union{
    object{Pfeil (<0,0,0>, <0,0,.8>)} 
    object{Pfeil (<0,0,0>, <.8,0,0>)}
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

Pfeil(<0,0,0>, <Fx(pi/5,2*pi),Fy(pi/5,2*pi),Fz(pi/5,2*pi)>)

union{
  object{obj}
  get_manifold_tangent_transform(pi/5,2*pi)
}  



