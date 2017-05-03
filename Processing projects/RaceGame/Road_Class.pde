class Road{
  int x;
  int y;
  int wMain;
  int h;
  int wStripe;
  float hStripe;
  int stripeCount = 3;
  float yStripe;
  float yStripeDiffrence;
  
  PImage sidewalk;

  Road(){
   x = width/2;
   y = height/2;
   wMain = width/4;
   h = height;
   wStripe = width/75;
   hStripe = height/stripeCount*0.8;
   yStripe = 0;
   yStripeDiffrence = height/2;
   sidewalk = loadImage("Sidewalk.png");
  }
  void display(){
    fill(#404040);
    noStroke();
    rectMode(CENTER);
    rect(x,y,wMain,h);
    
    
    
    //STRIPES
    fill(#F7FF1F);
    rectMode(CORNER); 
    rect(x-(width/(wMain/2)),yStripe,wStripe,hStripe);
    rect(x-(width/(wMain/2)),yStripe + yStripeDiffrence,wStripe,hStripe);
    rect(x-(width/(wMain/2)),yStripe - yStripeDiffrence,wStripe,hStripe);
    rect(x-(width/(wMain/2)),yStripe - yStripeDiffrence*2,wStripe,hStripe);
    
    //SideWalk;
    imageMode(CORNER);
    image(sidewalk,x+(wMain/2)-31,yStripe,62,1080);
    image(sidewalk,x-(wMain/2)-31,yStripe,62,1080);
    image(sidewalk,x+(wMain/2)-31,yStripe+yStripeDiffrence,62,1080);
    image(sidewalk,x-(wMain/2)-31,yStripe+yStripeDiffrence,62,1080);
    image(sidewalk,x+(wMain/2)-31,yStripe-yStripeDiffrence*2,62,1080);
    image(sidewalk,x-(wMain/2)-31,yStripe-yStripeDiffrence*2,62,1080);
    
    
    
    
  }
  void stripeMoving(){
    if(yStripe != height){
      yStripe+= ySpeed;
    }
    else{
      yStripe = 0;
    }
  }

}