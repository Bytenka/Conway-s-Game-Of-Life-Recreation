int gridSpace = 10;
int backColor = 200;
boolean drawGrid = false;
boolean running = false;
Grid grid[][];

void setup() {
  size(650, 650);
  grid = new Grid[height/gridSpace][width/gridSpace];
  generateGrid();
}

void draw() {

  if (running)
  {
    for (int j = 0; j < grid.length; j++)
    {
      for (int i = 0; i < grid.length; i++)
      {
        int nbNeighbors = 0;
        nbNeighbors = grid[i][j].checkBorn(i, j, nbNeighbors);

        //println(nbNeighbors);

        if (nbNeighbors == 3 && !grid[i][j].isACell)
          grid[i][j].willBorn = true;

        if ((nbNeighbors <= 1 || nbNeighbors >= 4) && grid[i][j].isACell)
          grid[i][j].willDie = true;
      }
    }

    for (int j = 0; j < grid.length; j++)
    {
      for (int i = 0; i < grid.length; i++)
      {
        grid[i][j].bornACell(i, j);
        grid[i][j].dieACell(i, j);
        grid[i][j].display();
      }
    }
    running = false;
  }



  //displayCells();
  displayGrid();
}

void mouseClicked() {

  // if (mouseButton == LEFT)
  addCellAtPos(mouseX, mouseY);
  // else if (mouseButton == RIGHT)
  // removeCellAtPos(mouseX, mouseY);
}

void mouseDragged() {
  addCellAtPos(mouseX, mouseY);
}

void keyPressed() {

  if (key == ' ')
  {
    for (int j = 0; j < grid.length; j++)
    {
      for (int i = 0; i < grid.length; i++)
      {
        grid[i][j].isACell = false;
        grid[i][j].willBorn = false;
        grid[i][j].willDie = false;
      }
    }
  } else
    running = true;
}

void generateGrid() {

  for (int j = 0; j < grid.length; j++)
  {
    for (int i = 0; i < grid.length; i++)
    {
      grid[i][j] = new Grid(gridSpace * i, gridSpace * j);
    }
  }
}

void addCellAtPos(float posX, float posY) {

  int posXInt = floor(posX) / gridSpace;
  int posYInt = floor(posY) / gridSpace;

  for (int j = 0; j < grid.length; j++)
  {
    for (int i = 0; i < grid.length; i++)
    {
      if (grid[i][j].x / gridSpace == posXInt && grid[i][j].y / gridSpace == posYInt)
      {
        if (!grid[i][j].isACell && mouseButton == LEFT)
          grid[i][j].isACell = true;
        else if (grid[i][j].isACell && mouseButton == RIGHT)
          grid[i][j].isACell = false;
      }
    }
  }
}

void displayGrid() {
  for (int j = 0; j < grid.length; j++)
  {
    for (int i = 0; i < grid.length; i++)
    {
      grid[i][j].display();
    }
  }
}

//void displayGrid() {
//  if (drawGrid)
//  {
//    for (int j = 0; j < height/gridSpace; j++)
//    {
//      for (int i = 0; i < width/gridSpace; i++)
//      {
//        grid[i][j].display();
//      }
//    }
//  }
//}