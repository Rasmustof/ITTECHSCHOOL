class Coin{
  
  float coinX;
  float coinY;
  PImage coin;
  int coinD = 
  
  Coin(float _coinX,float _coinY){
    
    coinX = _coinX;
    coinY = _coinY;
    coin = loadImage("coin.png");
  }
  
  void drawCoin(){
    
      image(coin,coinX,coinY,coinD,coinD);
    
  }
  boolean collideCoin(Player p){
    if(dist(p.smileyX,p.smileyY,coinX,coinY) <= p.smileyDiameter + coinD){
      return true;
    }else return false;
  }

}