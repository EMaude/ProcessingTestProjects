class Line
{
  private float x1;
  private float y1;
  private float x2;
  private float y2;
  
  Line(float X1, float Y1, float X2,float Y2)
  {
    x1 = X1;
    y1 = Y1;
    x2 = X2;
    y2 = Y2;
  }
  
  void display()
  {
   line(x1, y1, x2, y2); 
  }
}