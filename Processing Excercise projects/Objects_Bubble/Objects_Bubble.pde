

Bubble b;
void setup(){
  size(800,500);
 b = new Bubble();
}

void draw(){
  b.display();
  b.ascend();
  b.top();
}