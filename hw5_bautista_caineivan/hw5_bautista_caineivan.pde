void setup()
{
    size(800,500);
    background(0);
}

// to place the character in the center, use coordX = 385 and coordY = 211
// base point (top left) of the character is (18,421) - original location
// size of the character is 30x78
//coord variables are for the placement of the character
float coordX = random(1,100);
float coordY = random(1,height);

//speed variables are for the movement speed of the character
int speedX = 8;
int speedY = 5;

//mon variables are for the initial placement of the enemy ship
int monX = 680;
int monY = 200;

//move is for the movement speed of the enemy ship
double move = 1;

//Bull variables are for the initial placement of the bullets from the enemy ship
int xBull = abs(monX);
int yBull = abs(monY)+65;

//bullSpeed is for the speed of the bullet from the enemy ship
int bullSpeed = 25;

//variables for the walls
int[] xBar = {150, 250, 150};
int[] yBar = {0, 200, 400};
int xBarL = 10;
int yBarL = 100;

float pxBull = coordX - 8.5;
float pyBull = coordY - 4.5;

int R = 0;
int G = 0;
int B = 0;
int O = 0;

int score = 0;
int hp = 10;

void draw(){
    background(0);
    
    backgroundStars();
    playerDisplay(coordX, coordY);
    consoleDisplay();
    movementMonster();
    enemyShip();
    attackBullet();
    walls();
    attackPlayer();
    
    
    if (key == '9'){
        exit();
    }
}

//for space-like background
void backgroundStars(){
    for (int i = 0; i < 10; i++){
        float starX = random(0,800);
        float starY = random(0,500);
        fill(#FFFFFF);
        ellipse(starX, starY, random(1,10), random(1,10));
    }
}

// for the walls
void walls(){
    for (int i = 0; i < 3; i++){
        rect(xBar[i], yBar[i], xBarL, yBarL);
    }
}
//to display the player
void playerDisplay(float coordX, float coordY){

    headFace(coordX, coordY);
    body(coordX, coordY);
    upperExtrem(coordX, coordY);
    lowerExtrem(coordX, coordY);
}

//to display the enemy
void enemyShip(){
    strokeWeight(5);
    stroke(0);
    fill(#FFFFFF);
    beginShape();
        vertex(monX+105,monY);
        vertex(monX+90,monY);
        vertex(monX+90,monY+15);
        vertex(monX+60,monY+15);
        vertex(monX+60,monY+30);
        vertex(monX+75,monY+30);
        vertex(monX+75,monY+45);
        vertex(monX+15,monY+45);
        vertex(monX+15,monY+60);
        vertex(monX,monY+60);
        vertex(monX,monY+75);
        vertex(monX+15,monY+75);
        vertex(monX+15,monY+90);
        vertex(monX+75,monY+90);
        vertex(monX+75,monY+105);
        vertex(monX+60,monY+105);
        vertex(monX+60,monY+120);
        vertex(monX+90,monY+120);
        vertex(monX+90,monY+135);
        vertex(monX+105,monY+135);
        vertex(monX+105,monY+90);
        vertex(monX+120,monY+90);
        vertex(monX+120,monY+45);
        vertex(monX+105,monY+45);
        vertex(monX+105,monY);
    endShape();
    stroke(50);
    beginShape();
        vertex(monX+30,monY+60);
        vertex(monX+30,monY+75);
        vertex(monX+60,monY+75);
        vertex(monX+60,monY+60);
        vertex(monX+30,monY+60);
    endShape();  
}

//for the enemy's bullet to move
void attackBullet(){
        enemyBullet(xBull, yBull);
        movementBullet();
}

//show the main enemy bullet
void enemyBullet(int x, int y){
    strokeWeight(1);
    stroke(#FF0000);
    fill(0);
        beginShape();
          vertex(x,y);
          vertex(x-18,y);
          vertex(x-27,y+2.5);
          vertex(x-18,y+5);
          vertex(x,y+5);
          vertex(x,y);
        endShape();
    stroke(0);
    fill(#FFFFFF);
}

//vertical movement of the enemy
void movementMonster(){
  if ((monY < -65) || (monY + 65>= height)){
        move *= -1; 
     }
     monY += move;
}

//movement of the main bullet
void movementBullet(){
  if (xBull < -65){
      xBull = abs(monX);
      yBull = monY+65;
  }  
  
  for (int i = 0; i < 3; i++){
      if ((xBull <= xBar[i] + xBarL + 20) && (yBull <= yBar[i] + yBarL) && (yBull >= yBar[i])){
          xBull = abs(monX);
          yBull = monY+65;
      }
  }
  
  if ((xBull <= coordX + 30) && (xBull >= coordX) && (yBull >= coordY) && (yBull <= coordY + 78)){
      xBull = abs(monX);
      yBull = monY+65;
      hp -= 1;
  }
  
  xBull -= bullSpeed;
}

//for the bullets of the character
void attackPlayer(){
    playerBullet(pxBull, pyBull, R, G, B, O);
    playerBulletMove();
    
}
void playerBullet(float pxBull, float pyBull, int R, int G, int B, int O){
    stroke(R, G, B, O);
    line(pxBull + 6, pyBull + 15, pxBull + 12, pyBull + 15);
    line(pxBull + 21, pyBull + 15, pxBull + 27, pyBull + 15);
    stroke(0);
}
void playerBulletMove(){  
  if (mousePressed && (mouseButton == LEFT)){
        R = 255;
        G = 255;
        B = 255;
        O = 100;
        pxBull += 25;
        
        if (pxBull >= width){
            pxBull = coordX;
            pyBull = coordY;
        }
        for (int i = 0; i < 3; i++){
            if ((pxBull >= xBar[i] - xBarL - 5) && (pxBull <= xBar[i] + xBarL) && (pyBull + 15 <= yBar[i] + yBarL) && (pyBull + 15 >= yBar[i])){
              pxBull = coordX;
              pyBull = coordY;
            }
        }
    if (!mousePressed){
        O = 0;
        pxBull = coordX;
        pyBull = coordY;
    }
    
    if ((pxBull + 20.5 >= monX) && (pyBull >= monY) && (pyBull <= monY + 120)){
        pxBull = coordX;
        pyBull = coordY;
        score += 1;
    }
  }
}
void mouseReleased(){
    O = 0;
    pxBull = coordX;
    pyBull = coordY;
}

//for tracking the coordinates
void consoleDisplay(){
    //print("Center: ");
    //println(width/2, height/2);
    //print("Mouse Coordinate: ");
    //println(mouseX, mouseY);
    print("Score: ");
    println(score);
    print("HP: ");
    println(hp);
    //circle(width/2, height/2, 10);
}

//for showing the face
void headFace(float headX, float headY){
    float eyeX = headX;
    int angle = 315;
    float mouthX = headX;
    float eyeBX = headX;
    //to change the facial expression
        if (key == 'w' || key == 'W' || key == 's' || key == 'S'){
            eyeX -= 3;
            angle = 315;
            eyeBX -= 1.5;
        }
        if (key == 'a' || key == 'A'){
            eyeX = headX - 6;
            angle -= 180;
            mouthX = headX + 12;
            eyeBX = headX - 3;
        }
        if (key == 'd' || key == 'D'){
            eyeX = headX;
            angle = 315;
            mouthX = headX;
            eyeBX = headX;
        }
        if (key == CODED){
          if (keyCode == UP || keyCode == DOWN){
              eyeX -= 3;
              angle = 315;
              eyeBX -= 1.5;
          }
          if (keyCode == LEFT){
              eyeX = headX - 6;
              angle -= 180;
              mouthX = headX + 12;
              eyeBX = headX - 3;
          } 
          if (keyCode == RIGHT){
              eyeX = headX;
              angle = 315;
              mouthX = headX;
              eyeBX = headX;
          }
      }
    //head
    beginShape();
        fill(#FFFFFF);
        vertex(headX+3,headY+9);
        vertex(headX+3,headY+24);
        vertex(headX+9,headY+33);
        vertex(headX+21,headY+33);
        vertex(headX+27,headY+24);
        vertex(headX+27,headY+9);
    endShape();

    //eyes
    fill(#FFD700);
    arc(eyeX+10.5,headY+15,3,6,0,PI);
    line(eyeBX+6,headY+15,eyeBX+12,headY+15);
    arc(eyeX+25.5,headY+15,3,6,0,PI);
    line(eyeBX+21,headY+15,eyeBX+27,headY+15);

    //mouth
    noFill();
    line(headX+12,headY+24,headX+18,headY+24);
    arc(mouthX+9,headY+24,6,3,radians(angle), radians(angle + 90));

    //hair
    beginShape();
        fill(#3228AD);
        stroke(#3228AD);
        vertex(headX+3,headY+9);
        vertex(headX+12,headY);
        vertex(headX+9,headY+6);
        vertex(headX+11,headY);
        vertex(headX+18,headY+6);
        vertex(headX+24,headY);
        vertex(headX+27,headY+9);
        stroke(0);
    endShape();
}
void body(float bodyX, float bodyY){
    //body
    fill(#E8BEAC);
    rect(bodyX+6, bodyY+33, 18, 21);

    //shirt
    fill(#FFFFFF);
    arc(bodyX+6,bodyY+33,6,12,0,HALF_PI);
    arc(bodyX+24,bodyY+33,6,12,HALF_PI,PI);
    line(bodyX+6,bodyY+33,bodyX+24,bodyY+33);
    point(bodyX+9,bodyY+39);
    point(bodyX+21,bodyY+39);
    noFill();
    arc(bodyX+9,bodyY+39,8,4,radians(20), radians(160));
    arc(bodyX+21,bodyY+39,8,4,radians(20), radians(160));
    line(bodyX+15,bodyY+42,bodyX+15,bodyY+51);
    line(bodyX+12,bodyY+45,bodyX+18,bodyY+45);
    line(bodyX+12,bodyY+48,bodyX+18,bodyY+48);
}
void upperExtrem(float upX, float upY){
    //arms
    fill(#FFFFFF);
    rect(upX,upY+33,6, 21);
    line(upX+2,upY+54,upX+2,upY+51);
    line(upX+4,upY+54,upX+4,upY+51);
    line(upX+6,upY+54,upX+6,upY+51);
    rect(upX+24,upY+33,6,21);
    line(upX+26,upY+54,upX+26,upY+51);
    line(upX+28,upY+54,upX+28,upY+51);
    line(upX+30,upY+54,upX+30,upY+51);

    //watch
    fill(0);
    stroke(#FFFFFF);
    rect(upX+24,upY+45,6,3);
    stroke(0);
    fill(#FFD700);
    ellipse(upX+27,upY+46.5,3,3);
}
void lowerExtrem(float lowX, float lowY){
    //legs
    fill(#FFFFFF);
    rect(lowX+6, lowY+54, 9, 24);
    rect(lowX+15, lowY+54, 9, 24);

    //shorts
    fill(#3A8891);
    rect(lowX+6,lowY+54,18,9);
    line(lowX+15,lowY+54,lowX+15,lowY+63);

    //shoes
    fill(#7D7D81);
    rect(lowX+6,lowY+72,9,6);
    rect(lowX+15,lowY+72,9,6);
    fill(#3D3D40);
    rect(lowX+9,lowY+75,3,3);
    rect(lowX+18,lowY+75,3,3);
}
void keyPressed(){
    objBoundary();
    if (keyPressed){
        if (key == 'w' || key == 'W'){
            coordY -= abs(speedY);
        }
        if (key == 's' || key == 'S'){
            coordY += abs(speedY);
        }
        if (key == 'a' || key == 'A'){
            coordX -= abs(speedX);
        }
        if (key == 'd' || key == 'D'){
            coordX += abs(speedX);
        }
    }
    if (key == CODED){
        if (keyCode == UP){
            coordY -= abs(speedY);
        }
        if (keyCode == DOWN){
            coordY += abs(speedY);
        }
        if (keyCode == LEFT){
            coordX -= abs(speedX);
        } 
        if (keyCode == RIGHT){
            coordX += abs(speedX);
        }
    }
}

//boundary of the game
void objBoundary(){
    if (coordX <= 0){
        coordX += 10;
        background(random(255), random(255), random(255));
    }
    if (coordX+30 >= width){
        coordX += -10;
        background(random(255),random(255), random(255));
    }
    if (coordY <= 0) {
        coordY += 10;
        background(random(255),random(255), random(255));
    }
    if (coordY+78 >= height){
        coordY += -10;
        background(random(255),random(255), random(255));
    }
    for (int i = 0; i < 3; i++){
        if ((coordX + 30 >= xBar[i]) && (coordX <= xBar[i] + xBarL) && (coordY + 78 >= yBar[i]) && (coordY <= yBar[i] + yBarL)){
            coordX += -10;
        }
    }
}
