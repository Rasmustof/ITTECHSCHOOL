
void setup(){

  size(800, 700);
  frameRate(120);

  //two toned BackGround
  fill(0,0,0,20);
  noStroke();
  rect(400,0,800,700);


}


void draw(){
  stroke(1);
  fill(224,188,171,256);

  //ears
  ellipse(100,325,100,150);
  ellipse(700,325,100,150);

  noStroke();
  //2.nd ears
  fill(0,0,0,10);
  ellipse(110,325,90,140);
  ellipse(690,325,90,140);

  stroke(1);
  fill(224,188,171,255);
  //neck
  rect(300,600,200,500);

  //body
  ellipse(400,350,600,680);
  

//EYE CONTROL

  if(mousePressed){
  
  //closed eyes
    noStroke();
    fill(0,0,0,80);
    rect(250,250,100,5);
    rect(450,250,100,5);
    stroke(1);
    
  }else{
    //open eyes
  
    //eyes white
    fill(255,255,255);
    ellipse(300,250,100,70);

    ellipse(500,250,100,70);

    noStroke();

    //eyes black

    fill(0,0,0,200);

    ellipse(300,250,20,20);

    ellipse(500,250,20,20);
  }


  noStroke();

  fill(0,0,0,80);

  //nose

  ellipse(380,400,20,20);
  ellipse(420,400,20,20);
  
  noFill();
  strokeWeight(3.5);
  stroke(0,0,0,80);
  ellipse(400,400,80,60);

  strokeWeight(1);
  noStroke();
  //MOUTH CHANGING

  fill(0,0,0,100);

  if (mouseX > 400){
    
    //mouth
    arc(400,500,300,200,0,PI);

    //tooth
    fill(255,255,255,255);
    bezier(375,500,375,550,420,550,420,500);
  }
  else{

    rect(250,500,300,5);  
  
  }

}