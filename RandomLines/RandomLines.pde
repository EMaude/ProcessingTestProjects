float x1, y1, x2, y2;
float r, g, b;
float weight;

void setup()
{
  size(1000, 1000);
  
  background(50);
}

void update()
{
   x1 = width/2;
   y1 = height/2;
   
   x2 = random(0, width);
   y2 = random(0, height);
   
   r = random(0, 255);
   g = random(0, 255);
   b = random(0, 255);
   
   weight = random(1, 4);
   
}

void draw()
{
  update();
  strokeWeight(weight);
  stroke(r, g, b);
  line(x1, y1, x2, y2);
  
} 