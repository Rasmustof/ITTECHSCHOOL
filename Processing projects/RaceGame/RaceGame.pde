
int currentState = 1;
int startState = 1;
int playState = 2;
int gameOverState = 3;
float ySpeed = 8;
int score = 0;

float carXRight;
float carXLeft;

Road road;
Car car;
Stone stone;
Intro intro;
End end;

void setup(){
  frameRate(120);
  fullScreen();
  background(#5FD62D);
 
  intro = new Intro();
  end = new End();
  
}
void draw(){
  switch(currentState){
  
    case(1):
    intro.drawIntro();
    break;
   
    case(2):
    background(#5FD62D);
   
     road.display();
     car.drawCar();
     road.stripeMoving();  
     stone.move();
     stone.reset();
     stone.display();
     score++;
     if(car.carCollision(stone)){
      currentState = gameOverState;
     }
    break;
    
    case(3):
    end.drawEnd();
    break;
  
  }
}

void keyReleased(){
  if(currentState == startState){
    currentState = playState;
  }else if(currentState == gameOverState){
    score = 0;
    currentState = playState;
  
  }else if(currentState == playState){
    //WE ARE IN THE MIDDLE OF A GAME
    
    if(keyCode == LEFT && car.x != carXRight ){
      car.x = carXRight;
    }else if(keyCode == RIGHT && car.x != carXLeft){
      car.x = carXLeft;
    }
    
    
  
  
  }

}