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
   // noStroke();
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
}