/**
 *  Game Title: Bounce
 *  Creator: Rasmus Lausten Toftegaard
 *  Key Checking made by "mcspud" found:  https://forum.processing.org/two/discussion/5144/fast-keyboard-input-for-two-player-games  found at: 26/02/2017
 **/


import processing.sound.*;
import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;






//playing field size
int sizeX = 1720;
int sizeY = 968;


//ALL PLAYERS
int playerLength = 75;
int playerWidth = 10;
int playerMovementSpeed = 15;
boolean keys[] = new boolean[526];

//player 1
int player1yTop = sizeY/2-playerWidth/2;
int player1yBot = player1yTop + playerLength;
int player1x;
int player1Score = 0;

//player 2
int player2yTop = sizeY/2-playerWidth/2;
int player2yBot = player2yTop + playerLength;
int player2x;
int player2Score = 0;



//audio
SoundFile file;

//Fonts
PFont FScore;

//ball variables
int speedX = 20;
float xPos = sizeX/2; 
int speedY = 20;
float yPos = sizeY/2;
int ballDiameter = 20;
int speedXNormal = 20;
int speedXFast = 200;
int speedYNormal = 20;
int speedYFast = 200;


// Speed PowerUp
int sPowerUpSize = 90;
int sPowerUpTime = 0;
int sPowerUpTimeMax = 480;
int sPowerUpActiveTime = 0;
int sPowerUpActiveMax= 480;
int sPowerUpColorTime = 0;
int sPowerUpColorTimeMax = 480;
float sPowerUpColorR = random(0, 255);
float sPowerUpColorG = random(0, 255);
float sPowerUpColorB = random(0, 255);
float sPowerUpX = random(0, sizeX);
float sPowerUpY = random(0, sizeY);
boolean isSPowerUpActive = false;

void setup() {
  size(1720, 968);
  frameRate(480);


  //music
  file = new SoundFile(this, "/Resources/Music/loop_MONO.WAV");
  file.loop();

  //Fonts
  FScore = createFont("/Resources/Fonts/manaspc.ttf", 120);
}

void draw() {
  background(0);

  //playing field
  drawField();


  //cursor
  noCursor();
  //BALL  
  drawBall();

  //Player drawing
  drawPlayer1();
  drawPlayer2();

  //DEBUGGING
  //print(player2yTop + "\n");

  //Scores
  printScores();

  //Player movement
  if (checkKey("UP")) {

    movePlayerUp(2);
  }
  if (checkKey("DOWN")) {

    movePlayerDown(2);
  }
  if (checkKey("w")) {

    movePlayerUp(1);
  }
  if (checkKey("s")) {
    movePlayerDown(1);
  }

  //location tool
  if (mousePressed) println(mouseX, mouseY);


  //Speed PowerUp
  sPowerUp();
  sPowerUpControl();
}

void drawField() {

  fill(255);
  for (int i = 0; i < sizeY; i = i+25) {

    rect(sizeX/2, i, 5, 10);
  }
}

void drawBall() {

  //ball

  if (xPos >= sizeX-30) { 
    if (yPos > player2yBot || yPos < player2yTop) {
      player1Score++;
      speedX *= -1;
      println("GOAL!!! P2 just scored");
    } else speedX *= -1;
  } else if (xPos <= 35) {
    if (yPos > player1yBot || yPos < player1yTop) {
      player2Score++;
      speedX *= -1;
      println("GOAL!!! P1 just scored");
    } else speedX *= -1;
  }

  xPos += (speedX/4);
  //println("ballActive is: "+ballActive);

  if (yPos >= sizeY ||yPos < 10 ) {
    speedY *= -1;
  }
  yPos += (speedY/4);




  // ACTUAL BALL OBJECT
  ellipse(xPos, yPos, ballDiameter, ballDiameter);




  //End ball
}

void drawPlayer1() {
  rect(30, player1yTop, playerWidth, playerLength);
}
void drawPlayer2() {
  rect(sizeX-30, player2yTop, playerWidth, playerLength);
}
void movePlayerUp(int ID) {

  if (ID == 1) {
    if (player1yTop > 0) {
      player1yTop -= playerMovementSpeed;
      player1yBot = player1yTop + playerLength;
    }
  } else if (ID == 2) {
    if (player2yTop > 10) {
      player2yTop -= playerMovementSpeed;
      player2yBot = player2yTop + playerLength;
    }
  } else print("404 Player Not Found while trying to move UP \n");
}

void movePlayerDown(int ID) {
  if (ID == 1) {

    if (player1yTop+playerLength <= sizeY) {
      player1yTop += playerMovementSpeed;
      player1yBot = player1yTop + playerLength;
    }
  } else if (ID == 2) {
    // print("Attempting to move player 2\n");
    if (player2yTop+playerLength <= sizeY) {
      player2yTop += playerMovementSpeed;
      player2yBot = player2yTop + playerLength;
      //print(player2yTop);
    }
  } else print("404 Player Not Found while trying to move DOWN \n");
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
void printScores() {
  textFont(FScore);
  text(player1Score, 650, 150);
  text(player2Score, 1000, 150);
}
void sPowerUp() {
  fill(sPowerUpColorR, sPowerUpColorG, sPowerUpColorB);
  ellipse(sPowerUpX, sPowerUpY, sPowerUpSize, sPowerUpSize);
  sPowerUpColorTime++;
  if (sPowerUpColorTime > sPowerUpColorTimeMax) {
    sPowerUpColorR = random(0, 255);
    sPowerUpColorG = random(0, 255);
    sPowerUpColorB= random(0, 255);

    sPowerUpColorTime = 0;
  }
  sPowerUpTime++;
  if (sPowerUpTime > sPowerUpTimeMax) {
    sPowerUpX = random(100, sizeX-100);
    sPowerUpY = random(100, sizeY-100);
    sPowerUpTime = 0;
  }
}
void sPowerUpControl() {
  if (dist(xPos, yPos, sPowerUpX, sPowerUpY) < (sPowerUpSize/2)+(ballDiameter/2) ) {
    println("SUPER SPEED ACTIVATED");
    isSPowerUpActive = true;
  }
  if (isSPowerUpActive == true) {
    speedY = speedYFast;
    speedX = speedXFast;
    sPowerUpActiveTime++;
    if (sPowerUpActiveTime >= sPowerUpActiveMax) {
      isSPowerUpActive = false;
      speedX = speedXNormal;
      speedY = speedYNormal;
      sPowerUpActiveTime = 0;
    }
  }
}