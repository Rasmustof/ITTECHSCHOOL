class Shot {

  float x;
  float y;
  float w = 4;
  float h = 10;
  float speed = 7.5;

  Shot(float _x, float _y) {
    x= _x;
    y= _y;
  }
  void drawShot() {
    //noStroke();
    fill(#2FFA08);
    rect(x, y, w, h);
  }
  void moveShot() {
    if (y <1) {
      //no more shot
      p.hasShot = false;
    } else {
      y -= speed;
    }
  }
  void shotCollide(){
   for(int i = 0; i < enemyMan.enemyCount; i++){
     if(x >= enemyMan.enemies[i].x - (35/2) && x <= enemyMan.enemies[i].x + (35/2)  && y <= enemyMan.enemies[i].y+(35/2) && y >= enemyMan.enemies[i].y-(35/2)){
       //println("SHOT A ENEMY!!");
        enemyMan.enemies[i].enemyHealth--;
     }
   } 
  }
}