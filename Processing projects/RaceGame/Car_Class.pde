class Car{
  float x;
  float y;
  float w;
  float h;
  
  PImage carImage;

  Car(float _x, float _y){
  x = _x;
  y = _y;
  w = width/17;
  h = height/5;
  
  carImage = loadImage("Car.png");
  
  }
  void drawCar(){
    imageMode(CENTER);
    image(carImage,x,y,w,h);
  }
  boolean carCollision(Stone s){
    float sH = s.h;
    


    if( x == carXRight && s.x == carXRight || x == carXLeft && s.x == carXLeft ){
      // the car and the stone is on the same lane´
      
      if( dist(x,y,s.x,s.y) <= sH + (h/4)){
      
        return true;
        
      }else return false;// Y value is not correct, but the X is... so there is no collision.
      
    }else return false; // X value is not correct, so there is no reason to check Y, and there is no  collision.
    
    
    
  }

}