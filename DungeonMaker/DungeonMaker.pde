// Draw grid
// Pick start point on edge
// make map by removing wall segments
// Pick exit point
public float tileSize = 20;
public float tileOffset = 20;
Tile[][] tiles;

int cols;
int rows;

void setup()
{
  size(1000, 1000);
  frameRate(1);
  
  cols = int(width/tileSize - 1);
  rows = int(height/tileSize - 1);
  
  tiles = new Tile[cols][rows];
  
  //create tiles
  for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
        tiles[i][j] = new Tile(i * tileSize, j * tileSize);
        tiles[i][j].setArrayPos(i, j);
        tiles[i][j].makeEdges(int(random(0, 3.9)));
    }
  }
  
  setNeighbours();
  
}

void draw()
{
   background(80);
  
   for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      tiles[i][j].display();
    }
  }
  
  int randCol = int(random(0, cols));
  int randRow = int(random(0, rows));
  
  tiles[randCol][randRow].highlight();
  
  for(Tile tile : tiles[randCol][randRow].neighbours)
  {
     tile.highlight(); 
  }
}

void setNeighbours()
{
   for(int i = 0; i < cols; i++)
  {
    for(int j = 0; j < rows; j++)
    {
      if(i >+ 0 && i < cols)
      {
        tiles[i][j].neighbours.add(tiles[i-1][j]);
      }
      if(i >= 0 && i < rows -1)
      {
        tiles[i][j].neighbours.add(tiles[i+1][j]); 
      }
      if(j > 0 && j < rows)
      {
        tiles[i][j].neighbours.add(tiles[i][j-1]);
      }
      if(j >= 0 && j < rows - 1)
      {
         tiles[i][j].neighbours.add(tiles[i][j+1]);
      }
    }
  }
}