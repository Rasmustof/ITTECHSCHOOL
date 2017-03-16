void draw(){
  if(!(isTrue())){
    print("We got a 0\n");
  } else print("We got a 1\n");
}

boolean isTrue(){
  if(1 != random(0,1)){
  return true;
  }else return false;
}