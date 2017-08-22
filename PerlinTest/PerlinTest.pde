
float y, yoff;

float[] points = new float[1000];

void setup()
{
  size(1000, 1000);
  //frameRate(1);
  genPoints();
} 

void genPoints()
{
   for(int x = 0; x < width; x++) 
   {
     y = map(noise(yoff),0, 1, 0, height);
     yoff = yoff + 0.01;
     points[x] = y;
   }
   
}

void draw()
{
   background(80);
   
   for(int i = 1; i < points.length; i++)
   {
     stroke(255);
     line(i, points[i], i - 1, points[i - 1]);
   }
   
}