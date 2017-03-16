 int refreshCount;
 int refreshRate = 100;
 
 
void setup(){
  size(500,500);

  background(157,157,157); 
  
  
  frameRate(60);
  refreshCount = 0;
}
  
  
void draw(){
  fill(random(0,255),random(0,255),random(0,255), random(0,255));
  rect(random(1,499),random(1,499),random(0,100),random(0,100));
  refreshCount++;
  println("Objects On Screen: " + refreshCount);

  if(refreshCount > refreshRate){
    background(157,157,157);
    refreshCount = 0;
} 

}