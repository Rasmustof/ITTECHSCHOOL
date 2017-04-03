class Bubble {
  float x, y;
  int diameter;
  boolean atTop;
  Bubble() {
    x = width/2;
    y = height;
    diameter = 60;
    atTop = false;
  }
  void display(){
    ellipse(x,y,diameter,diameter);
  }
  void ascend(){
    if(!atTop){
      y--;
    }
  }
  void top(){
    if (y <= 0){
      atTop = true;
    }
  }
}