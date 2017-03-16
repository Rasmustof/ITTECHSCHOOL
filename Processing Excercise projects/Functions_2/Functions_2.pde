int size = 10;
int rectCount = 0;
void setup() {
  background(0);
  size(500, 500);
}
void draw() {
  if (rectCount < 5)drawRectangle(size);
}
void drawRectangle(int initialSize) {
  noFill();
  stroke(255);
  rect(5, 5, initialSize, initialSize);
  size = initialSize*2;
  rectCount++;
}