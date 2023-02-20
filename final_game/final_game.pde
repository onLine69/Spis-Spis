PFont fontWelcome, fontTitle, fontInstruct, fontQuestion;      //fonts for the intro
PFont fontStats;                                               //font for the stats
PFont fontEnding, fontFScore;                                  //fonts for the ending

//initial placement of the character
float charX = random(1,100);
float charY = 214;

//display coordinates
float charDisplayX = random(1,25);
float charDisplayY = charY;

float charSpeed = 5;                                           //movement speed of the character

//initial placement of the enemy ship
float enemyX = 680;
float enemyY = random(1, 434);

//speed of the bullets
float enemyBullSpeed = 25;      
float playerBullSpeed = 25;

//for the walls
int[] wallX = {150, 250, 150, 250};
int[] wallY = {(int) random(0,50), (int) random(150,200), (int) random(250, 300), (int) random(350,400)};
int wallLX = 10;
int wallLY = 100;

//initial stats
int score = 0;
int hpPlayer = 10;
int hpEnemy = 50;

//allows the options inside the draw function
boolean start = false;      
int next = 0;

//for the instructions
String title = "Spis Spis";
String[] instruction = {"1.   Press '1' to START/RESET\n       the game. \n\n2.   Press '0' to exit the game.", 
"3.   Use WASD or the Arrow Keys\n       to move around. \n\n4.   Status (Score, Your HP, and\n        Enemy HP) is displayed in\n        the bottom section.",
"5.   Click the LEFT or RIGHT MOUSE\n       BUTTON to attack and LONG press to\n       continue attacking. \n\n6.   Releasing the MOUSE BUTTON\n       will make your bullets disappear. ",
"7.   Kill the enemy ship to\n       finish the game. \n\n8.   ENJOY THE GAME:)"};
String[] question = {"Press '1' to Start the Game      Press '3' to Read the Instructions", 
"Press '3' to Continue     Press '2' to Return", 
"Press '3' to Start the Game     Press '2' to Return", 
"Press '1' to Go Back to the Title Screen\nPress '0' to Exit"};

Player player = new Player();
Enemy enemy = new Enemy();
Result result = new Result();
Intro intro = new Intro();

void setup(){
    size(800,500);
    background(0);
    
    //loading the fonts (need to load the fonts inside the setup function)
    fontWelcome = loadFont("OldEnglishTextMT-50.vlw");
    fontTitle = loadFont("BlackadderITC-Regular-48.vlw");
    fontInstruct = loadFont("Verdana-20.vlw");
    fontQuestion = loadFont("SegoePrint-50.vlw");
    fontStats = loadFont("ArialRoundedMTBold-20.vlw");
    fontEnding = loadFont("BlackadderITC-Regular-100.vlw");
    fontFScore = loadFont("BookmanOldStyle-BoldItalic-50.vlw");
}

void draw(){
    if (start) {
        if (hpPlayer > 0){
            background(0);
            backgroundStars();
            walls();
            displayStats();
            player.display(charX, charY);
            enemy.display();
        } else if (hpPlayer == 0){
            result.win();
        }
        
        if (hpEnemy == 0){
            result.lose();
        }
        
        println(start + "- Now Playing");
    } else {
      background(0);
        if (next == 0){
              intro.welcome();
        } else if (next == 1){
              intro.first();
        } else if (next == 2){
              intro.next();
        } else if (next == 3){
              intro.third();
        } else if (next == 4){
              intro.forth();
        }
        
        println(start + "- Not Playing");
    }
    
}

void displayStats(){
    textFont(fontStats);
    textAlign(CENTER, CENTER);
    text("Score: " + score, 250, 480);
    text("Your HP: " + hpPlayer, 400, 480);
    text("Enemy HP: " + hpEnemy, 600, 480);
}

void backgroundStars(){
    for (int i = 0; i < 10; i++){
        float starX = random(width);
        float starY = random(height);
        fill(#FFFFFF);
        ellipse(starX, starY, random(1,10), random(1,10));
    }
}

//for the walls
void walls(){
    for (int i = 0; i < 4; i++){
        rect(wallX[i], wallY[i], wallLX, wallLY);
    }
}

//texts in the end results
class Result{
   
    void win(){
        clear();
        
        textFont(fontEnding);
        textAlign(CENTER, CENTER);
        text("GAME OVER!", 400, 200);
        
        textFont(fontFScore);
        textAlign(CENTER,CENTER);
        text("Final Score: " + score, 400, 300);
        
        intro.returnQuestion();
    }
    
    void lose(){
        clear();
        
        textFont(fontEnding);
        textAlign(CENTER, TOP);
        text("YOU WON!", 400, 200);
        
        textFont(fontFScore);
        textAlign(CENTER,CENTER);
        text("Final Score: " + score, 400, 300);
        
        intro.returnQuestion();
    }
}

//texts in the intro and title screen
class Intro{
    
    void welcome(){
        clear();
        backgroundStars();
        player.displayIntro(charDisplayX, charDisplayY);
        enemy.enemyShip();
        
        textAlign(CENTER, CENTER);
        textFont(fontWelcome);
        text("WELCOME!", width/2, 50);
        textSize(50);
        text("to", width/2, 100);
        
        textAlign(CENTER, CENTER);
        textFont(fontTitle);
        textSize(150);
        text(title, width/2, height/2);
                    
        textAlign(CENTER, CENTER);
        textFont(fontQuestion);
        textSize(20);
        text(question[0], 400, 450);
    }
    
    void first(){
        clear();
        player.displayIntro(charDisplayX, charDisplayY);
        enemy.enemyShip();
        
        textAlign(LEFT, TOP);
        textFont(fontInstruct);
        textSize(40);
        text(instruction[0], 60, 70);
        
        question();
    }
    
    void next(){
        clear();
        player.displayIntro(charDisplayX, charDisplayY);
        enemy.enemyShip();
        
        textAlign(LEFT, TOP);
        textFont(fontInstruct);
        textSize(40);
        text(instruction[1], 60, 70);
        
        question();
    }
    
    void third(){
        clear();
        player.displayIntro(charDisplayX, charDisplayY);
        enemy.enemyShip();
        
        textAlign(LEFT, TOP);
        textFont(fontInstruct);
        textSize(34);
        text(instruction[2], 60, 70);
        
        question();
    }
    
    void forth(){
        clear();
        player.displayIntro(charDisplayX, charDisplayY);
        enemy.enemyShip();
        
        textAlign(LEFT, TOP);
        textFont(fontInstruct);
        textSize(40);
        text(instruction[3], 60, 70);
        
        question();
    }
    
    void question(){
        textAlign(CENTER, CENTER);
        textFont(fontQuestion);
        
        if (next < 4){
            textSize(30);
            text(question[1], 400, 450);
        } else {
            textSize(25);
            text(question[2], 400, 450);
        }
    }
    
    void returnQuestion(){
        textAlign(CENTER, CENTER);
        textFont(fontQuestion);    
        textSize(25);
        text(question[3], 400, 450);
    }
}

//for the player
class Player{
    float headX, headY;                 //for the coordinates of the head
    float eyeX, eyeBX, eyeAngle;        //for the coordinates of the eyes and eyebrow
    float mouthX, mouthY;               //for the coordinates of the mouth
    int O;                              //for the opacity of the bullets
    float playerBullX, playerBullY;     //for the coordinates of the bullets
    
    Player(){
        //initial coordinates and elements of the player's bullets
        O = 0;
        playerBullX = charX - 8.5;
        playerBullY = charY - 4.5;
    }
    
    //display in intro
    void displayIntro(float playerX, float playerY){
        head(playerX,playerY);
        body(playerX,playerY);
    }
    
    //display the player
    void display(float playerX, float playerY){
        head(playerX,playerY);
        body(playerX,playerY);
        bullet();
    }
    
    //head of the player
    void head(float playerX, float playerY){
        
        headX = playerX;  headY = playerY;
        eyeX = headX;  eyeBX = headX;
        mouthX = headX;  mouthY = headY;
        eyeAngle = 315;
        
        facial();    //to change the facial expression
        
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
        line(headX+12,mouthY+24,headX+18,mouthY+24);
        arc(mouthX+9,mouthY+24,6,3,radians(eyeAngle),radians(eyeAngle + 90));
    
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
    
    //facial expression
    void facial(){
        if (key == 'w' || key == 'W' || key == 's' || key == 'S'){
            eyeX -= 3;
            eyeAngle = 315;
            eyeBX -= 1.5;
        }
        if (key == 'a' || key == 'A'){
            eyeX = headX - 6;
            eyeAngle -= 180;
            mouthX = headX + 12;
            eyeBX = headX - 3;
        }
        if (key == 'd' || key == 'D'){
            eyeX = headX;
            eyeAngle = 315;
            mouthX = headX;
            eyeBX = headX;
        }
        if (key == CODED){
          if (keyCode == UP || keyCode == DOWN){
              eyeX -= 3;
              eyeAngle = 315;
              eyeBX -= 1.5;
          }
          if (keyCode == LEFT){
              eyeX = headX - 6;
              eyeAngle -= 180;
              mouthX = headX + 12;
              eyeBX = headX - 3;
          } 
          if (keyCode == RIGHT){
              eyeX = headX;
              eyeAngle = 315;
              mouthX = headX;
              eyeBX = headX;
          }
        }  
        
        if (mousePressed && mouseButton == LEFT){
            eyeX = headX;
            eyeAngle = 315;
            mouthX = headX;
            eyeBX = headX;
        }
    }
    
    //body of the player
    void body(float playerX, float playerY){
        //main body
        fill(#E8BEAC);
        rect(playerX+6, playerY+33, 18, 21);
    
        //shirt
        fill(#FFFFFF);
        arc(playerX+6,playerY+33,6,12,0,HALF_PI);
        arc(playerX+24,playerY+33,6,12,HALF_PI,PI);
        line(playerX+6,playerY+33,playerX+24,playerY+33);
        point(playerX+9,playerY+39);
        point(playerX+21,playerY+39);
        noFill();
        arc(playerX+9,playerY+39,8,4,radians(20), radians(160));
        arc(playerX+21,playerY+39,8,4,radians(20), radians(160));
        line(playerX+15,playerY+42,playerX+15,playerY+51);
        line(playerX+12,playerY+45,playerX+18,playerY+45);
        line(playerX+12,playerY+48,playerX+18,playerY+48);
        
        //arms
        fill(#FFFFFF);
        rect(playerX,playerY+33,6, 21);
        line(playerX+2,playerY+54,playerX+2,playerY+51);
        line(playerX+4,playerY+54,playerX+4,playerY+51);
        line(playerX+6,playerY+54,playerX+6,playerY+51);
        rect(playerX+24,playerY+33,6,21);
        line(playerX+26,playerY+54,playerX+26,playerY+51);
        line(playerX+28,playerY+54,playerX+28,playerY+51);
        line(playerX+30,playerY+54,playerX+30,playerY+51);
    
        //watch
        fill(0);
        stroke(#FFFFFF);
        rect(playerX+24,playerY+45,6,3);
        stroke(0);
        fill(#FFD700);
        ellipse(playerX+27,playerY+46.5,3,3);
        
        //legs
        fill(#FFFFFF);
        rect(playerX+6, playerY+54, 9, 24);
        rect(playerX+15, playerY+54, 9, 24);
    
        //shorts
        fill(#3A8891);
        rect(playerX+6,playerY+54,18,9);
        line(playerX+15,playerY+54,playerX+15,playerY+63);
    
        //shoes
        fill(#7D7D81);
        rect(playerX+6,playerY+72,9,6);
        rect(playerX+15,playerY+72,9,6);
        fill(#3D3D40);
        rect(playerX+9,playerY+75,3,3);
        rect(playerX+18,playerY+75,3,3);
    }
    
    //bullets of the player
    void bullet(){
        stroke(255,255,255,O);
        line(playerBullX + 6, playerBullY + 15, playerBullX + 12, playerBullY + 15);
        line(playerBullX + 21, playerBullY + 15, playerBullX + 27, playerBullY + 15);
        stroke(0);
        moveBullet();    //to update the display
    }
    
    //make the bullet move
    void moveBullet(){
        if (mousePressed && (mouseButton == LEFT)){
            O = 1000;                            //change opacity of the bullet
            playerBullX += playerBullSpeed;      //to update the bullet of the player
        } else if (mousePressed && (mouseButton == RIGHT)){
            playerBullY = charY + 58.2;
            O = 1000;                            //change opacity of the bullet
            playerBullX += playerBullSpeed;      //to update the bullet of the player
        } else {
            O = 0;                    //make the bullet invisible when not pressing the left mouse button
            playerBullX = charX;      //bring the coordinates of the bullets to its desired position
            playerBullY = charY;
        }
        
        //bullet will return to its desired coordinates when it hits the boundaries
        if (playerBullX >= width){
            playerBullX = charX;
            playerBullY = charY;
        }
        
        //bullet can't pass the walls
        for (int i = 0; i < 4; i++){
            if ((playerBullX >= wallX[i] - wallLX - 5) && (playerBullX <= wallX[i] + wallLX) && (playerBullY + 15 <= wallY[i] + wallLY) && (playerBullY + 15 >= wallY[i])){
              playerBullX = charX;
              playerBullY = charY;
            }
        }
        
        //change the score and enemy hp when the bullet hits the enemy
        if ((playerBullX + 20.5 >= enemyX) && (playerBullY >= enemyY) && (playerBullY <= enemyY + 120)){
            playerBullX = charX;
            playerBullY = charY;
            score += 1;
            hpEnemy -= 1;
        }
    }
}

//for the enemy ship
class Enemy{
    float enemyBullX, enemyBullY;      //initial coordinates of the enemy ship
    float enemySpeed;                  //speed of the enemy ship
    
    Enemy(){
        enemyBullX = -100;        //so that the first bullet aligns with the ship when starting the game
        enemyBullY = -100;
        if (enemyBullY <= 250){ 
            enemySpeed = 1;
        } else {
            enemySpeed = -1;
        }
    }
    
    //display the enemy
    void display(){
        enemyShip();
        enemyBullet();
    }
    
    //display the enemy ship   
    void enemyShip(){
        strokeWeight(5);
        stroke(0);
        fill(#FFFFFF);
        beginShape();
            vertex(enemyX+105,enemyY);
            vertex(enemyX+90,enemyY);
            vertex(enemyX+90,enemyY+15);
            vertex(enemyX+60,enemyY+15);
            vertex(enemyX+60,enemyY+30);
            vertex(enemyX+75,enemyY+30);
            vertex(enemyX+75,enemyY+45);
            vertex(enemyX+15,enemyY+45);
            vertex(enemyX+15,enemyY+60);
            vertex(enemyX,enemyY+60);
            vertex(enemyX,enemyY+75);
            vertex(enemyX+15,enemyY+75);
            vertex(enemyX+15,enemyY+90);
            vertex(enemyX+75,enemyY+90);
            vertex(enemyX+75,enemyY+105);
            vertex(enemyX+60,enemyY+105);
            vertex(enemyX+60,enemyY+120);
            vertex(enemyX+90,enemyY+120);
            vertex(enemyX+90,enemyY+135);
            vertex(enemyX+105,enemyY+135);
            vertex(enemyX+105,enemyY+90);
            vertex(enemyX+120,enemyY+90);
            vertex(enemyX+120,enemyY+45);
            vertex(enemyX+105,enemyY+45);
            vertex(enemyX+105,enemyY);
        endShape();
        stroke(50);
        beginShape();
            vertex(enemyX+30,enemyY+60);
            vertex(enemyX+30,enemyY+75);
            vertex(enemyX+60,enemyY+75);
            vertex(enemyX+60,enemyY+60);
            vertex(enemyX+30,enemyY+60);
        endShape();
        strokeWeight(1);
        
        shipMove();    //to update the enemy ship
    }
    
    //movemnent of the enemy ship
    void shipMove(){
        
        //so that the ship can't go beyound the boundary
        if ((enemyY < -65) || (enemyY + 65>= height)){
            enemySpeed *= -1; 
         }
         
         enemyY += enemySpeed;
    }
    
    //display the bullet
    void enemyBullet(){
        strokeWeight(1);
        stroke(#FF0000);
        fill(0);
            beginShape();
              vertex(enemyBullX,enemyBullY);
              vertex(enemyBullX-18,enemyBullY);
              vertex(enemyBullX-27,enemyBullY+2.5);
              vertex(enemyBullX-18,enemyBullY+5);
              vertex(enemyBullX,enemyBullY+5);
              vertex(enemyBullX,enemyBullY);
            endShape();
        stroke(0);
        fill(#FFFFFF);
        
        bulletMove();    //to update the display
    }
    
    //movement of the bullet
    void bulletMove(){
      
        //bullet hits the left boarder
        if (enemyBullX < 0){
            enemyBullX = abs(enemyX);
            enemyBullY = enemyY+65;
        }  
        
        //bullet hits the walls        
        for (int i = 0; i < 4; i++){
            if ((enemyBullX <= wallX[i] + wallLX + 20) && (enemyBullY <= wallY[i] + wallLY) && (enemyBullY >= wallY[i])){
                enemyBullX = abs(enemyX);
                enemyBullY = enemyY+65;
            }
        }
        
        //bullet hits the player
        if ((enemyBullX <= charX + 60) && (enemyBullX >= charX) && (enemyBullY >= charY) && (enemyBullY <= charY + 78)){
            enemyBullX = abs(enemyX);
            enemyBullY = enemyY+65;
            hpPlayer -= 1;
        }
        
        enemyBullX -= enemyBullSpeed;
    }
}

void keyPressed(){
    gameBoundary();    //limit the movement space only inside the visible frame
    
    //move the player's character
    if (keyPressed){
        if (key == 'w' || key == 'W'){
            charY -= abs(charSpeed);
        }
        if (key == 's' || key == 'S'){
            charY += abs(charSpeed);
        }
        if (key == 'a' || key == 'A'){
            charX -= abs(charSpeed);
        }
        if (key == 'd' || key == 'D'){
            charX += abs(charSpeed);
        }
    }
    if (key == CODED){
        if (keyCode == UP){
            charY -= abs(charSpeed);
        }
        if (keyCode == DOWN){
            charY += abs(charSpeed);
        }
        if (keyCode == LEFT){
            charX -= abs(charSpeed);
        } 
        if (keyCode == RIGHT){
            charX += abs(charSpeed);
        }
    }
    
    if (keyPressed && key == '1'){
        if (start){
            start = false;
            
            next = 0;
            charX = random(1,100);
            charY = 214;
            
            //resets the stats
            score = 0;
            hpPlayer = 10;
            hpEnemy = 50;
        } else {
            start = true;
            
            next = 0;
        }
    }
    if (keyPressed && key == '0'){
        exit();
    }
    if (keyPressed && key == '3'){
        next += 1;
        
        if (next > 4){
            start = true;
            
            next = 0;
        }
    }
    if (keyPressed && key == '2'){
        if (next > 0 && next <= 4){
            next -= 1;
        } else if (next > 4){
            next -= 0;
        } else {
            next = 0;
        }
    }
}

//so that the character doesn't go outside the frame
void gameBoundary(){
    
    //for the frame boundary
    if (charX <= 0){
        charX += charSpeed;
    }
    if (charX+30 >= width){
        charX += -charSpeed;
    }
    if (charY <= 0) {
        charY += charSpeed;
    }
    if (charY+78 >= height){
        charY += -charSpeed;
    }
    
    //so that the player can't pass through the walls (only the left side)
    for (int i = 0; i < 4; i++){
        if (charX + 30 >= wallX[i]){
            if ((charX <= wallX[i] + wallLX) && (charY + 78 >= wallY[i]) && (charY <= wallY[i] + wallLY)){
              charX += -charSpeed;
            }
        }
    }
}
