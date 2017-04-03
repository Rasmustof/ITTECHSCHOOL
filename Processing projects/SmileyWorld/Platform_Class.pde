class Platform {

  float platX;
  float platY;
  float platW;
  float platH;



  Platform( float _x, float _y) {
    platW = width/12.8;
    platH = height/54;
    platX = _x;
    platY = _y;
  }
  void drawPlatform() {
      noStroke();
      fill(0);
      rect(platX, platY, platW, platH);
    
  }

}