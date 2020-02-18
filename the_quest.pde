import controlP5.*;
ControlP5 cp5;
Button commencer;
Button quitter;
Textarea theQuest;
PImage image1;
balles balle1;
boolean start = false;
boolean inventaire = false;
boolean balle = false;
boolean haut = false;
boolean droite = false;
boolean bas = false;
boolean gauche = false;
float mouvementXP = 400;
float mouvementYP = 300;
int placeInventaire = 5;
float X;
float Y;                                      //dist un point x et y du perso jusqu'a x y souris
void setup(){
  size(800,600);
  balle1 = new balles();
  background(0);
  image1 = loadImage("Untitled.png");
  cp5 = new ControlP5(this);
  commencer = cp5.addButton("Commencer")
    .setPosition(325,400)
      .setSize(150,50)
        .setColorBackground(color(0,0,255))
          .setVisible(true);
  quitter = cp5.addButton("Quitter")
    .setPosition(325,500)
      .setSize(150,50)
        .setColorBackground(color(0,0,255))
          .setVisible(true);
  theQuest = cp5.addTextarea ("zone")
    .setPosition(230,100)
      .setSize(400,250)
        .setFont(createFont("arial",65))
          .setColor(color(255))
            .setColorBackground(color(0))
              .setVisible(true);
  zone();
    
}
void draw(){
  background(0);
  if (mouvementXP < 40){
    mouvementXP = 40;
  }
  if (mouvementXP > 760){
    mouvementXP = 760;
  }
  if (mouvementYP < 40){
    mouvementYP = 40;
  }
  if (mouvementYP > 560){
    mouvementYP = 560;
  }
  if (start == true){
    plateau();
    if (balle == true){
      balle1.display();
      balle1.tirer();
    }
    patience();
    personnage();
    if (inventaire == true){
      inventaire();
      image(image1,50,50);
    }
    
    
  }
}
void Commencer(){
  commencer.hide();
  quitter.hide();
  theQuest.hide();
  start = true;
}
void zone(){
  theQuest.setText("THE QUEST");
}
void Quitter(){
  commencer.hide();
  quitter.hide();
  background(0);
  theQuest.setPosition(230,230);
  theQuest.setFont(createFont("arial", 50));
  theQuest.setText("Merci de bien vouloir éteindre le programme");
}
void plateau(){
  fill(171, 131, 50);
  stroke(0);
  rect(20,20,760,560);
}
void personnage(){ 
  fill(255);
  ellipse(mouvementXP,mouvementYP,40,40);
}
void inventaire(){
  fill(0,0,0,200);
  rect(0,0,800,600);
  stroke(255);
  fill(0,0,0,250);
  for (int i = 0; i < placeInventaire; i++){
    for (int j = 0; j < placeInventaire; j++){
      rect(i*100+50,j*100+50,50,50);
    }
  }
}
/*void curseur(){
  fill(255,0);
  stroke(255);
  ellipse(mouseX,mouseY,30,30);
}*/
void patience(){
  fill(0,0);
  stroke(0);
  rect(mouvementXP,mouvementYP,800,2);
  rect(mouvementXP,mouvementYP,-800,2);
  rect(mouvementXP,mouvementYP,2,-600);
  rect(mouvementXP,mouvementYP,2,600);
}
void keyPressed(){
  if (key == 'z'){
    mouvementYP -= 20;
    haut = true;
  }
  if (key == 's'){
    mouvementYP += 20;
    bas = true;
  }
  if (key == 'd'){
    mouvementXP += 20;
    droite = true;
  }
  if (key == 'q'){
    mouvementXP -= 20;
    gauche = true;
  }
  if (key == 'e'){
    inventaire = true;
  }
  if (keyCode == ESC){
    inventaire = false;
  }
  if (key == 'c'){
    balle = true;
  }
}
void mousePressed(){
  if ((mouseX < 100) && (mouseX> 50) && (mouseY >50) && (mouseY<100)){
    int coX = mouseX;
    int coY = mouseY;
    println(coX+" "+coY);
  }
  if ((mouseX>150)&&(mouseX<200)&&(mouseY>50)&&(mouseY>100)){
    image(image1,100,50);
  }
}
void mouseReleased(){
  
}

