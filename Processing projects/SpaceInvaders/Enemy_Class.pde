class Enemy {
  int ID;
  float x;
  float y;
  float enemyHealth;
  PImage enemyImage;
  boolean hasJumped = false;
  boolean isAlive = true;
  boolean hasDied = false;
  boolean hasShot = false;
  
  EnemyShot eS;

  Enemy(int _ID, float _x, float _y) {
    ID = _ID;
    x = _x;
    y = _y;

    //ENEMY SPRITE CONTROL
    if (ID == 1) {
      enemyImage = loadImage("enemy1.png");
      enemyHealth = 4;
    } else {
      enemyImage = loadImage("enemy2.png");
      enemyHealth = 8;
    }
  }

  void drawEnemy() {
    if (isAlive) {
      image(enemyImage, x, y, 35, 35);
    }
  }
  void isAlive(){
    if(enemyHealth <= 0){
      isAlive = false;
      if(!hasDied){
        enemyMan.activeEnemies--;
        hasDied = true;
      }
      
    }
  }
  void enemyShoot(){
    if(!hasShot){
      if((int)random(0,25) == 5){
       // println("ENEMY TRYING TO SHOOT!");
        eS = new EnemyShot(x,y);
        hasShot = true;
      }
      
    }
  }
  void handleShots() {
    if (hasShot) {
      //n("WE HAVE A GODDAMN SHOT");
      eS.drawShot(); 
      eS.moveShot();
      eS.shotCollide();
    }
 
  }
  void moveRight() {
    x++;
  }
  void moveLeft() {
    x--;
  }
  void jumpDown() {

    y += 5;
  }
}