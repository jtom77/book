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
  texture{ Raster(4,0.005) rotate 30*y }
  texture{ Raster(4,0.005)  }
  texture{ Raster(4,0.005) rotate 90*y }
}


object{
  Netz
  texture{
    pigment{ color <0.5,0.5,0.5> }
    finish{ ambient .2 }
  }
  texture{ Raster(4,0.005) rotate 30*y }
  texture{ Raster(4,0.005)  }
  texture{ Raster(4,0.005) rotate 90*y }
  
}



#declare w = 0.03;

#declare __RasterClr__ = rgbt<.5,.5,.5,0>;
#declare obj = union {
  box{ <0,0,0>,<1,.001,1>
    texture{ 
      pigment{ color rgbt<1,1,1,0> }
      finish{ ambient .4 }
    }
    
    texture{ Raster(.1,.006) }
    texture{ Raster(.1,.006) rotate 90*y }
  }
  //   texture{
  //     pigment{
  //       gradient x
  //       scale .2
  //       color_map{
  //         [0 color rgb<0,0,0>]
  //         [w color rgb<0,0,0>]
  //         [w color rgbt<1,1,1,1>]
  //         [1-w color rgbt<1,1,1,1>]
  //         [1-w color rgb<0,0,0>]
  //       }
  //     }  
  //   }  

  //   texture{
  //     pigment{
  //       gradient z
  //       scale .2
  //       color_map{
  //         [0 color rgb<0,0,0>]
  //         [w color rgb<0,0,0>]
  //         [w color rgbt<1,1,1,1>]
  //         [1-w color rgbt<1,1,1,1>]
  //         [1-w color rgb<0,0,0>]
  //       }
  //     }
  //   }
  // }

  union{
    Pfeil(<0,0,0>, <0,0,1>) 
    Pfeil(<0,0,0>, <1,0,0>) 
    object{
      Pfeil (<0,0,0>, <0,0,1>) 
      rotate 30*y
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
}  

union{
  object{obj}

  matrix<
  B.x, B.y, B.z,
  N.x, N.y, N.z,
  C.x, C.y, C.z,
  A.x, A.y, A.z>
}  


anpassen(0.5)
object{
  koordinaten(2,1,2)
  translate<-1,0,-1>
  }