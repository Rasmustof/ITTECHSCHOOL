void setup(){

}
void draw(){
  
}
void determineSize(int number){
  if(number < 10) println(number + " is a low number");
  if(number > 20)println(number + " is a highnumber");
  if(number >= 10 && number <= 20)println(number + " is a medium number");
}
void mouseReleased(){
  determineSize((int)random(5,25));
}