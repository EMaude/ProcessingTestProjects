float x1, y1, x2, y2;
float r, g, b;


void setup()
{
  frameRate(30);
  size(1000, 1000);
  background(50);
}

void update()
{
   x1 = random(-width , width);
   y1 = random(-height, height);
   
   x2 = random(-width , width);
   y2 = random(-height, height);
   
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   
}

void draw()
{
  update();
  
  fill(r, g, b);
  rect(x1, y1, x2, y2);
  
} 