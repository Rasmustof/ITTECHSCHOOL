class End{
  PImage end;
  PFont font;
  float x;
  float y;

  End(){
  x = width/2;
  y = height/2;
  font = createFont("AGENCYB.TTF",height/10);
  end = loadImage("EndScreen.png");
  }
  void drawEnd(){
  
  background(#5FD62D);
    imageMode(CENTER);
    image(end,x,y,width,height);
    textAlign(CENTER);
    textFont(font);
    text("Score: " +score,x,height/1.8);
    
    
    carXRight =width/2-(width/20);
    carXLeft = width/2+(width/20);
  
    road = new Road();
    car = new Car(carXRight,height/1.2);
    stone = new Stone(carXLeft,0,ySpeed,"stone.png");
    }





}