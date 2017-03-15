boolean isEyeOpen = true;
int eyeX = 50;
int eyeY = 250;
int eyeXSpeed = 5;
int eyeYSpeed = 5;
int eyeWidth = 100;

void setup() {
  size(500, 500);
}
void draw() {
  background(120);
  eyeControl();
  drawEye(isEyeOpen, eyeX, eyeY, eyeWidth, 50);
  
  eyeMovement();
}
void drawEye(boolean isOpen, int x, int y, int widthL, int widthS) {
  if (isOpen) {
    noStroke();
    fill(255);
    ellipse(x, y, widthL, widthL);
    fill(0);
    ellipse(x, y, widthS, widthS);
  }
}
void eyeControl() {
  println(dist(eyeX, eyeY, mouseX, mouseY));
  if (dist(eyeX, eyeY, mouseX, mouseY)<50) {
    isEyeOpen=false;
  }else if (mousePressed) {
    isEyeOpen= false;
  } else isEyeOpen = true;
}
void eyeMovement() {
  eyeX += eyeXSpeed;
  eyeY += eyeYSpeed;
  if (eyeX>= width -50|| eyeX <= 50) {
    eyeXSpeed *= -1;
  }
  if (eyeY>= height-50|| eyeY <= 50) {
    eyeYSpeed *= -1;
  }
}