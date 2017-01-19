class Grid { //<>//

  int x;
  int y;
  boolean willBorn = false;
  boolean willDie = false;
  boolean isACell = false;

  Grid (int x_, int y_) {

    x = x_;
    y = y_;
  }

  void display() {
    if (!isACell)
    {
      fill(backColor);
      rect(x, y, gridSpace, gridSpace);
    }
    else
    {
      fill(244, 203, 66);
      rect(x, y, gridSpace, gridSpace);
    }
  }


  int checkBorn(int x, int y, int nbNeighbors) {
    int tempX = x - 1;
    int tempY = y - 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x;
    tempY = y - 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x + 1;
    tempY = y - 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x - 1;
    tempY = y;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x + 1;
    tempY = y;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x - 1;
    tempY = y + 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x;
    tempY = y + 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);

    tempX = x + 1;
    tempY = y + 1;

    nbNeighbors = checkBornRecurs(tempX, tempY, nbNeighbors);
    //println(nbNeighbors);
    return nbNeighbors;
  }

  int checkBornRecurs(int tempX, int tempY, int nb) {
    //println(tempX, tempY);
    if (tempX >= 0 && tempX < grid.length && tempY >= 0 && tempY < grid.length)
    {
      //println("entré");
      if (grid[tempX][tempY].isACell)
      {
        // println("finded");
        nb++;
      }
    }
    return nb;
  }

  void bornACell(int posX, int posY) {

    if (grid[posX][posY].willBorn)
    {
      // println(posX, posY, "born");
      grid[posX][posY].isACell = true;
      grid[posX][posY].willBorn = false;
    }
  }

  void dieACell(int posX, int posY) {
    if (grid[posX][posY].willDie)
    {
      // println(posX, posY, "die");
      //cells.remove(posX, posY);
      grid[posX][posY].isACell = false;
      grid[posX][posY].willDie = false;
    }
  }
}