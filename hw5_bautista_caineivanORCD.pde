size(800,500);
background(0);

//head
beginShape();
  fill(#FFFFFF);
  vertex(21,430);
  vertex(21,445);
  vertex(27,454);
  vertex(39,454);
  vertex(45,445);
  vertex(45,430);
endShape();

//eyes
fill(#FFD700);
arc(28.5,436,3,6,0,PI);
line(24,436,30,436);
arc(43.5,436,3,6,0,PI);
line(39,436,45,436);

//mouth
noFill();
line(30,445,36,445);
arc(27,445,6,3,radians(315), radians(405));

//hair
beginShape();
  fill(#3228AD);
  stroke(#3228AD);
  vertex(21,430);
  vertex(30,421);
  vertex(27,427);
  vertex(39,421);
  vertex(36,427);
  vertex(42,421);
  vertex(45,430);
  stroke(0);
endShape();

//body
fill(#E8BEAC);
rect(24, 454, 18, 21);

//shirt
fill(#FFFFFF);
arc(24,454,6,12,0,HALF_PI);
arc(42,454,6,12,HALF_PI,PI);
line(24,454,42,454);
point(27,460);
point(39,460);
noFill();
arc(27,460,8,4,radians(20), radians(160));
arc(39,460,8,4,radians(20), radians(160));
line(33,463,33,472);
line(30,466,36,466);
line(30,469,36,469);

//arms
fill(#FFFFFF);
rect(18, 454, 6, 21);
line(20,475,20,472);
line(22,475,22,472);
line(24,475,24,472);
rect(42, 454, 6, 21);
line(44,475,44,472);
line(46,475,46,472);
line(48,475,48,472);

//watch
fill(0);
stroke(#FFFFFF);
rect(42,466,6,3);
stroke(0);
fill(#FFD700);
ellipse(45,467.5,3,3);


//legs
fill(#FFFFFF);
rect(24, 475, 9, 24);
rect(33, 475, 9, 24);

//shorts
fill(#3A8891);
rect(24,475,18,9);
line(33,475,33,484);

//shoes
fill(#7D7D81);
rect(24,493,9,6);
rect(33,493,9,6);
fill(#3D3D40);
rect(27,496,3,3);
rect(36,496,3,3);
