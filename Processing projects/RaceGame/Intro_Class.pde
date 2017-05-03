class Intro{
  float x;
  float y;

  PImage intro;
  
  Intro(){
   intro = loadImage("introScreen.png");
   x = width/2;
   y = height/2;
  }
  void drawIntro(){
    background(#5FD62D);
    imageMode(CENTER);
    image(intro,x,y);
    
     carXRight =width/2-(width/20);
    carXLeft = width/2+(width/20);
  
    road = new Road();
    car = new Car(carXRight,height/1.2);
    stone = new Stone(carXLeft,0,ySpeed,"stone.png");
   
  }

}