class Play {



  Play() {
  }
  void playGame() {

    background(0);

    p.drawPlayer();
    playerDeadControl();
    enemyMan.drawEnemies();
    p.handleShots();
    enemyMan.enemyMovement();
    winControl();
  }
  void playerDeadControl() {
    if (p.type == 0) {
      isPlayerDead = true;
    } else isPlayerDead = false;
  }
  void winControl() {
  
    if (enemyMan.activeEnemies <= 0) {
      end.ID = 1;
      state = 2;
    }
  }
}