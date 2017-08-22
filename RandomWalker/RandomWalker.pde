Walker walker;

ArrayList<Point> Points = new ArrayList<Point>(); 


void setup()
{
  size(1000, 1000);
  
  walker = new Walker();
  
  for(int i = 0; i < 10; i++)
  {
    Points.add(new Point());
  }
  
}

Point pickLocation(Walker a)
{
  Point closestPoint;
  float recordDist = 1000;
  for(int i = Points.size() - 1; i >= 0; i--)
  {
    Point point = Points.get(i);
    
    float distance = dist(a.pos.x, a.pos.y, point.pos.x, point.pos.y);
    
    if(distance < recordDist) 
    {
      recordDist = distance;
      closestPoint = point;
    }
  }
  
  return closestPoint;
}

void draw()
{
  background(255);
  //Do For Every Point
  for(int i = Points.size() - 1; i >= 0; i--)
  {
    Point point = Points.get(i);
    point.update();
    point.show();
  }
  
  walker.show();
  
  pickLocation(walker);
  
}