boolean menuDisplayed = false;
//HE CREAT SA CLASSE BOTO SELECT, FALTA FER CANVIS
void p2(){
  
  //trainingButton.display();
  //trainingButton1();
  toolBar(entrenamiento.getSelected());
  

  if(mediaPista.getSelected()){
  
    halfBlackboard();
    p.displayPins1();
  
  } else{
    
    fullBlackboard();
    p.displayPins1();
    //p.displayPins2();

  }
  
  p.checkPinsMotion();
  checkChanges();
  
  if (entrenamiento.getSelected()){
    text("TRAINING", width/2, height/2);
    
  } else{
    text("PLAYING", width/2, height/2);
    
  }
  
  if(competicion.getSelected()&&pistaEntera.getSelected()){
    p.displayPins2();
  }
  menu();

}
 
void halfBlackboard() {
 
  pushMatrix();
    pushStyle();
     
      rectMode(CENTER);
      fill(255);
      rect(width/2, height/2, wBlackboard, hBlackboard);
      stroke(0);
      strokeWeight(3);
      translate(width/2-wBlackboard/2,height/2-hBlackboard/2);
     
      beginShape();
        vertex(0, 0);
        vertex(0, hBlackboard);
        vertex(wBlackboard, hBlackboard);
        vertex(wBlackboard, 0);
      endShape(CLOSE);
     
      line(-30, 2*hBlackboard/3, wBlackboard + 30,2*hBlackboard/3);
      line(-40, hBlackboard, wBlackboard + 40, hBlackboard);
 
    popStyle();
  popMatrix();
 
}
 
void toolBar(boolean training){
  
  pushStyle();
    
    fill(255);
    stroke(0);
    strokeWeight(0);
   
    rect(width-wTB-marginW,0, wTB, height-hBanner-2*marginH);
    strokeWeight(2);
    line(width-wTB-marginW, 0, width-wTB-marginW, height-hBanner-2*marginH);
 
    if (training){
      
    }

  popStyle();
}
 
void fullBlackboard(){

  pushMatrix();
    pushStyle();
    
      rectMode(CENTER);
      fill(255);
      //rect(width/2, height/2, wBlackboard*2, hBlackboard);
      stroke(0);
      strokeWeight(3);
      translate(width/2-wBlackboard,height/2-hBlackboard/2-50);
    
      beginShape();
        vertex(0, 0);
        vertex(0, hBlackboard);
        vertex(wBlackboard*2, hBlackboard);
        vertex(wBlackboard*2, 0);
      endShape(CLOSE);
      
      line(wBlackboard, -30,wBlackboard, hBlackboard+30);
  
    popStyle();
  popMatrix();

}
 
void  trainingButton1(){
  
  if(training){
    c1 = color(150);
    c2 = color(100);
  } else {
    c1 = color(100);
    c2 = color(150);
  }


  pushStyle();

    fill(c1);
    stroke(0);
    strokeWeight(2);
    rect(width/2 - wButtonTraining/2, hButtonTraining-20, wButtonTraining/2, hButtonTraining, 10,0,0,10);
    
    fill(c2);  
    rect(width/2, hButtonTraining-20, wButtonTraining/2, hButtonTraining, 0,10,10,0);
 
  popStyle();
}

void checkChanges(){
  
  if(trainingButton.mouseOverButton() && mousePressed){
    
    training =! training;
  }
  
}

void menu(){
  pushStyle();
    
    stroke(0);
    strokeWeight(4);
    fill(0);
    
    
    if (!menuDisplayed){
      line(15, 15, 60, 15);
      line(15, 30, 60, 30);
      line(15, 45, 60, 45);

    } else{

      fill(blackCoral, 140);
      strokeWeight(1);
      rect(0,0,300,height-hBanner-2*marginH);

      line(15, 15, 15+30, 15+30);
      line(15, 15+30, 15+30, 15);
      
      textAlign(LEFT);
      fill(0);
      //textFont(fuente1, 40);
      text("Menú:", 80, 45);

      fill(255,255,255, 0);
      strokeWeight(1);      

      entrenamiento.display();
      competicion.display();
      mediaPista.display();
      pistaEntera.display();


      if(entrenamiento.mouseOverSelected() && mousePressed){
        println(entrenamiento.getSelected());
        entrenamiento.setSelected(!entrenamiento.getSelected());
        println(entrenamiento.getSelected());

      }  
    }


    if(frameCount%5 == 0){
        if((mouseX >= 15) && 
          (mouseX<=120) && 
          (mouseY>= 100) && 
          (mouseY<=130)&& mousePressed){
          menuDisplayed= !menuDisplayed;
        }
    }
  popStyle();

}