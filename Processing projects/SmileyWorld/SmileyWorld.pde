import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;

float gravity;

//SMILEY
Player p;
boolean gameStarted = false;
PImage neutralSmiley;
PImage deadSmiley;
PImage happySmiley;


//KEY CHECKING
boolean keys[] = new boolean[526];

//PLAYING GROUND
float groundLineY;
PImage lava;
int coinAmount = 5;
int coinsRemaining = coinAmount;
Coin[] c = new Coin[coinsRemaining];


//PLATFORMS
int platformCount = 8;
float platformSpacing;
Platform[] plats = new Platform[platformCount];
float platform1X;




void setup() {
  neutralSmiley = loadImage("neutralSmiley.png");
  deadSmiley = loadImage("deadSmiley.png");
  happySmiley = loadImage("happySmiley.png");
  lava = loadImage("lava.png");
 
  fullScreen();
  // size(800, 800);
  background(255);
  frameRate(60);
  imageMode(CENTER); 

  //Variable depending of screen size - Updating
  gravity = height*0.00004629629;
  platformSpacing =- height/platformCount;
  platform1X = width/2;

  //Initializing Objects
  p = new Player(width/10, height/1.05-((height/10.8)/2), height/10.8, 0, width/100, height/216, 0, 50, false, true, false, false);
  
  for (int i = 0; i<c.length;i++){
    Coin coin = new Coin(random(0,width),random(20,height -20));
    c[i] = coin;
  }
  
  
  
  

  for (int i = 0; i< plats.length; i++) {
    
      //Platform plat = new Platform(random(plats[i-1].platX-150,plats[i-1].platX+150),i*platformSpacing+platformSpacing);
      Platform plat = new Platform(random(0, width-p.smileyDiameter), i*platformSpacing-platformSpacing+height);
      plats[i] = plat;
    
    // println(plats[i].platX, plats[i].platY);
  }
}


void draw() {

  //Graphics and ground
   background(#D3D3D3);
  image(lava,width/2,height-26);
  drawHLine();


  //PLATFORMS
  for (int i = 0; i< plats.length; i++) {
    plats[i].drawPlatform();
  }
  //COINS
  for (int i = 0; i< c.length;i++){
    c[i].drawCoin();
  }

  //SMILEY
  p.smileyControl();
  p.smileyBouncing();
  p.smileyGravity();
  p.smileyMoving();
  p.startOfGame();
  p.smileyEating();



  //GAME LOGIC
  keyChecker();
  checkLost();
  checkWin();
  drawUI();

  //println(gameStarted);
}

void drawHLine() {
  groundLineY = height/1.05;
  if(!gameStarted){
    strokeWeight(50);
    stroke(#9D9D9D);
    line(0, groundLineY, width, groundLineY);
  }
}


void keyChecker() {
  if (!p.smileyDead && !p.smileyWin) {

    if (checkKey("SPACE")) {
      if (p.smileyDead == false && p.smileyCanJump) {
        p.smileyShouldJump= true;
      }
      if (!gameStarted) {
        gameStarted = true;
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
  } 
  if (checkKey("r")) {
    //IS SMILEY DEAD??
    if (p.smileyDead) {
      p.smileyDead = false;
      gameStarted = false;
      p.smileyY = groundLineY-(p.smileyDiameter/2);
      coinsRemaining = coinAmount;
        for(int i = 0; i< c.length; i++){
          c[i].coinEaten = false;
        }
      
    }
    // HAS THE SMILEY WON??
    if (p.smileyWin && !p.smileyDead) {
      // println("smiley Won");
      p.smileyWin = false;
      gameStarted = false;
      p.smileyY = groundLineY-(p.smileyDiameter/2);
      gravity = height*0.00004629629;
      coinsRemaining = coinAmount;
      for(int i = 0; i< c.length; i++){
          c[i].coinEaten = false;
        }
    }
  }
}
void checkLost() {
  //println(p.smileyDead);
  if (p.smileyDead) {
    textSize(width/10);
    fill(#F00000);
    textAlign(CENTER);
    text("YOU DIED", width/2, height/2);
  }
  //println(p.smileyDead);
}
void checkWin() {
  if (p.smileyWin == true) {
    textSize(width/10);
    fill(#27F000);
    textAlign(CENTER);
    text("YOU WIN", width/2, height/2);
  }
}

void drawUI(){
  textSize(width/15);
  fill(0);
  textAlign(CORNER);
  text("Coins Remaining: " + coinsRemaining,10,100);
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