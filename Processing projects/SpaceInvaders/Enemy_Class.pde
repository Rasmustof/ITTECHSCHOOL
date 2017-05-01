class Enemy {
  int ID;
  float x;
  float y;
  PImage enemyImage;
  int enemy1Y = 50;
  int enemy1X = 50;

  Enemy(int _ID, float _x, float _y) {
    ID = _ID;
    x = _x;
    y = _y;

    //ENEMY SPRITE CONTROL
    if (ID == 1) {
      enemyImage = loadImage("enemy1.png");
    } else {
      enemyImage = loadImage("enemy1.png");
    }
  }

  void drawEnemy() {
    image(enemyImage, x, y, 35, 35);
  }
}