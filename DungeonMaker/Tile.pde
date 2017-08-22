class Tile
{
  public float visited;
  
  private float x;
  private float y;
  private int i;
  private int j;
  //x, y is the tile center pos
  // points are (x +/- tileSize/2, y +/- tileSize/2)
  
  
  private ArrayList<Tile> neighbours = new ArrayList<Tile>();
  private ArrayList<Line> edges = new ArrayList<Line>();
  
  Tile(float X, float Y)
  {
    x = X + tileOffset;
    y = Y + tileOffset;
  }
  
  void display()
  {
    for(Line edge : edges)
    {
      edge.display();
    }
  }
  
  void setArrayPos(int I, int J)
  {
    i = I;
    j = J;
  }
  
  void makeEdges(int choice)
  {
    boolean flagB = false; // flag if tile is on bottom edge to not randomly add any edge there -- avoid duplicate edge
    boolean flagR = false; // flag if tile is on right edge to not randomly add any edge there -- avoid duplicate edge
    //if on edges, ensure you draw those edges
    
    //bottom
    if(i == cols - 1)
    {
      edges.add(new Line(x + tileSize/2, y + tileSize/2, x + tileSize/2, y - tileSize/2));
      flagB = true;
    }
    //right    
    if(j == rows - 1)
    {
      edges.add(new Line(x + tileSize/2, y + tileSize/2, x - tileSize/2, y + tileSize/2));
      flagR = true;
    }
    //top
    if(j == 0)
    { 
      edges.add(new Line(x - tileSize/2, y - tileSize/2, x + tileSize/2, y - tileSize/2));
    }
    //left
    if(i == 0)
    {
      edges.add(new Line(x - tileSize/2, y - tileSize/2, x - tileSize/2, y + tileSize/2));
    }
    // random selection to fill
    
      switch(choice)
      {
       case 0: 
             break;
       case 1:
             if(flagB == false)
             {
               edges.add(new Line(x + tileSize/2, y + tileSize/2, x + tileSize/2, y - tileSize/2));
             }
             break;
       case 2:
            if(flagR == false)
            {
               edges.add(new Line(x + tileSize/2, y + tileSize/2, x - tileSize/2, y + tileSize/2));
            }
            break;
       case 3:
       
             if(flagB == false)
             {
               edges.add(new Line(x + tileSize/2, y + tileSize/2, x + tileSize/2, y - tileSize/2));
             }
             
             if(flagR == false)
             {
              edges.add(new Line(x + tileSize/2, y + tileSize/2, x - tileSize/2, y + tileSize/2));
             }
             break;
       default:
            break;
    }
  }
  
  
  void highlight()
  {
    ellipse(x, y, 5, 5);
  }
}