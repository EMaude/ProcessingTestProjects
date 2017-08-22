
class Cell
{
  color c;
  float hue;
  PVector pos = new PVector();
  PVector vel = new PVector();
  float r;
  int timer;
  boolean mitosis;
  float randomRFactor;
  float randomHFactor;
  float randomSFactor;
  float speed;
  float lastAte;
  int growingAmount;
  int decay;
  boolean die;
  
  Cell(PVector npos, float nr,float nhue, float nspeed)
  {
    randomRFactor = random(0.8, 1.4);
    randomHFactor = random(-2 , 2);
    randomSFactor = random(0.5, 1.5);
    
    pos.x = npos.x;
    pos.y = npos.y;
    
    speed = nspeed * randomSFactor;
    speed = constrain(speed, 1, 10);
    
    r = (nr / 2) * randomRFactor;
    
    hue = nhue * randomHFactor;
    c = color(hue, 127, 127, 127);
    
    mitosis = false;
    die = false;
    lastAte = frameCount;
    decay = 1;
    
  }
  
  void grow(int amount) //eat
  {
    growingAmount = amount;
    decay = 0;
  }
  
  void mitosis()
  {
    mitosis = true;
  }
  
  void update()
  {
    vel.x = random(-speed, speed);
    vel.y = random(-speed, speed);
    pos.add(vel);
    
    if(pos.x > width)
    {
      pos.x = 0;
      
    }else if(pos.x < 0){
      pos.x = width;
      
    }else if(pos.y > height){
      pos.y = 0;
      
    }else if(pos.y < 0){
      pos.y = height;
    }
    
    if( growingAmount > 0)
    {
      r += 1;
      growingAmount--;
    }
    
    if(r > 40)
    {
      this.mitosis();
    }
    
    if(decay >= 10 * frameRate)
    {
      r -= 1;
      //print("shrinking ");
      decay = 0;
    }
    
    if(r <= 1)
    {
      die = true;
    }
    
    decay++;
  }
  
  void show()
  {
    fill(c);
    noStroke();
    ellipse(pos.x, pos.y, r, r);
  }
   
}