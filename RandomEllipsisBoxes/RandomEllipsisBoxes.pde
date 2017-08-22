float x1, y1, x2, y2, rx, ry, maxRX, maxRY, r, g, b;
color col;
int i;

void setup()
{
  frameRate(30);
  size(1000, 1000);
  background(50);
}

void update()
{
  //Shape selector
  i = int(random(0, 10));
  
  //Shape starting pos
   x1 = random(-width, width);
   y1 = random(-height, height);
  
  //rectangle end pos
   x2 = random(-width , width);
   y2 = random(-height, height);
  
  //ellipsis radius
  //calculate distance from center to edge of window, set radius to random under that value
   
   if(x1 < width/2){
     maxRX = x1 - 1;
   }else{
     maxRX =  width - x1;
   }
   
   if(y1 < height/2){
     maxRY = y1 - 1;
   }else{
     maxRY =  height - y1;
   }
   
   rx = random(1, maxRX);
   ry = random(1, maxRY);
   
   //color
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   
   col = color(r, g, b);
}

void draw()
{
  update();
  
  fill(col);
  if(i > 6)
  {
    rect(x1, y1, x2, y2);
    
  }else{  
    ellipse(x1, y1, rx, ry);
  }
  
}