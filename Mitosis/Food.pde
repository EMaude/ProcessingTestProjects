class Food
{
    PVector pos = new PVector();
    int amountGrowth;
    float r;
    float timeout;
    float initframe;
    boolean remove;
    
  Food()
  {
    pos.x = random(0, width);
    pos.y = random(0, height);
    timeout = random(400, 600);
    amountGrowth = int(random(2, 10));
    r = amountGrowth * 0.33;
    initframe = frameCount;
    remove = false;
  }
  
  void show()
  {
    fill(255, 255, 255);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
  }
  
  void eaten()
  {
    remove = true;
  }
  
  void timer()
  {
    if(frameCount - initframe >= timeout)
    {
      remove = true;
    }
  }
  
}