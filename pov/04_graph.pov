#include "mymacros.inc"

#declare camera_loc = <1,.3,1> * 1.5;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .4;
#declare pfeilbreite = pfeillaenge/4;

camera {
  orthographic
  location <5,2.6,-4.2>*1.6
  look_at <0,0,0>
}

light_source {
  <100,100,100>
  color rgb <1,1,1> 
  shadowless
}

#declare _scale_ = .8;
#declare diff = 2*_scale_;

#declare Fx = function(x,z) {x}
#declare Fz = function(x,z) {z}
#declare Fy = function(x,z) { 
  5*sin(x*z)/(0.2+pow(x,2)+pow(z,2))
}

#declare Graph = union{
  ParamNetNN( -4,4,-4,4,160, 160, 20,10 )
}

object{koordinaten(5,2.5,5)}

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.1> }
    finish{ ambient .9 diffuse .5 }
  }
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}






background{ color rgb<1,1,1> }




