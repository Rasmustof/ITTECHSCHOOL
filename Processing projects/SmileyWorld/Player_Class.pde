class Player {
  float smileyX; 
  float smileyY;
  float smileyDiameter; 
  float smileySpeedY; 
  float smileySpeedX; 
  float smileyJumpSpeed; 
  float smileyUpCounter; 
  float smileyUpCounterMax; 
  boolean smileyJump; 
  boolean smileyCanJump; 
  boolean smileyDead; 
  boolean smileyShouldJump;
  boolean smileyWin = false;

  int StartDelayTime = 0;
  int StartDelayMax = 50;

  Player(float _smileyX, 
    float _smileyY, 
    float _smileyDiameter, 
    float _smileySpeedY, 
    float _smileySpeedX, 
    float _smileyJumpSpeed, 
    float _smileyUpCounter, 
    float _smileyUpCounterMax, 
    boolean _smileyJump, 
    boolean _smileyCanJump, 
    boolean _smileyDead, 
    boolean _smileyShouldJump) {

    smileyX = _smileyX;
    smileyY = _smileyY;
    smileyDiameter = _smileyDiameter; 
    smileySpeedY = _smileySpeedY; 
    smileySpeedX = _smileySpeedX; 
    smileyJumpSpeed = _smileyJumpSpeed; 
    smileyUpCounter = _smileyUpCounter; 
    smileyUpCounterMax= _smileyUpCounterMax; 
    smileyJump = _smileyJump; 
    smileyCanJump = _smileyCanJump; 
    smileyDead = _smileyDead; 
    smileyShouldJump = _smileyShouldJump;
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

    //   ---buttom collision---
    if (smileyY >= groundLineY-(smileyDiameter/2)) {
      smileySpeedY *=0;
      smileyY=groundLineY-(smileyDiameter/2);
      smileySpeedY+=gravity;
    } 

    //   ---platform collision---
    for ( int i = 0; i< platformCount; i++) {
      //top side collision
      if (smileyY+(smileyDiameter/2) > plats[i].platY && smileyY+(smileyDiameter/2) < plats[i].platY +5) {
        if (smileyX+(smileyDiameter/2) > plats[i].platX && smileyX-(smileyDiameter/2) < plats[i].platX+plats[i].platW) {
          smileySpeedY *=0;
          smileyY=plats[i].platY-(smileyDiameter/2);
          smileySpeedY+=gravity;
          smileyCanJump=true;
          smileyJump = false;
        }
      }
      //buttom colission
      else if (smileyY-(smileyDiameter/2) > plats[i].platY+plats[i].platH && smileyY-(smileyDiameter/2) < plats[i].platY + plats[i].platH +5) {
        if (smileyX+(smileyDiameter/2) > plats[i].platX && smileyX-(smileyDiameter/2) < plats[i].platX+plats[i].platW) {
          smileySpeedY =0;
          smileyY=plats[i].platY+(smileyDiameter/2)+19;
          smileySpeedY+=gravity;
          //smileySpeedY *= -1;
        }
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
  void startOfGame() {
    if (gameStarted && smileyY >= groundLineY-(smileyDiameter/2) && !smileyWin) {
      smileyDead = true;
    }
    //else if(gameStarted && smileyY <= plats[plats.length-1].platY && smileyX > plats[plats.length-1].platX && smileyX < plats[plats.length-1].platX + plats[plats.length-1].platW){
    //  smileyWin = true;
    //} 
    else if (gameStarted && coinsRemaining <= 0 && !smileyDead) {
      smileyWin = true;
      smileySpeedY *= 0;
      gravity = 0;
    }
  }
  
  void smileyEating() {
    for (int i = 0; i< c.length; i++) {
      if ( c[i].collideCoin(this)) {
        c[i].coinEaten = true;
      }
    }
  }
}