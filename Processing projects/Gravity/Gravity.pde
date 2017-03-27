float ballX = 250, ballY=400, ballSpeedY=0, ballDiameter = 50;
float gravity = 2;
float ground = 600;
void setup() {
  size(500, 800);
  frameRate(120);
  noStroke();
  fill(250);
}
void draw() {
  background(0);
  ellipse(ballX, ballY, ballDiameter, ballDiameter);

  stroke(255);
  line(0, ground+(ballDiameter/2)+5, 500, ground+(ballDiameter/2)+5);
  bouncing();
  gravity();
  moving();
}
void bouncing() {
  if (ballY >= ground) {
    ballSpeedY *=-1;
    ballY=ground;
    ballSpeedY+=gravity;
  }
}
void gravity(){
   ballSpeedY +=gravity;
}
void moving(){
   ballY+=ballSpeedY;
 }