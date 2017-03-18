float ballX = 250,ballY=400,ballSpeed=0,ballDiameter = 50;
float gravity = 9.87;

void setup(){
  size(500,800);
  frameRate(10);
  noStroke();
  fill(250);
}
void draw(){
    background(0);
    ellipse(ballX,ballY,ballDiameter,ballDiameter);
    if(ballY <= 608){
      ballSpeed +=gravity;
  ballY+=ballSpeed;
}
    stroke(255);
    line(0,617.13995+(ballDiameter/2)+4,500,617.13995+(ballDiameter/2)+4);
    
    if(ballY >= 600 && !(ballY > 700))ballSpeed *=-1;
    //if(ballY > 750)ballSpeed = 0;
    println(ballY);
}