class Point
{
  PVector pos = new PVector();
  
  Point()
  {
    pos.x = random(0, width);
    pos.y = random(0, height);
    
  }
  
  void update()
  {
    
  }
  
  void show()
  {
    fill(0);
    noStroke();
    ellipse(pos.x, pos.y, 4, 4);
  }
  
}