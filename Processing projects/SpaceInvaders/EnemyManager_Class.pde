class EnemyManager {
  int enemyCount;

  int startX = width/10;
  int startY = height /15;
  Enemy[] enemies;


  EnemyManager(int _Count) {
    enemyCount = _Count;
    enemies = new Enemy[enemyCount];
  }

  void drawEnemies() {
    //println("Attempting to draw enemies - " + enemyCount);
    for (int i = 0; i < enemyCount; i++) {

      //IS THERE A ENEMY FOR OUR INDEX ALREADY?? then we dont need to make a new one
      if (enemies[i] == null) {
        
        //is i even or odd?? if its even the sprite ID will be 1, else it will be 2
        if ( i % 2 == 0) {
          enemies[i] = new Enemy(1, startX+(i*60), startY);
        } else {
          enemies[i] = new Enemy(2, startX+(i*60), startY);
        }
      }
      //This actually draws our new enemy, so we can see it :D
      enemies[i].drawEnemy();

      //Testing
      println("EnemyNumber: " + i +" , "+"Sprite ID: " + enemies[i].ID + " , " + "Enemy Health: " + enemies[i].enemyHealth);
    }
  }
}