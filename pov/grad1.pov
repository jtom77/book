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


#macro arr(start, stop, side, outer, inner )
  #local len = vlength(stop-start);
  
  #local D = vnormalize(stop-start);
  #local E = vnormalize(vcross(D,side));
  #local N = vcross(E,D);  
  #local th = .5;
  #local prism1 = 
  prism{ -1.00, 1.00, 4
    <-1.00, 0.00>,
    < 1.00, 0.00>,
    < 0.00, 2.00>,
    <-1.00, 0.00>}
  #local prism2 = 
  prism{ -1.01, 1.01, 4
    <-1.00+th, 0.00+th/3>,
    < 1.00-th, 0.00+th/3>,
    < 0.00, 2.00-th>,
    <-1.00+th, 0.00+th/3>}
  #local arrowhead = 
  union{
    difference{
      object{prism1 scale .5*x translate<0,0,-2>}
      object{prism2 scale .5*x translate<0,0,-2>}
      pigment{ Black }
    }
    object{
      prism2 scale .5*x translate<0,0,-2>
      texture{inner}
      //pigment{ White }
      //finish{ ambient .9 diffuse .5 }
    }
    rotate 90*y
    scale .2
    scale .1*y
    translate len*x
  }
  
  union{
    cylinder {
      <0,0,0>, <len-.2,0,0>, .02 scale .1*y
      pigment{ Black }
    }
    object{arrowhead}
    scale .1*y
    transform{ matrix<
      D.x,D.y,D.z,
      E.x,E.y,E.z,
      N.x,N.y,N.z,
      start.x,start.y,start.z>
    }
  }
#end


//#declare Fx = function(x,z) { x*cos(z) }
//#declare Fz = function(x,z) { x*sin(z) }
//#declare Fy = function(x,z) { pow(Fx(x,z),2)+pow(Fz(x,z),2) }

#declare _scale_ = .8;
#declare diff = 2*_scale_;

#declare Fx = function(x,z) {x}
#declare Fz = function(x,z) {z}
#declare Fy = function(x,z) { _scale_*(pow(x,2) + pow(z,2))}

#declare px = 1;
#declare pz = 1;

#declare Graph = union{ 
  ParamNetNN( -1.6,1.6,-1.6,1.6,120, 120, 8,8 ) 
}

object{
  koordinaten(2,.3,2)
}

object{
  Graph 
  texture{ 
    pigment{ color rgbt<.7,.7,.7,0> }
    finish{ ambient .9 diffuse .5 }
  }
  texture{Raster(4,0.005) translate x*px}
  texture{Raster(4,0.005) rotate 90*y translate z*pz}
  #declare __RasterClr__ = rgb<.5,.5,.5>;
  texture{Raster(4,0.005) rotate 45*y translate <px,0,pz>}
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
  arr(<0,0,0>,<diff,0,0>,<1,0,0>, outer, inner)
  arr(<0,0,0>,<0,0,diff>,<1,0,0>, outer, inner)
  arr(<0,0,0>,<diff,0,diff>,<1,0,0>, outer, texture{pigment{Black}})
  arr(<0,0,0>,<-diff,0,-diff>,<1,0,0>, outer, inner)
  translate(<px,0,pz>)
}

#declare A = <px,Fy(px,pz),pz>;


union{
  triangle{A, A+<1,0,0>, A+<1,diff,0>}
  triangle{A, A+<0,0,1>, A+<0,diff,1>}
  pigment{ White }
  finish{ ambient .9 }  
}

union{
  arr(A+<1,0,0>, A+<1,diff,0>, <1,0,0>, outer, inner)
  arr(A+<0,0,1>, A+<0,diff,1>, <0,0,1>, outer, inner)
}

union{
  cylinder{ A, A+<1,0,0>, .02 }
  cylinder{ A, A+<0,0,1>, .02 }
  pigment{Black}
}

union{
  cylinder{ <-2,0,0>, <3,0,0>, .02 }
  cylinder{ <0,0,-2>, <0,0,3>, .02 }
  transform{trans}
}

object{
  box{ <-1,-.001,-1>, <1,.001,1> }
  pigment{ White }
  finish{ ambient .3 }
  translate A
}

// box{
//   <-2,-.01,-2>, <3,0,3> 
//   translate -.01*y
//   texture{
//     pigment{ Grey }
//     finish{ ambient .9 }
//   }
//   #declare __RasterClr__ = rgb<.5,.5,.5>;
//   texture{ Raster(_scale_,.02) }
//   texture{ Raster(_scale_,.02) rotate 90*y}
// }
  


background{ color rgb<1,1,1> }




