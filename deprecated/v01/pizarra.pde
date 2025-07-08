void p2() {
  halfBlackboard();
  trainingToolBar();
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

      background(255);
      // Dibuixa la pissarra
    //p.display();
      // Dibuixa els pins
      p.displayPins();

    popStyle();
  popMatrix();

}

void trainingToolBar(){
  pushStyle();
    fill(255);
    stroke(0);
    strokeWeight(0);
    
    rect(width-wTB-marginW,0, wTB, height-hBanner-2*marginH);
    strokeWeight(2);
    line(width-wTB-marginW, 0, width-wTB-marginW, height-hBanner-2*marginH);
  popStyle();
}
