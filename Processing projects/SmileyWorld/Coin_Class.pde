class Coin{
  
  float coinX;
  float coinY;
  PImage coin00;
  PImage coin01;
  PImage coin02;
  PImage coin03;
  PImage coin04;
  PImage coin05;
  PImage coin06;
  int coinAnim = 0;
  int coinAnimTimer = 7;
  int coinD = 64;
  boolean coinEaten = false;
  
  Coin(float _coinX,float _coinY){
    
    coinX = _coinX;
    coinY = _coinY;
    coin00 = loadImage("coin00.png");
    coin01 = loadImage("coin01.png");
    coin02 = loadImage("coin02.png");
    coin03 = loadImage("coin03.png");
    coin04 = loadImage("coin04.png");
    coin05 = loadImage("coin05.png");
    coin06 = loadImage("coin06.png");
  }
  
  void drawCoin(){
    if(!coinEaten){
      if(coinAnim >= 100){
        image(coin00,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 2*coinAnimTimer && coinAnim > coinAnimTimer){
        image(coin01,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 3*coinAnimTimer && coinAnim > 2*coinAnimTimer){
        image(coin02,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 4*coinAnimTimer && coinAnim > 3*coinAnimTimer){
        image(coin03,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 5*coinAnimTimer && coinAnim > 4*coinAnimTimer){
        image(coin04,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 6*coinAnimTimer && coinAnim > 5*coinAnimTimer){
        image(coin05,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 7*coinAnimTimer && coinAnim > 6*coinAnimTimer){
        image(coin06,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 8*coinAnimTimer && coinAnim > 7*coinAnimTimer){
        image(coin05,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 9*coinAnimTimer && coinAnim > 8*coinAnimTimer){
        image(coin04,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 10*coinAnimTimer && coinAnim > 9*coinAnimTimer){
        image(coin03,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 11*coinAnimTimer && coinAnim > 10*coinAnimTimer){
        image(coin02,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 12*coinAnimTimer && coinAnim > 11*coinAnimTimer){
        image(coin01,coinX,coinY,coinD,coinD);
      }else if(coinAnim <= 13*coinAnimTimer && coinAnim > 12*coinAnimTimer){
        image(coin00,coinX,coinY,coinD,coinD);
      }else if(coinAnim > 13*coinAnimTimer){
        image(coin00,coinX,coinY,coinD,coinD);
        coinAnim = 0;
      }
      coinAnim++;
    }
  }
  boolean collideCoin(Player p){
    if(dist(p.smileyX,p.smileyY,coinX,coinY) <= p.smileyDiameter && !coinEaten){
      coinsRemaining --;
      //DO SOMETHING TO REMOVE THE COIN FROM THE "c" ARRAY
      return true;
    }else return false;
  }

}