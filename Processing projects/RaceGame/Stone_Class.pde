class Stone{
  float x;
  float y;
  int w;
  int h;
  
  PImage image;
  float speed;
  
  Stone(float tempX, float tempY, float tempSpeed, String fileName){
    x = tempX; 
    y = tempY;
    speed = tempSpeed;
    image = loadImage(fileName);
    w = 100;
    h = 100;
  }
  
  void display(){
    imageMode(CENTER);
    image(image, x, y, w, h);
  }
  
  void reset(){
    if(y <= 0){
      float chance = random(0,1);
      if (chance > 0.5){
        x = carXRight;
      }
      else {
        x = carXLeft;
      }
      //speed ++;
    }
  }
  
  void move(){
    y += speed;
    if (y > height+h/2){
      y = -h/2;
      reset();
    }
  }
  
}