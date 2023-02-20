int monX = 680;
int monY = 200;
double move = 2;
int xBull = abs(monX);
int yBull = abs(monY)+65;

void setup(){
    size(800,500);
    background(0);
}

void draw(){
    background(0);
    movementMonster();
    enemyShip();
    attackBullet();
}
void enemyShip(){
    strokeWeight(5);
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

void movementMonster(){
  if ((monY < -65) || (monY + 65>= height)){
        move *= -1; 
     }
     monY += move;
}
void attackBullet(){
        enemyBullet(xBull, yBull);
        movementBullet();
}
void movementBullet(){
  if (xBull < -65){
      xBull = abs(monX);
      yBull = monY+65;
  }  
  
  xBull -= 50;
}

void enemyBullet(int x, int y){
    strokeWeight(1);
    stroke(#FFFFFF);
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
