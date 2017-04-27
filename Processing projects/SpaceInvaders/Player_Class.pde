class Player {

  int type;
  float x = width/2;
  float y = height/1.05;
  float speed = 5;
  PImage avatar;
  boolean hasShot = false;
  Shot s;


  Player(int _type) {
    type = _type;
  }
  void drawPlayer() {
    avatar = loadImage("player.png");

    if (type == 0) {
      //DEAD
      
    }
    if (type == 1) {
      //Alive
      imageMode(CENTER);
      image(avatar, x, y, 50, 40);
    }
  }
  void move(int dir) {
    if (dir == 1) {

      //move right
      if (x < width-25) {
        x += speed;
      }
    } else if (dir == 0) {
      //move left
      if (x > 25) {
        x -= speed;
      }
    } else {
      println("ERROR: PlayerMovement did not find the direction");
    }
  }
  void shoot() {
   if(!hasShot){
      s = new Shot(x, y-25); 
      hasShot = true;
   }
  }
  void handleShots() {
    //println("Shots: "+shotCount);
    if(hasShot){
      s.drawShot(); 
      s.moveShot();
      
      }
    
  }
}