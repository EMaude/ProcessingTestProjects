float x1, y1, rx, ry, maxRX, maxRY, r, g, b;

color col;

void setup()
{
  frameRate(30);
  size(1000, 1000);
  background(50);
}

void update()
{
   x1 = random(-width, width);
   y1 = random(-height, height);
   
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
   
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   
   col = color(r, g, b);
}

void draw()
{
  update();
  fill(col);
  ellipse(x1, y1, rx, ry);
  
}