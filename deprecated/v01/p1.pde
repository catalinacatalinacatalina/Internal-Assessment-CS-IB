void p1(){
  
  createTable(xT,yT,nPlayers);
  //
  table(wT, hT);
  
}

void createTable(float w, float h, int nPlayers){
  /*
  for (int i= 0, d=10; i<nPlayers; i++, d+=10){
    strokeWeight(2);
    fill(random(255));
    rect(w, h+d, wT, hT/nPlayers);
  }*/
}

void table(float w, float h){
  fill(255);
  rect(width/2 - w/2, height/2 -200, w, h);
}
