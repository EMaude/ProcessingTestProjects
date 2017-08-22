void setup(){
  size(400, 400);
  background(255);
}

void draw(){
  stroke(0);
  
  if(mousePressed){
    line(pmouseX, pmouseY, mouseX, mouseY);
  }
}