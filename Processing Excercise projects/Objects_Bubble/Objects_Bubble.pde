

Bubble b;
void setup() {
  size(800, 500);
  b = new Bubble();
}

void draw() {
  background(255/2);
  b.display();
  b.ascend();
  b.top();
}