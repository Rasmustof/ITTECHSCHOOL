float gravity = 0.1;

PImage neutralSmiley;
PImage deadSmiley;
PImage happySmiley;
float smileyX =100;
float smileyY =350;
float smileySpeedY = 0;
float smileyJumpSpeed = 1;
boolean smileyJump = false;
boolean smileyCanJump = true;
boolean smileyDead = false;
int smileyPoints = 0;
int highscore = 0;


int hLineY = 400;

PImage enemy;
PImage enemyCastle;
int enemyY = hLineY-60;
int enemyX = 700;
int enemyMovementSpeed = 5;
static int enemyW = 72;
static int enemyH = 120;
static int enemyCastleX = 700;
static float enemyCastleY = 400-80;


void setup() {
  neutralSmiley = loadImage("neutralSmiley.png");
  deadSmiley = loadImage("deadSmiley.png");
  happySmiley = loadImage("happySmiley.png");
  
  enemy = loadImage("enemy.png");
  enemyCastle = loadImage("EnemyCastle.png");

  size(800, 500);
  background(255);
  frameRate(60);
  imageMode(CENTER);
}
void draw() {
  background(255);
  drawHLine();
    enemy();
  smileyControl();
  smileyBouncing();
  smileyGravity();
  smileyMoving();
  smileyPoints();

}
void smileyControl() {
  //SMILEY JUMP CONTROL
  if(smileyY < hLineY-50){
    smileyCanJump = false;
    smileyJump = true;
  }else{
    smileyCanJump= true;
    smileyJump = false;
  }
  if(smileyY <= 0){
  smileyY = 50;
  }
  
//SMILEY STATE
  int state = 0;
  if(smileyDead == true)state = 1;
   else if(smileyJump == false)state = 0;
   else if(smileyJump == true)state = 2;  
   

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
  
//SMILEY COLLISION
  if (collision(smileyX,smileyY,enemyX,enemyY,enemyW,enemyH) == true){
    youDied();
  }

  
}
void drawSmiley(String state) {

  switch(state) {
    case("alive"):
      image(neutralSmiley, smileyX, smileyY, 100, 100);
      break;
    case("dead"):
      image(deadSmiley, smileyX, smileyY, 100, 100);
      break;
    case("happy"):
      image(happySmiley, smileyX, smileyY, 100, 100);
      break;
  }
}
void smileyBouncing() {
  if (smileyY >= hLineY-50) {
    smileySpeedY *=0;
    smileyY=hLineY-50;
    smileySpeedY+=gravity;
  }
}

void smileyMoving(){
  smileyY+=smileySpeedY;
 }
 void smileyGravity(){
  smileySpeedY +=gravity;
}
void drawHLine() {
  strokeWeight(2);
  stroke(0);
  line(0, hLineY, 800, hLineY);
}
void enemy(){
  image(enemyCastle,enemyCastleX,enemyCastleY);
  if(smileyDead == false) {
    image(enemy,enemyX,enemyY);
    enemyX -= enemyMovementSpeed;
    if(enemyX<= 0){
    enemyX = 700;
    smileyPoints++;
  }
  }
  
}
boolean collision(float aX,float aY,float bX,float bY,float bW,float bH){
  if(aX+50 > bX-(bW/2) && aX < bX+(bW/2)){
    if(aY+50 > bY-(bH/2)&& aY < bY+(bH/2)||aY-50 > bY-(bH/2)&& aY < bY+(bH/2)){
    return true;
    }
    else return false;
  }
  else return false;
}
void youDied(){
 // enemyMovementSpeed = 0;
  smileyDead = true;
  fill(#FF0000);
  textSize(50);
  text("The smiley has been Slain",50,200);
}
void smileyPoints(){
  fill(0);
  textSize(25);
  text("Smiley Points: "+smileyPoints,50,450);
}
void highScore(){

}
void keyReleased(){
 if(key == ' ' && smileyDead == false){
   for(int i =0; i<1000;i++){
   smileyY -= smileyJumpSpeed;
   }
 }
 if(key == 'r' || key == 'R'){
   if(smileyDead){
   smileyPoints = 0;
   smileyDead = false;
   enemyX = 700;
    
   }
 }
}