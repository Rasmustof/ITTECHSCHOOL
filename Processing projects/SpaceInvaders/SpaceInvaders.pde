import java.awt.event.KeyEvent; 
import java.awt.event.KeyListener;


//Player
Player p;
boolean isPlayerDead = false;

//KEY CHECKING
boolean keys[] = new boolean[526];


void setup() {

  size(500, 500);
  p = new Player(1);
}

void draw() {

  background(0);
  keyChecker();
  p.drawPlayer();
  playerDeadControl();
  p.handleShots();
    
  
}
void playerDeadControl() {
  if (p.type == 0) {
    isPlayerDead = true;
  } else isPlayerDead = false;
}
void keyChecker() {
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
    if (checkKey("r")) {
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