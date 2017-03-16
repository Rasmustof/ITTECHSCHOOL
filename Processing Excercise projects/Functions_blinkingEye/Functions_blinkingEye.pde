boolean isEyeOpen = true;

void setup() {
  size(500,500);
  
}
void draw() {
  background(120);
  drawEye(isEyeOpen,350,200,100,50);
  drawEye(isEyeOpen,150,200,100,50);
   eyeControl();
}
void drawEye(boolean isOpen, int x, int y, int widthL, int widthS) {
  if (isOpen){
    noStroke();
    fill(255);
    ellipse(x, y, widthL, widthL);
    fill(0);
    ellipse(x, y, widthS, widthS);
  }
}
void eyeControl(){
 if(mousePressed){
   isEyeOpen= false;
 }else isEyeOpen = true;
}