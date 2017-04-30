class EnemyManager{
int enemyCount;

int startX = width/2;
int startY = height /10;
Enemy[] enemies;


EnemyManager(int _Count){
  enemyCount = _Count;
   enemies = new Enemy[enemyCount];
}
  
  void drawEnemies(){
  //  println("Attempting to draw enemies - " + enemyCount);
    enemies[0] = new Enemy(1,startX,startY);
    enemies[0].drawEnemy();
    //for(int i = 0; i == enemyCount;i++){
    //  println("4-loop id: "+i);
    //  if(i == 0){
    //    enemies[i] = new Enemy(1,startX,startY);
    //    println("Drawing the first enemy");
              
    //  }else{
    //    enemies[i] = new Enemy(1,startX+(i*5),startY);
        
    //  }
    //  enemies[i].drawEnemy();
    //}
  
  }

}