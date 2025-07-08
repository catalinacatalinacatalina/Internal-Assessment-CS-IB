void setup() {
  // creació de pissarra i objectes: constuctors:
  p = new Pines((float)50, (float)280, (float)700,(float)700, (float)100, (float)width-100);

  img1 = loadImage("sobreNosotros1.jpg");
  img2 = loadImage("sobreNosotros2.jpg");
  img3 = loadImage("sobreNosotros3.jpg");
  usuario = loadImage("userIcon.png");

  goToMiEquipo      =  new Button("", 150 + 1*(width- 120)/6, hBanner/5, 150 + 2*(width- 120)/6, hButton, false);
  goToPizarra       =  new Button("", 150 + 2*(width- 120)/6, hBanner/5, 150 + 3*(width- 120)/6, hButton, false);
  goToResultados    =  new Button("", 150 + 3*(width- 120)/6, hBanner/5, 150 + 4*(width- 120)/6, hButton, false);
  goToGuardados     =  new Button("", 150 + 4*(width- 120)/6, hBanner/5, 150 + 5*(width- 120)/6, hButton, false);
  goToSobreNosotros =  new Button("", 150 + 5*(width- 120)/6, hBanner/5, 150 + 6*(width- 120)/6, hButton, false);

  b1 = new Button("NEXT", 25 + tableW/2 + wButton/1.5, height - hButton - 20, wButton, hButton, true);
  b2 = new Button("PREV", 25 + tableW/2 - wButton/1.5, height - hButton - 20, wButton, hButton, true);

  next = new Button("NEXT", width- 150 - 25, height - 55, 150, 50, true);
  prev = new Button("PREV", 25, height - 55, 150, 50, true);

  save           =  new Button("S", width - 45,  10 + hBanner, 40 ,40, true );
  newPlayer      =  new Button("NP", width - 45,  10 + hBanner, 40 ,40, true );
  close          =  new Button("Cerrar", width/2, height - 200, 150, 50, true);

  reset          =  new Button("Reset", 50, height - hButton - 20,wButton, hButton, true);
  entrenamiento  =  new Select("Modo entrenamiento",50, 70 ,  true,   20);
  competicion    =  new Select("Modo competición",  50, 100 , false,  20);
  mediaPista     =  new Select("Media pista",       50, 150 , false,  20);
  pistaEntera    =  new Select("Pista entera",      50, 180 , true,   20);

  guardado1      =  new Guardado(img1, "k1", 17, 04, 2021, 125, 100);

  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);

  //creació jugadors
  p1   = new Player("Pere Joan", "Gomila" , "home", "Libero", "Col", 10, 999999999, 2001, 16, 2, "perej@mail.com");
  p2   = new Player("Pere Joan", "Gomila" , "home", "Central", "Punta", 10, 999999999, 2001, 16, 2, "perej@mail.com");
  p3   = new Player("Pere Joan", "Gomila" , "home", "Opuesto", "Central", 10, 999999999, 2001, 16, 2, "perej@mail.com");


  cono = loadImage("cono.png");

  fuente1 = createFont("HKGrotesk-Bold.otf", 40);
  fuente2 = createFont("Coco-Sharp-Extrabold-trial.ttf", 40);
  fuente3 = createFont("Coco-Sharp-Heavy-Italic-trial.ttf", 40);
  fuente4 = createFont("Keiner-SemiBold.ttf", 25);

  nSaved = new TextField(550, 400, 200, 35);
  dSaved = new TextField(800, 450, 50, 35);
  mSaved = new TextField(870, 450, 50, 35);
  ySaved = new TextField(940, 450, 50, 35);

  int h  = 314 - (int)hBanner;
  int alturaCelda=20;

  dayn      = new TextField(400, h, 3/2*alturaCelda, alturaCelda);
  monthn    = new TextField(400+50, h, 3/2*alturaCelda, alturaCelda);
  yearn     = new TextField(400+100, h, 3/2*alturaCelda, alturaCelda);
  telefono  = new TextField(400, h+50, 200, alturaCelda);
  correo    = new TextField(400, h+2*50, 200, alturaCelda);
  dni       = new TextField(400, h+3*50, 200, alturaCelda);

  ndorsal   = new TextField(946, 315 -(int)hBanner, alturaCelda, alturaCelda);


 // s1 = new TextField(x, y, 75, 25);
 // s2 = new TextField(x, y, 75, 25);

  /*
  s1_1 = new TextField(x, y, 75, 25);
  s1_2 = new TextField(x, y, 75, 25);
  s2_1 = new TextField(x, y, 75, 25);
  s2_2 = new TextField(x, y, 75, 25);
  s3_1 = new TextField(x, y, 75, 25);
  s3_2 = new TextField(x, y, 75, 25);
  s4_1 = new TextField(x, y, 75, 25);
  s4_2 = new TextField(x, y, 75, 25);
  s5_1 = new TextField(x, y, 75, 25);
  s5_2 = new TextField(x, y, 75, 25);
*/

  r1 = new Resultado((width+ 20)/6, height/2 - 50, 0);
  r2 = new Resultado(3*(width+20)/6,height/2 - 50 , 1);
  r3 = new Resultado(5*(width+20)/6, height/2 - 50, 2);
  r4 = new Resultado((width+20)/6, height/2 - 50, 3);
  r5 = new Resultado(3*(width+20)/6,height/2 - 50 , 4);
  r6 = new Resultado(5*(width+20)/6, height/2 - 50, 5);

  //array de resultados para la posterior recorrimiento
  Resultado [] arrResultados = {r1, r2, r3, r4, r5, r6};

  cono1 = new Cone (width-45, height - hBanner - 70);

  e = new ListaPaginada(arrResultados,10, 10, width- 100, height*9/10);
  e.setButtons("bPrev.png", "bNext.png");

  //size(1200, 780);
  size(1300,900);
  fullScreen();
  noStroke();
  textAlign(CENTER);
  textSize(18);
  textFont(fuente4);
}


void draw() {

  if(frameCount<75){
    inicio();
  } else if(frameCount<125){
    fill(226,226, 240, i);
    rect(0,0,width, height);
    i++;
  } else{
    template(j);
    pushMatrix();
      translate(marginW, hBanner+marginH);
      pantallas(j);
    popMatrix();

    //println(pantalla);
    mousePointer();
    updateCursor();

    if(j<255){
      j+=25;
    }
  }
}

void pantallas (int j){
  //println(pantalla);
  if (pantalla==-1) { //entrada
    paleta();
  }
  if (pantalla==0) { //entrada
    p0(j);   
  }
  if (pantalla==1) { //mi equipo
    p1();
  }
  if (pantalla==2) {
    p2();
  }
  if (pantalla==3) {
    resultados();
  }
  if (pantalla==4) {
    guardados();
  }
  if (pantalla==5) {
    sobreNosotros();
  }
  if (pantalla==6) {
    p1.display();
  }
  if (pantalla==7) {
    newPlayer();
  }
}

void keyPressed() {
  if(key=='ñ'){
    pantalla=6;
  }
  if(key=='p'){
    pantalla= -1;
  }
  if ( key=='d' || key =='D') {
    pantalla++;
  }
  if ( key=='a' || key =='A') {
    pantalla--;
  }
  if (key=='t'){
    mediaPista.setSelected(!mediaPista.getSelected());
    pistaEntera.setSelected(!mediaPista.getSelected());
  }
  if (key=='c'){
    competicion.setSelected(!competicion.getSelected());
    entrenamiento.setSelected(!competicion.getSelected());
  }
  if(key =='R'|| key=='r'){
    p.resetPinPositions();
  }
  nSaved.keyPressed(key, (int)keyCode);
  dSaved.keyPressed(key, (int)keyCode);
  mSaved.keyPressed(key, (int)keyCode);
  ySaved.keyPressed(key, (int)keyCode);
}

void mousePointer(){
  if(mousePressed){  
    println("mouse X: "+ mouseX);
    println("mouse Y: "+ mouseY);
  }
}

void updateCursor(){
  
  if((goToMiEquipo.mouseOverButton() && goToMiEquipo.enabled)||
     (goToGuardados.mouseOverButton() && goToGuardados.enabled)||
     (goToPizarra.mouseOverButton() && goToPizarra.enabled) ||
     mouseOverObject(0,0,0,0) || save.mouseOverButton() || 
     (b1.mouseOverButton() && b1.enabled)||
     (b2.mouseOverButton() && b2.enabled)|| 
     mouseOverObject(width-45, height - 70, 35, 45) //cono
     ){
      cursor(HAND);
  } else {
     cursor(ARROW);
  }
}

void mousePressed(){
  if(goToMiEquipo.mouseOverButton() && mousePressed){
    pantalla = 1;
  }
  if(goToPizarra.mouseOverButton()  && mousePressed){
    pantalla = 2;  
  }
  if(goToResultados.mouseOverButton() && mousePressed){
    pantalla = 3;
  }
  if(goToGuardados.mouseOverButton() && mousePressed){
    pantalla = 4;
  }
  if(goToSobreNosotros.mouseOverButton() && mousePressed){
    pantalla = 5;
  }
  if(mouseOverLogo()&& mousePressed){
    pantalla = 0;
  }
  
  if(b1.mouseOverButton() && b1.enabled){
    t.nextPage();
  }
  else if(b2.mouseOverButton() && b2.enabled){
    t.prevPage();
  }
  
  if(false){
    mSaved.isPressed();
    nSaved.isPressed();
    ySaved.isPressed();
    dSaved.isPressed();
  }
  if(newPlayer.mouseOverButton() && mousePressed){
    pantalla=7;
    //nuevoJugador1.setDisp(true);
    //println("El pop up new player se encuentra en: "+ nuevoJugador1.getDisplay());
  }
  if(close.mouseOverButton() && mousePressed){
    //nuevoJugador1.setDisp(false);
  }

  if(prev.mouseOverButton() && mousePressed && prev.enability()){
    e.prev();
  }
  if(next.mouseOverButton() && mousePressed && next.enability()){
    println("mouse over next");
    e.next();
  }
  if(reset.mouseOverButton()&&mousePressed){
    p.resetPinPositions();
  }

  if(entrenamiento.mouseOverSelected()&&mousePressed){
    println("ENTRENAMIENTO PRESSED");
    entrenamiento.setSelected(true);
    competicion.setSelected(!true);
  }
  if(competicion.mouseOverSelected()&&mousePressed){
    competicion.setSelected(true);
    entrenamiento.setSelected(!true);
  }

  if(mediaPista.mouseOverSelected()&&mousePressed){
    println("mediaPista PRESSED");
    mediaPista.setSelected(true);
    pistaEntera.setSelected(!true);
  }
  if(pistaEntera.mouseOverSelected()&&mousePressed){
    pistaEntera.setSelected(true);
    mediaPista.setSelected(!true);
  }
}

boolean mouseOverLogo(){
  boolean a = (mouseX >= marginW+10) && 
          (mouseX<=303) && 
          (mouseY>= 19) && 
          (mouseY<= 50);
  if(a){
    cursor(HAND);
  }else{cursor(ARROW);}
  return a ;
}