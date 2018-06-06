void setup() {
 background(255);
 size(1200, 800);
 int wWidth = 1200;
 int wHeight = 800;
 //noFill();
 stroke(#8B4513);
 fill(#8B4513);
 int pixelSize = 1;
 int start = 400;
 drawSky(250, wWidth);
 stroke(#9B5523);
 fill(#9B5523);
 drawMtn(1, 225, wWidth);
 stroke(#8B4513);
 fill(#8B4513);
 drawMtn(2, 250, wWidth);
 stroke(#7B3503);
 fill(#7B3503);
 drawMtn(3, 275, wWidth);
 drawLake(340, 600, wWidth);
 drawForeground(525, 475, wWidth, wHeight);
}

void drawForeground(int min, int max, int wWidth, int wHeight){
  stroke(#23BC23);
  fill(#23BC23);
  int[] top = new int[wWidth];
  double slope = 0;
  double y = Math.random() * (min - max) + max;
  for(int x = 0; x < wWidth; x++){
    if(y < max){
      y = max;
    }
    if(y > min){
      y = min;
    }
    rect(x, (int) y, 1, 1);
    top[x] = (int) y;
    y+= slope;
    if(Math.random() * 25 < 1){
      slope = 0.7 * Math.random() - 0.35;
    }
    slope += 0.1 * Math.random() - 0.05;
  }
  for(int i = 0; i < wWidth; i++){
    rect(i, top[i], 1, wHeight - top[i]);
  }
  for(int k = (int) (3 * Math.pow(Math.random(), 2)); k >= 0; k--){
    //drawTree(min, wWidth, wHeight);
  }
}

void drawTree(int max, int wWidth, int wHeight){
   int treeBaseX = (int) (Math.random() * wWidth);
   int treeBaseY = (int) (Math.random() * (wHeight - max)) + max;
   int treeHeight = (int) (180 * (Math.random() / 2 + 0.75));
   int treeWidth = (int) (30 * (Math.random() / 2 + 0.75));
   stroke(#663300);
   fill(#663300);
   System.out.println(treeBaseY - treeHeight);
   rect(treeBaseX - treeWidth / 2, treeBaseY - treeHeight, treeWidth / 2, treeHeight);
   rect(treeBaseX, treeBaseY - treeHeight, treeWidth / 2, treeHeight);
   //ellipse();
  
}

void drawSky(int start, int wWidth){
  stroke(#ADD8E6);
  fill(#ADD8E6);
  rect(0, 0, wWidth, start);
  int cloudCount = (int) (Math.random() * 80) + 20;
  fill(#FFFFFF);
  stroke(#FFFFFF);
  for(int i = 0; i < cloudCount; i++){
    drawCloud((int) (Math.random() * wWidth), (int) (Math.random() * start), 0, (int) (Math.random() * 400) + 100);
  }
  
}

void drawCloud(int x, int y, int curSize, int totSize){
  if(curSize < totSize){
    rect(x, y, 8, 5);
    int posSeed = (int) (Math.random() * 30);
    if(posSeed < 3){
      x--;
      y--;
    } else if(posSeed < 4){
      y--;
    } else if(posSeed < 7){
      x++;
      y--;
    } else if(posSeed < 15){
      x--;
    } else if(posSeed < 23){
      x++;
    } else if(posSeed < 26){
      x--;
      y++;
    } else if(posSeed < 27){
      y++;
    } else {
      x++;
      y++;
    }
    curSize++;
    drawCloud(x, y, curSize, totSize);
  }
}


void drawMtn(int pixelSize, int start, int wWidth){
  
  boolean[] below = new boolean[wWidth];
  boolean[] below_pass = new boolean[wWidth];
  
  for(int f = 0; f < wWidth; f++){
    below[f] = true;
    below_pass[f] = true;
  }
  for(int y = start + 50; y >= start - 120; y -= pixelSize +1){
    for(int x = 0; x < wWidth; x += pixelSize){
      below[x] = below_pass[x];
      int chance = 0;
      if(x == 0 || below[x - pixelSize] == true){
        chance += 35;
      }
      if(x >= wWidth - pixelSize || below[x + pixelSize] == true){
        chance += 40;
      }
      chance += 25 - (start + 20 - y) / 10;
      //System.out.println("(" + x + "," + y + ") " +chance);
      if(below[x] && chance > (int)(Math.random() * 100)){
        rect(x, y, pixelSize, pixelSize +1);
      } else {
        below_pass[x] = false;
      }
    }
  }
  //if(pixelSize == 1){

  //}
}




void drawLake(int shore, int start, int wWidth){
  stroke(#338DFF);
  fill(#338DFF);
  rect(0, shore, wWidth, start - shore);
  stroke(#136DFF);
  fill(#136DFF);
  for(int x = 0; x < wWidth; x++){
    for(int y = shore; y < start; y++){
      if(Math.random() * 2500 < 1){
        drawWave(x, y, shore);
      }
    }
  }
  stroke(#FFFF99);
  fill(#FFFF99);
  int distance = 0;
  for(int y = shore; y < shore + 20; y++){
    drawSand(y, distance, wWidth);
    distance++;
  }
  distance = 0;
  for(int y1 = shore; y1 > shore - 15; y1--){
    drawSand(y1, distance, wWidth);
    distance++;
  }
  
  
  
}

void drawWave(int x, int y, int shore){
  int length = (y - shore) / 5 + 12;
  for(int i = 0; i < length; i++){
    if(Math.random() < 0.2){
      y++;
    } else if(Math.random() < 0.25){
      y--;
    }
    rect(x + i, y, 1, 1);
  }
  
  
}

void drawSand(int y, int distance, int wWidth){
  //System.out.println("Drawing sand at y value " + y);
  for(int x = 0; x < wWidth; x++){
      int chance = 0;
      if(1 == 1){
      }
      if(1 == 1){
      }
      chance += (100 - distance * 5);
      if(chance >= Math.random() * 100){
        rect(x, y, 1, 1);
      }
    }
}
//