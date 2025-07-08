

void p2(){

  if(mediaPista.getSelected()){
    halfBlackboard();
    p.displayPins1();

  } else{
    fullBlackboard();
    p.displayPins1();
  }
  
  p.checkPinsMotion();
  
  textAlign(CENTER);

  if (entrenamiento.getSelected()){
    text("TRAINING", width/2, height/2);
    
  } else{
    text("PLAYING", width/2, height/2);
    
  }
  
  if(competicion.getSelected()&&pistaEntera.getSelected()){
    p.displayPins2();
  }
  toolBar(entrenamiento.getSelected());
  menu();
  

}


//Dibuja sólo media pista
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

//Dibuja la barra de herramientas en función de si está 
//habilitado el modo entrenamiento o el modo competición
void toolBar(boolean training){
  
  pushStyle();
    
    fill(255);
    stroke(0);
    strokeWeight(0);
   
    rect(width-wTB-marginW,0, wTB, height-hBanner-2*marginH);
    strokeWeight(2);
    line(width-wTB-marginW, 0, width-wTB-marginW, height-hBanner-2*marginH);

    rectMode(CORNER);
    strokeWeight(1);

    save.display();
    colores(width-45, (height-hBanner-40)/2 - 60, color (255, 0,0));
    colores(width-45, (height-hBanner-40)/2, color (0, 255,0));
    colores(width-45, (height-hBanner-40)/2+60, color (0, 0,255));

    if(mouseOverObject(0,0,width- 40, height-hBanner)){
      
      if(mousePressed){
        fill(currentCol);
        ellipse(mouseX, mouseY-hBanner, 5, 5);
      }
    }else{
      cursor(ARROW);
    }

    if(training){
      image(cono,width-45, height - hBanner - 70, 35, 45);
      if (mouseOverObject(width-45, height - 70, 35, 45) && mousePressed){
          cono1.display();
          nConos++;
          println("número de conos: "+ nConos);
          delay(1000);
      }
      if(cono1.mouseOverCono()){
        cono1.setPosition(mouseX, mouseY);
      }
    }
  popStyle();
}

//Dibuja la pantalla entera
void fullBlackboard(){
  pushMatrix();
    pushStyle();
    
      rectMode(CENTER);
      fill(255);
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

      line(2*wBlackboard/3, -20, 2*wBlackboard/3, hBlackboard +20);
      line(4*wBlackboard/3, -20, 4*wBlackboard/3, hBlackboard +20);

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

//dibuja el menú
void menu(){
  pushStyle();
    
    stroke(0);
    strokeWeight(4);
    fill(0);
    textAlign(CENTER);
    

    //En caso de que el menú no esté desplegado, muestra tres rayas
    //en la parte superior izquierda de la pantalla.
    //De lo contrario, muestra el menú entero.
    if (!menuDisplayed){      
      line(15, 15, 60, 15);
      line(15, 30, 60, 30);
      line(15, 45, 60, 45);
    } else{

      for(int i=0; i<2*height; i+=10){
        if(i%3==0){
            stroke(redSalsa,100);
        }else if(i%3==1){
            stroke(royalBlueDark,100);
        }else{
            stroke(ming,100);
        }

        if(i<300){
        line(i, 0, 0,i);
        }else{
          line(300, i-300, 0, i);
        }
      }

      fill(blackCoral, 170);
      strokeWeight(1);
      rect(25,50,250,250);

      stroke(0);
      strokeWeight(4);
      line(15, 15, 15+30, 15+30);
      line(15, 15+30, 15+30, 15);
      stroke(255);
      strokeWeight(1);


      textAlign(LEFT);
      textSize(40);
      fill(prussianBlue);
      pushStyle();
      textFont(fuente2);
      //Título:
      text("Menú:", 80, 45);
      popStyle();

      fill(255,255,255, 0);
      strokeWeight(1);      

      //Selects:
      entrenamiento.display();
      competicion.display();
      mediaPista.display();
      pistaEntera.display();
      reset.display();
    }

    //Sólo es posible pulsar el boton cuando el framecount es un múltiple de 5
    //para mejorar experiencia del usuario y evitar posibles missclicks
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


//Método para devolver si el ratón está encima de un campo u objeto
boolean mouseOverObject(float x, float y, float w, float h){ 
   return (mouseX >= x) && 
          (mouseX<=x + w) && 
          (mouseY>= y) && 
          (mouseY<= y +h); 
}
//??
void colores (float x, float y, color c){
    fill(c);
    rect(x, y, 40, 40, 5);
    
    if(mouseOverObject(x, y+hBanner, 40, 40)){
      cursor(HAND);
      if(mousePressed){
        currentCol = c;
      }
    }
    
}