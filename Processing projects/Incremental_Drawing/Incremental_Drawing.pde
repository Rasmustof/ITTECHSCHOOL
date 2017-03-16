float p = 0.99;
void setup(){
  size(400,400);
}
void draw(){
 // println(p);
  line(p,0,p,400);
  line(0,p,400,p);  
  p *=1.1;
}