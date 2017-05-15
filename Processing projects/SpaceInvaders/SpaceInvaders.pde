import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;

//Player
Player p;
EnemyManager enemyMan;
boolean isPlayerDead = false;

//KEY CHECKING
boolean keys[] = new boolean[526];

//STATES
int state = 0;
Intro intro;
Play play;
End end;
int currentEnd = 0;


void setup() {

  size(500, 500);
  p = new Player(1);
  enemyMan = new EnemyManager(5);
  intro = new Intro();
  play = new Play();
  end = new End(currentEnd);
}

void draw() {
  keyChecker();
  
  switch(state) {
    case(0):
      intro.drawIntro();
      break;

    case(1):
      play.playGame();
      break;
    
    default:
      println(currentEnd);
      currentEnd = end.ID;
      end.stateChange();
      
  }
 
}



void keyChecker() {
  if (state == 0 && keyPressed) {
    state = 1;
  }
  if (state == 1) {
    if (checkKey("SPACE")) {
      //SHOOT
      p.shoot();
    }
    if (checkKey("RIGHT")) {
      p.move(1);
    }
    if (checkKey("LEFT")) {
      p.move(0);
    }
  }
}

void keyPressed()
{ 
  keys[keyCode] = true;
}

void keyReleased()
{ 
  keys[keyCode] = false;
}
boolean checkKey(String k) {
  for (int i = 0; i < keys.length; i++)
    if (KeyEvent.getKeyText(i).toLowerCase().equals(k.toLowerCase())) return keys[i]; 
  return false;
}