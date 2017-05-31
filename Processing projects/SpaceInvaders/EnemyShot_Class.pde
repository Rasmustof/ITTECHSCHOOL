class EnemyShot {

  float x;
  float y;
  float w = 4;
  float h = 10;
  float speed = 7.5;

  EnemyShot(float _x, float _y) {
    x= _x;
    y= _y;
  }
  void drawEnemyShot() {
    //noStroke();
   // print("DRAWING ENEMY SHOT");
    fill(#E52020);
    rect(x, y, w, h);
  }
  void moveEnemyShot(Enemy e) {  
 if (y >= height) {
      //no more shot
      e.hasEnemyShot = false;
    } else {
      y += speed;
    }
  }
  void enemyShotCollide(){
   for(int i = 0; i < enemyMan.enemyCount; i++){
     if(x >= p.x - 25 && x <= p.x + 25  && y <= p.y +20 && y >= p.y -25){
       //println("SHOT A ENEMY!!");
       end.ID = 0;
       state = 2;
       
     }
   } 
  }
}