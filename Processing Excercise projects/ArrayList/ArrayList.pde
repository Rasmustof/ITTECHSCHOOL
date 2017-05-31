
  
  
  int numbers = 10;
  Numb numb = new Numb(2);
 ArrayList<Numb> numbs = new ArrayList<Numb>();
  
  void setup(){
    size(500,500);
    background(0);
    setNumbers();
  }
  void draw(){
    drawNumbers();
  }
  void setNumbers(){
    for(int i = 1; i <= numbers;i++){
      numbs.add(new Numb(i));
    }  
  }
  void drawNumbers(){
    textAlign(CENTER);
      fill(255);
      textSize(40);
    for(int i = 0;i< numbs.size();i++){
      
      text(numbs.get(i).getNumber(),width/2,height/2);
      delay(1000);
      background(0);
    }
  }
  
  