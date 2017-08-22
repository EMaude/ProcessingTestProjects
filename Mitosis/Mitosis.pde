
ArrayList<Cell> cellList = new ArrayList<Cell>();
ArrayList<Food> foodList = new ArrayList<Food>();

PFont f;

//int debugCounter;
int deathCount = 0;
float lastFeeding;

void setup()
{
  frameRate(30);
  colorMode(HSB);
  size(1000,1000);
  PVector init = new PVector();
  
  f = createFont("Georgia", 16);
  
  for(int i = 0; i < 10; i++){
    init.x = random(0, width);
    init.y = random(0, height);
    cellList.add(new Cell(init, random(30, 40), random(0, 255), random(2, 8))); 
  }
  for(int i = 0; i < random(80, 100); i++)
  {
    foodList.add(new Food());
    lastFeeding = millis();
  }
  
}

void draw()
{
  background(0, 0, 255);
  
  //FOR EVERY CELL
  for(int i = cellList.size() - 1; i >= 0; i--)
  {
    Cell cell = cellList.get(i);
    
    if(cell.die == true)
    {
      cellList.remove(cell);
      deathCount++;
      System.err.print("Death: ");
      System.err.println(deathCount);
    }
    
    //create new cells
    if(cell.mitosis == true)
    {
      //remove cell
      
      PVector parentpos = new PVector();
      parentpos = cell.pos;
      float parentspeed = cell.speed;
      
      float parentr = cell.r;
      
      float parenthue = cell.hue;
      
      cellList.remove(cell);
      
      //add two new cells
      cellList.add(new Cell(parentpos, parentr, parenthue, parentspeed));
      cellList.add(new Cell(parentpos, parentr, parenthue, parentspeed));
    }
    
    //Eat food when over it
    for(int r = foodList.size() - 1; r >= 0; r--)
    { 
      Food food = foodList.get(r);
      //NEW WAY
      
      float distance = dist(cell.pos.x, cell.pos.y,food.pos.x, food.pos.y);
      //if distance is less than sum of radii then the circles are touching
      if(distance < cell.r + food.r)
      {
        //println("Eat");
        cell.grow(food.amountGrowth);
        food.eaten();
      }
      
      //OLD WAY
      //if((food.pos.x + food.r > cell.pos.x + cell.r) && (food.pos.x - food.r < cell.pos.x + cell.r))
      //{ 
      //  if((food.pos.y + food.r > cell.pos.y - cell.r) && (food.pos.y - food.r < cell.pos.y + cell.r))
      //  {
      //    //println("Eat");
      //    cell.grow(food.amountGrowth);
      //    food.eaten();
      //  }
      //}
      
    }
    
    //update and show cell
    cell.update();
    cell.show();
  }
  
  //FOR EACH FOOD
  for(int i = foodList.size() - 1; i >= 0; i--)
  { 
    Food food = foodList.get(i);
    
    if(food.remove == true)
    {
      //remove and replace food
      foodList.remove(food);
    }
    
    food.show();
  }
  
  //POPULATE NEW FOOD
  if(millis() - lastFeeding > (45 * 1000)){
    int newfood = int(random(10, 30));
    for(int i = 0; i < newfood; i++)
    {
      foodList.add(new Food());
    }
    println("Added ", newfood," food");
    lastFeeding = millis();
  }
  
  fill(0);
  text("Cells: ", 10, height - 50);
  text(cellList.size(), 50, height - 50);
  text("Food: ", 10, height - 30);
  text(foodList.size(), 50, height - 30);
  
  //if(debugCounter > 120){
  //  print("Food: ");
  //  println(foodList.size());
  //  print("Cells: ");
  //  println(cellList.size());
  //  debugCounter = 0;
  //}
  
  //debugCounter++;
}