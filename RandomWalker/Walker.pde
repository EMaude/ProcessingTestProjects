class Walker
{
  PVector pos = new PVector();
  PVector vel = new PVector();
  
  Walker()
  {
    pos.x = width/2;
    pos.y = height/2;
    
  }
  
  void update()
  {
    
  }
  
   void show()
  {
    fill(0, 0, 255);
    noStroke();
    ellipse(pos.x, pos.y, 8, 8);
  }
    
}