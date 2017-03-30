import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;

float gravity;

//SMILEY
PImage neutralSmiley;
PImage deadSmiley;
PImage happySmiley;

float smileyX;
float smileyY;
float smileyDiameter;
float smileySpeedY = 0;
float smileySpeedX;
float smileyJumpSpeed;
float smileyUpCounter = 0;
float smileyUpCounterMax = 50;
boolean smileyJump = false;
boolean smileyCanJump = true;
boolean smileyDead = false;
boolean smileyShouldJump = false;
boolean keys[] = new boolean[526];

//PLAYING GROUND
float groundLineY;
float platformX;
float platformY;
float platformWidth;
float platformHeight;



void setup() {
  neutralSmiley = loadImage("neutralSmiley.png");
  deadSmiley = loadImage("deadSmiley.png");
  happySmiley = loadImage("happySmiley.png");
 fullScreen();
 // size(800, 500);
  background(255);
  frameRate(60);
  imageMode(CENTER); 
  
  //Variable depending of screen size - Updating
  gravity = height*0.00004629629;
  println(gravity);
  smileyX =width/10;
  smileyY =height;
  smileyDiameter = height/10.8;
  platformX = width/2;
  platformY = height/1.2;
  platformWidth = width/12.8;
  platformHeight = height/54;
  smileyJumpSpeed = height/216;
  smileySpeedX = width/384;
}


void draw() {
  //  println(height);
  background(255);
  drawHLine();
  drawPlatform();
  smileyControl();
  smileyBouncing();
  smileyGravity();
  smileyMoving();
  keyChecker();
  
}
void smileyControl() {
  //SMILEY JUMP CONTROL
  if (smileyY < groundLineY-(smileyDiameter/2)) {
    smileyCanJump = false;
    smileyJump = true;
  } else {
    smileyCanJump= true;
    smileyJump = false;
    smileyUpCounter = 0;
  }
  if (smileyY <= 0) {
    smileyY = 50;
  }

  //SMILEY STATE
  int state = 0;
  if (smileyDead == true)state = 1;
  else if (smileyJump == false)state = 0;
  else if (smileyJump == true)state = 2;  


  switch(state) {
    case(0):
    drawSmiley("alive");
    break; 
    case(1):
    drawSmiley("dead");
    break;
    case(2):
    drawSmiley("happy");
    break;
  }
}
void drawSmiley(String state) {

  switch(state) {
    case("alive"):
       image(neutralSmiley, smileyX, smileyY, smileyDiameter, smileyDiameter);
      break;
    case("dead"):
      image(deadSmiley, smileyX, smileyY, smileyDiameter, smileyDiameter);
      break;
    case("happy"):
      image(happySmiley, smileyX, smileyY, smileyDiameter, smileyDiameter);
      break;
  }
}
void smileyBouncing() {
  if (smileyY >= groundLineY-(smileyDiameter/2)) {
    smileySpeedY *=0;
    smileyY=groundLineY-(smileyDiameter/2);
    smileySpeedY+=gravity;
  }
  else if(smileyY+(smileyDiameter/2) > platformY && smileyY+(smileyDiameter/2) < platformY +5){
    if(smileyX+(smileyDiameter/2) > platformX && smileyX-(smileyDiameter/2) < platformX+platformWidth){
     smileySpeedY *=0;
    smileyY=platformY-(smileyDiameter/2);
    smileySpeedY+=gravity;
    smileyCanJump=true;
    smileyJump = false;
    }
   
  }
}

void smileyMoving() {
  smileyY+=smileySpeedY;

  if (smileyShouldJump) {
    if (smileyUpCounter < smileyUpCounterMax) {
      smileyY -= smileyJumpSpeed;
      smileyUpCounter++;
    } else {
      smileyShouldJump = false;
      smileyUpCounter = 0;
    }
  }
}
void smileyGravity() {
  smileySpeedY +=gravity;
}
void drawHLine() {
  groundLineY = height/1.05;
  strokeWeight(2);
  stroke(0);
  line(0, groundLineY, width, groundLineY);
}
void drawPlatform(){
  fill(0);
  rect(platformX,platformY,platformWidth,platformHeight);
}

void keyChecker() {

  if (checkKey("SPACE")) {
    if (smileyDead == false && smileyCanJump) {
      smileyShouldJump= true;
    }
  }
  if (checkKey("RIGHT")) {
    //move right
    if (smileyX < width-50) {
      smileyX += smileySpeedX;
    }
  }
  if (checkKey("LEFT")) {
    //move left
    if (smileyX > 50) {
      smileyX -= smileySpeedX;
    }
  }
  if (checkKey("r")) {

    if (smileyDead) {
      smileyDead = false;
    }
  }
}


void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{ 
  keys[keyCode] = false;
}
boolean checkKey(String k) {
  for (int i = 0; i < keys.length; i++)
    if (KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i];  
  return false;
}