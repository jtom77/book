#include "mymacros.inc"

#declare camera_loc = <1,.1,1> ;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .25;
#declare pfeilbreite = pfeillaenge/4;
#declare t_surfaceline = texture{ 
  pigment{ rgbt<.6,.6,.6,0> } 
  finish{ ambient .6 phong .4 reflection .5 } 
}

camera {
  orthographic
  location <1.5,.6,-1>*6
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
#declare Fy = function(x,z) { .1*x+exp(-cos(x)*cos(x)-sin(z)*sin(z)) +1 }

#declare Graph = union{ 
  ParamNetNN( -3,3, -3, 3,120, 120, 6,6 ) 
}

#declare a = 1;

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.6> }
    finish{ ambient .9 diffuse .5 }
  }
  texture{Raster(5,.01) translate<a,0,0> }
  texture{Raster(6,.01) translate<-3,0,0> }
  texture{Raster(6,.01) rotate 90*y translate<0,0,-3> }
}

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.1> }
    finish{ ambient .9 diffuse .5 }
  }
  texture{Raster(5,.01) translate<a,0,0> }
  texture{Raster(6,.01) translate<-3,0,0> }
  texture{Raster(6,.01) rotate 90*y translate<0,0,-3> }
  scale .01*y
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}

#declare inc = 0.1;
#declare i = -3;
#while(i<3)
  #local p1 = <a,0,i>;
  #local p2 = <a,0,i+inc>;
  #local p3 = <a,Fy(a,i),i>;
  #local p4 = <a,Fy(a,i+inc),i+inc>;
  union{
    triangle{ p1,p2,p4 }
    triangle{ p1,p3,p4 }
    texture{
      pigment{ White }
      finish{ ambient .8 }
    }
  }
  #declare i=i+inc;
#end
  
union{
  cylinder{ <a,0,3>, <a,Fy(a,3),3>, 0.03 }
  cylinder{ <a,0,-3>, <a,Fy(a,-3),-3>, 0.03 }
  scale .001*x 
  translate a*x
  pigment{ Black }
}

#declare inner = texture{
  pigment{White}
  finish{ambient .9}
}

#declare outer = texture{
  pigment{Black}
}



background{ color rgb<1,1,1> }




