#include "mymacros.inc"

#declare camera_loc = <1,.3,1> * 1.5;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .25;
#declare pfeilbreite = pfeillaenge/4;

camera {
  orthographic
  location <1.5,0.8,.8>*6
  look_at <0,1,0>
}

light_source {
  <100,100,100>
  color rgb <1,1,1> 
  shadowless
}

#declare _scale_ = .8;
#declare diff = 2*_scale_;

#declare Fx = function(x,z) { (2+cos(x))*cos(z) }
#declare Fz = function(x,z) { (2+cos(x))*sin(z)  }
#declare Fy = function(x,z) { sin(x) }


#declare Graph = union{
  ParamNetNN(0,2*pi,0,2*pi,120,120,12,12)
}


object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.1> }
    finish{ ambient .4 diffuse .5 }
  }
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}

#declare x1 = 0.5/3*pi;
#declare x2 = 0.5*pi;
#declare z1 = 0.5/3*pi;
#declare z2 = 0.5*pi;
#declare Graph = union{
  ParamNetNN(x1,x2,z1,z2,100,120,4,12)
}

object{
  Graph 
  texture{ 
    pigment{ White }
    finish{ ambient .9 diffuse .5 }
  }
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}

object{
  Graph 
  scale .01*y translate -2*y
  texture{ 
    pigment{ White }
    finish{ ambient .5 diffuse .5 }
  }
}

object{
  Netz
  scale .01*y translate -2*y
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}

#declare p1 = <Fx(x1,z1),Fy(x1,z1),Fz(x1,z1)>;
#declare p2 = <Fx(x1,z2),Fy(x1,z2),Fz(x1,z2)>;
#declare p3 = <Fx(x2,z1),Fy(x2,z1),Fz(x2,z1)>;
#declare p4 = <Fx(x2,z2),Fy(x2,z2),Fz(x2,z2)>;
union{
  cylinder{ p1, <p1.x,-2,p1.z>, 0.01}
  cylinder{ p2, <p2.x,-2,p2.z>, 0.01}
  cylinder{ p3, <p3.x,-2,p3.z>, 0.01}
  cylinder{ p4, <p4.x,-2,p4.z>, 0.01}
  pigment{Black}
}


////////////////////////////////////////////

union{
  box{ <-1,-1,-1>, <1,1,1> scale .01*y }
  texture{ pigment{ White } finish{ ambient .9 }}
  texture{ Raster(0.2,0.05) }
  texture{ Raster(0.2,0.05) rotate 90*y}
  rotate 45*y
  translate <-4,-2,4>

}


background{ color rgb<1,1,1> }




