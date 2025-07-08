  boolean halfB = true;
  boolean training = true;
 
void pant2(){

  
  if(halfB){
  halfBlackboard();
  toolBar(training);
  p.displayPins1();
  }
  else if (!halfB) {
    fullBlackboard();
    p.displayPins1();
    p.displayPins2();
 
  }
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
      //dibuixar fletxes, conos...
    }
  popStyle();
}
 
void fullBlackboard(){}
 
