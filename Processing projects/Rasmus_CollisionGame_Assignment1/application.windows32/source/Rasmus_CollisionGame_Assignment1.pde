
//Player
float playerXCenter = 500;
float playerYBottom = 900;
float playerXRight = playerXCenter + 40;
float playerXLeft = playerXCenter - 40;
float playerXTop = playerXCenter;
float playerYTop = playerYBottom - 50;
float playerTopXRight = playerXRight  - 30;
float playerTopXLeft = playerXLeft + 30;
float playerTopYTop = playerYTop +30;
int playerGunOffset = 20;
float playerGunWidth = 7;
float playerGunHeight = 25;
float playerGun1X = playerTopXRight - playerGunOffset;
float playerGun2X = playerTopXLeft + playerGunOffset;
float playerGun3X = playerXCenter - (playerGunWidth/2);
float playerGunY = playerYBottom - 25;
float playerGun3Y = playerGunY - 35;

//Missile
float missileY = playerGunY - 10;
float missile1X;
float missileStart1X;
float missile2X;
float missileStart2X;
float missile3X;
float missileStart3X;
float missile3Y = missileY -35;
float missileHeight = 15;
float missileWidth = 5;
float missileDelayMax = 30;
float missileDelay = 0;
int missileSpeed = 20;
int numberOfMissiles = 0;

//Enemy
float enemyX;
float enemyXStart;
float enemyYStart = -40;
float enemyY;
float enemyDiameter = 40;
float enemyYSpeed = 7;
int numberOfEnemies = 0;
int enemyCounter = 0;
int enemyCounterMax = 120;

//Scores
int kills = 0;
int killsBoardX = 800;
int killsBoardY = 0;
int killsBoardWidth = 200;
int killsBoardHeight = 50;
int killsBoardRadiusTL = 0;
int killsBoardRadiusTR = 0;
int killsBoardRadiusBL = 5;
int killsBoardRadiusBR = 0;
String killsText = "Kills: ";
int killsTextSize = 25;
int killsTextX = 810;
int killsTextY = 25;


void setup() {
  size(1000, 1000);
  frameRate(600);
}

void draw() {

  background(0);
  textMyName();
  playerControl();
  homeBase();
  killsControl();
  enemyControl();
}
void playerControl() {

  noStroke();

  //PlayerGuns
  fill(#313030);
  rect(playerGun1X, playerGunY, playerGunWidth, playerGunHeight);
  rect(playerGun2X, playerGunY, playerGunWidth, playerGunHeight);
  rect(playerGun3X, playerGun3Y, playerGunWidth, playerGunHeight);

  //Player
  fill(#CECECE);
  triangle(playerXLeft, playerYBottom, playerXCenter, playerYTop, playerXRight, playerYBottom);


  //PlayerTop
  fill(#5A5A5A);
  triangle(playerTopXLeft, playerYBottom, playerXCenter, playerTopYTop, playerTopXRight, playerYBottom);


  //Variable updating
  playerXCenter = mouseX;
  playerXRight = playerXCenter + 30;
  playerXLeft = playerXCenter - 30;
  playerXTop = playerXCenter;
  playerYTop = playerYBottom - 50;
  playerTopXRight = playerXRight  + 30;
  playerTopXLeft = playerXLeft - 30;
  playerGun1X = playerTopXRight - playerGunOffset;
  playerGun2X = playerTopXLeft + playerGunOffset;
  playerGun3X = playerXCenter - (playerGunWidth/2);


  //Missile Control
  spawnMissile();
}
void homeBase() {
  stroke(255);
  strokeWeight(4);
  line(0, 950, 1000, 950);
}
void textMyName() {
  fill(255);
  textSize(12);
  text("Rasmus Lausten Toftegaard", 0, 10);
}
void spawnMissile() {
  missileDelay++;
  if (missileDelay >= missileDelayMax && numberOfMissiles == 0 && mousePressed) {
    missileStart1X = playerGun1X +(playerGunWidth/2)/(missileWidth/2);
    missileStart2X = playerGun2X +(playerGunWidth/2)/(missileWidth/2);
    missileStart3X = playerGun3X +(playerGunWidth/2)/(missileWidth/2);
    missile1X = missileStart1X;
    missile2X = missileStart2X;
    missile3X = missileStart3X;
    missileDelay = 0;
    numberOfMissiles = 1;
  }
  if (numberOfMissiles == 1 && missileY > 0) {
    fill(#56FF03);
    missileY -= missileSpeed;
    missile3Y -= missileSpeed;
    rect(missile1X, missileY, missileWidth, missileHeight);
    rect(missile2X, missileY, missileWidth, missileHeight);
    rect(missile3X, missile3Y, missileWidth, missileHeight);
  }
  if (numberOfMissiles == 1 && missileY <= 0) {
    numberOfMissiles = 0;
    missileY = playerYTop - 10;
    missile3Y = missileY -35;
  }
}
void enemyControl() {
  enemyCounter++;
  if (enemyCounter >= enemyCounterMax && numberOfEnemies == 0) {
    enemyXStart = random(20, 980);
    enemyX = enemyXStart;
    enemyCounter = 0;
    numberOfEnemies = 1;
  }
  if (numberOfEnemies == 1) {
    if (dist(enemyX, enemyY, missile1X, missileY) < enemyDiameter ||dist(enemyX, enemyY, missile2X, missileY) < enemyDiameter || dist(enemyX, enemyY, missile3X, missile3Y) < enemyDiameter) {
      numberOfEnemies = 0;
      numberOfMissiles = 0;
      enemyX = enemyXStart;
      enemyY = enemyYStart;
      missileStart1X = playerGun1X +(playerGunWidth/2)/(missileWidth/2);
      missileStart2X = playerGun2X +(playerGunWidth/2)/(missileWidth/2);
      missile1X = missileStart1X;
      missile2X = missileStart2X;
      missileY = playerYTop - 10;
      kills++;
    }
    if (enemyY > 950) {
      //GAME OVER
      background(0);
      fill(#FF0329);
      textSize(100);
      text("GAME OVER", 200, 500);

      fill(#F5E102);
      textSize(25);
      text(" you got " + kills + " kills", 400, 550);
      if (kills > 1 && kills < 10) {
        text("You didnt totally fail atleast", 300, 600);
      }else if (kills == 1) {
        text("WOW, You got ONE kill!! ... you can do better than that ", 300, 600);
      } else if (kills <= 0) {
        text("Press the mouse to fire, now you know", 300, 600);
      } else if (kills > 10 && kills <= 100) {
        text("You beat Halfdan, GOOB JOB A+", 300, 600);
      } else if (kills > 100 && kills < 200) {
        text("Wow that is actually pretty impressive, good job", 300, 600);
      } else if (kills > 200 && kills < 500) {
        text("Very Good job,you might be spending too much time on this game", 300, 600);
      } else if (kills >= 500 && kills <= 1000) {
        text("You should probably take a break, and get something to drink after this", 300, 600);
      } else if (kills > 1000 && kills <= 9000) {
        text("You only have a tiny bit left for the last achivement, can you get it?", 300, 600);
      } else if (kills > 9000) {
        text("ITS OVER 9000!!! and you dont have a life", 300, 600);
      }

      textSize(20);
      text("Press 'R' to restart", 400, 700);
      text("Press 'Q' to restart", 400, 750);
    }
    enemyY += enemyYSpeed;
    noStroke();
    fill(#FF0329);
    ellipse(enemyX, enemyY, enemyDiameter, enemyDiameter);
  }
}
void killsControl() {
  fill(0);
  stroke(#F5F5F5);
  strokeWeight(5);
  rect(killsBoardX, killsBoardY, killsBoardWidth, killsBoardHeight, killsBoardRadiusTL, killsBoardRadiusTR, killsBoardRadiusBR, killsBoardRadiusBL);

  fill(255);
  textSize(killsTextSize);
  text(killsText + kills, killsTextX, killsTextY);
}
void keyPressed() {
  if (key == 'r'  || key == 'R') {
    if (enemyY > 950) {
      enemyY = 0;
      kills = 0;
    }
  } else if (key == 'q' || key == 'Q') {
    if (enemyY > 950) {
      exit();
    }
  }
}