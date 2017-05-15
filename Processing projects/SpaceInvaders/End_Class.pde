class End{
  int ID;
  
  
  End(int _ID){
   ID = _ID;
  }
  void stateChange(){
  background(0);
    
  if(ID == 0)loose();
  else if(ID == 1) win();
  
  }
  
  
  void loose(){
    fill(#E52020);
    textSize(30);
    textAlign(CENTER);
    text("YOU DIED!!!",width/2,height/2);
  }
  void win(){
    textSize(30);
    textAlign(CENTER);
    text("YOU WON !!! YAY",width/2,height/2);
  }


}