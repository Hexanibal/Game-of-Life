class LifeGame{
  
  int cellsX, cellsY;
  boolean[][] cells;
  
  PVector cellsSize;
  
  int percentFill = 60;
  
  LifeGame(int cellsX, int cellsY){
    this.cellsX = cellsX;
    this.cellsY = cellsY;
    this.cellsSize = new PVector(width / cellsX, height / cellsY);
    cells = new boolean[cellsX][cellsY];
    
    //cells[72][35] = true;
    //cells[73][35] = true;
    //cells[74][35] = true;
    //cells[75][35] = true;
    //cells[76][35] = true;   
    //cells[77][35] = true;
    //cells[78][35] = true;
    //cells[79][35] = true;
    //cells[80][35] = true;
    //cells[81][35] = true;
    
    cells[72][35] = true;
    cells[73][35] = true;
    cells[71][36] = true;
    cells[72][36] = true;
    cells[72][37] = true; 
    
    //for(int i = 0; i < cellsX; i++){
    //  for(int j = 0; j < cellsY; j++){
    //    cells[i][j] = (int(random(100)) <= percentFill) ? true : false;
    //  }
    //}

  }
  
  public void setDisplay(){
    float deltaX = width - (cellsSize.x * cellsX);
    float deltaY = height - (cellsSize.y * cellsY);
    
    float locX = 0;
    float locY = 0;
    
    for(int i = 0; i < cellsX; i++){
      for(int j = 0; j < cellsY; j++){
        
        fill( (cells[i][j]) ? 0 : 255);  
        stroke(200);
        
        //if(deltaX == 0.0){
        //  locX = i * cellsSize.x;
        //}else{
        //  locX = i * cellsSize.x + deltaX / 2;
        //}
        
        //if(deltaY == 0.0){
        //  locY = i * cellsSize.x;
        //}else{
        //  locY = j * cellsSize.y + deltaY / 2;
        //}
        
        
        //rect(locX, locY, cellsSize.x, cellsSize.y);
        
        rect(i * cellsSize.x, j * cellsSize.y, cellsSize.x, cellsSize.y);
      }
    }
  }
  
  public void update(){
    boolean[][] newPop = new boolean[cellsX][cellsY];
    
    int neib = 0;
    boolean cell;
    for(int x = 0; x < cellsX; x++){
      for(int y = 0; y < cellsY; y++){
        cell = cells[x][y];
        neib = 0;
        
        if(x == 0 && y == 0){
          if(cells[x + 1][y]) neib++;
          if(cells[x + 1][y + 1]) neib++;
          if(cells[x][y + 1]) neib++;
          
        }else if(x == cellsX - 1 && y == 0){
          if(cells[x - 1][y]) neib++;
          if(cells[x][y + 1]) neib++;
          if(cells[x - 1][y + 1]) neib++;
          
        }else if(x == cellsX - 1 && y == cellsY - 1){
          if(cells[x - 1][y]) neib++;
          if(cells[x - 1][y - 1]) neib++;
          if(cells[x][y - 1]) neib++;

        }else if(x == 0 && y == cellsY - 1){
          if(cells[x][y - 1]) neib++;
          if(cells[x + 1][y - 1]) neib++;
          if(cells[x + 1][y]) neib++;
          
        }else if(x == 0){
          if(cells[x][y - 1]) neib++;
          if(cells[x + 1][y - 1]) neib++;
          if(cells[x + 1][y]) neib++;
          if(cells[x + 1][y + 1]) neib++;
          if(cells[x][y + 1]) neib++;
          
        }else if(x == cellsX - 1){
          if(cells[x - 1][y]) neib++;
          if(cells[x - 1][y - 1]) neib++;
          if(cells[x][y - 1]) neib++;
          if(cells[x][y + 1]) neib++;
          if(cells[x - 1][y + 1]) neib++;
          
        }else if(y == 0){
          if(cells[x - 1][y]) neib++;
          if(cells[x + 1][y]) neib++;
          if(cells[x + 1][y + 1]) neib++;
          if(cells[x][y + 1]) neib++;
          if(cells[x - 1][y + 1]) neib++;
          
        }else if(y == cellsY - 1){
          if(cells[x - 1][y]) neib++;
          if(cells[x - 1][y - 1]) neib++;
          if(cells[x][y - 1]) neib++;
          if(cells[x + 1][y - 1]) neib++;
          if(cells[x + 1][y]) neib++;
        }else{
          if(cells[x - 1][y]) neib++;
          if(cells[x - 1][y - 1]) neib++;
          if(cells[x][y - 1]) neib++;
          if(cells[x + 1][y - 1]) neib++;
          if(cells[x + 1][y]) neib++;
          if(cells[x + 1][y + 1]) neib++;
          if(cells[x][y + 1]) neib++;
          if(cells[x - 1][y + 1]) neib++;
        }
        
           if(neib == 3){
              newPop[x][y] = true;
           }else if(neib == 2){
              newPop[x][y] = cell;
           }else{
              newPop[x][y] = false;
           }
        }
        
      }
    
    cells = newPop;
  }
  
}