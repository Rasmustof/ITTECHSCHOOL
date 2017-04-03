import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;

float gravity;

//SMILEY
Player p;
PImage neutralSmiley;
PImage deadSmiley;
PImage happySmiley;


//KEY CHECKING
boolean keys[] = new boolean[526];

//PLAYING GROUND
float groundLineY;

//PLATFORMS
int platformCount = 1;
float platformSpacing;
Platform[] plats = new Platform[platformCount];




void setup() {
  neutralSmiley = loadImage("neutralSmiley.png");
  deadSmiley = loadImage("deadSmiley.png");
  happySmiley = loadImage("happySmiley.png");
  //fullScreen();
  size(800, 800);
  background(255);
  frameRate(60);
  imageMode(CENTER); 

  //Variable depending of screen size - Updating
  gravity = height*0.00004629629;
  platformSpacing = height/platformCount;
  
  p = new Player(width/10,height/1.05-((height/10.8)/2),height/10.8,0,width/384,height/216,0,50,false,true,false,false);
  
  for(int i = 0; i< plats.length;i++){
  Platform plat = new Platform(width/2,660);
  plats[i] = plat;
  }
}


void draw() {
  background(255);
  drawHLine();
  p.smileyControl();
  p.smileyBouncing();
  p.smileyGravity();
  p.smileyMoving();
  
  for(int i = 0; i< plats.length;i++){
  plats[i].drawPlatform();
  }
  
  keyChecker();
  

}

void drawHLine() {
  groundLineY = height/1.05;
  strokeWeight(2);
  stroke(0);
  line(0, groundLineY, width, groundLineY);
}
     
 

void keyChecker() {

  if (checkKey("SPACE")) {
    if (p.smileyDead == false && p.smileyCanJump) {
      p.smileyShouldJump= true;
    }
  }
  if (checkKey("RIGHT")) {
    //move right
    if (p.smileyX < width-50) {
      p.smileyX += p.smileySpeedX;
    }
  }
  if (checkKey("LEFT")) {
    //move left
    if (p.smileyX > 50) {
      p.smileyX -= p.smileySpeedX;
    }
  }
  if (checkKey("r")) {

    if (p.smileyDead) {
      p.smileyDead = false;
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