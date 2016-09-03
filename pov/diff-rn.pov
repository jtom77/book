#include "mymacros.inc"

#declare camera_loc = <1,.3,1> * 3;
#declare look_at_loc = <0,0,0>;
#declare surfaceline_thickness = .005;
anpassen(0.3)
#declare pfeillaenge = .3;
#declare pfeilbreite = pfeillaenge/4;

camera {
  orthographic
  location <1.5,1,1>*4.3
  look_at <1,2,1>
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
#declare Fy = function(x,z) { exp(-.2*x*x-.2*z*z) * (0.5*sin(x) + .5*cos(z) +2) +1}


#declare px = 0.6;
#declare pz = 0.4;

#declare Graph = union{ 
  ParamNetNN( -1.4,4,-1.4,4,160, 160, 10,10 ) 
}

#declare dx = 0.01;
#declare p = -1.4;
#while(p<4)
  union{
    triangle{ <p,0,pz>, <p,Fy(p,pz),pz>, <p+dx,Fy(p+dx,pz),pz> }
    triangle{ <p+dx,0,pz>, <p+dx,Fy(p+dx,pz),pz>, <p,0,pz> }
    texture { pigment { White } finish{ ambient .4 }}
  }
  #declare p=p+dx;
#end

#declare p = -1.4;
#while(p<4)
  union{
    triangle{ <px,0,p>, <px,Fy(px,p+dx),p>, <px,Fy(px,p+dx),p+dx> }
    triangle{ <px,0,p+dx>, <px,Fy(px,p+dx),p+dx>, <px,0,p> }
    texture { pigment { White } finish{ ambient .4} }
  }
  #declare p=p+dx;
#end

union{
  cylinder{ <-1.4,0,pz>, <-1,Fy(-1.4,pz),pz>, 0.01 }
  cylinder{ <4,0,pz>, <4,Fy(4,pz),pz>, 0.01 }
  cylinder{ <px,0,-1.4>, <px,Fy(px,-1.4),-1.4>, 0.01 }
  cylinder{ <px,0,4>, <px,Fy(px,4),4>, 0.01 }
  cylinder{ <px,0,pz>, <px,Fy(px,pz),pz>, 0.01 }
  pigment{ Black }
}
  


object{
  koordinaten(2,.3,2)
}

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,.5> }
    finish{ ambient .9 diffuse .5 }
  }
  texture{Raster(4,0.005) translate x*px}
  texture{Raster(4,0.005) rotate 90*y translate z*pz}
}

object{
  Netz 
  texture{ 
    pigment{ color rgb<0,0,0> }
  }
}


#declare trans = get_tangent_transform(px,pz);

#declare inner = texture{
  pigment{White}
  finish{ambient .9}
}

#declare outer = texture{
  pigment{Black}
}

union{
  Pfeil(<-1,0,0>, <3,0,0> )
  Pfeil(<0,0,-1>, <0,0,3> )
  transform{trans}
}

object{
  koordinaten(6,3,6)
  translate <-2,0,-2>
}

background{ color rgb<1,1,1> }




