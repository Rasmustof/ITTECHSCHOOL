class Coin{
  
  float coinX;
  float coinY;
  PImage coin;
  int coinD = 64;
  boolean coinEaten = false;
  
  Coin(float _coinX,float _coinY){
    
    coinX = _coinX;
    coinY = _coinY;
    coin = loadImage("coin.png");
  }
  
  void drawCoin(){
    if(!coinEaten){
      image(coin,coinX,coinY,coinD,coinD);
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