input mydefs;
u := 1cm;
ahlength := 2cm;

beginfig(1);

  path p,q,r; 
  p := (0,0)..(0,4)..(7,0);
  q := (0,0)..(0,2)..(7,0);
  r := (0,0)..(0,6)..(7,0);
  drawarrow p scaled u;
  draw q scaled u;
  draw r scaled u;

endfig;
end
