
PImage img1, img2, img3;

PFont fuente1, fuente2;

Button goToMiEquipo;
Button goToPizarra;
Button goToResultados;
Button goToGuardados;
Button goToSobreNosotros;

Button save;

Pissarra p;
Table t;
Player p1;

Select entrenamiento,competicion;
Select mediaPista, pistaEntera;

Guardado guardado1;


//datos video
PImage[] img;
int nFotogramas = 10;
int f = 1;
boolean vid = true;

int i=0;
int j=0;
int k=0;

void setup() {

  p = new Pissarra(50, 190, 700,700, 100, width-100);

  //b1 = new Button("a", width/2 - wButton/2, height/2, wButton, hButton, true);
  goToMiEquipo      =  new Button("", 150 + 1*(width- 120)/6, hBanner/5, 150 + 2*(width- 120)/6, hButton, false);
  goToPizarra       =  new Button("", 150 + 2*(width- 120)/6, hBanner/5, 150 + 3*(width- 120)/6, hButton, false);
  goToResultados    =  new Button("", 150 + 3*(width- 120)/6, hBanner/5, 150 + 4*(width- 120)/6, hButton, false);
  goToGuardados     =  new Button("", 150 + 4*(width- 120)/6, hBanner/5, 150 + 5*(width- 120)/6, hButton, false);
  goToSobreNosotros =  new Button("", 150 + 5*(width- 120)/6, hBanner/5, 150 + 6*(width- 120)/6, hButton, false);

  save              =  new Button("S", width - 45,  10, 40 ,40, true );

  entrenamiento     =  new Select("Modo entrenamiento",50, 70 ,  true,   20);
  competicion       =  new Select("Modo competición",  50, 100 , false,  20);
  mediaPista        =  new Select("Media pista",       50, 150 , false,  20);
  pistaEntera       =  new Select("Pista entera",      50, 180 , true,   20);

  guardado1 = new Guardado(img1, "k1", 17, 04,2021, 10, 20, 100, 80);

  subeFotogramas();


  // Creació de la taula
  t = new Table(files, columnes);
  t.setHeaders(headers);
  t.setData(info);
  t.setColumnWidths(colWidths);

  //creació jugador
  p1 = new Player("Pere Joan", "Gomila" , "home", "Libero", "Col", 10, 999999999, 2001, 16, 2, "perej@mail.com");
  
  
  img1 = loadImage("sobreNosotros1.jpg");
  img2 = loadImage("sobreNosotros2.jpg");
  img3 = loadImage("sobreNosotros3.jpg");

  fuente1 = createFont("HKGrotesk-Bold.otf", 40);
  fuente2 = createFont("Coco-Sharp-Extrabold-trial.ttf", 40);

  //size(1200, 780);
  size(1300,900);
  noStroke();
  textAlign(CENTER);
  textSize(18);
}

//
enum pantallas {
  START, MIEQUIPO, PIZARRA, RESULTADOS, GUARDADOS, SOBRENOSOTROS
};


void draw() {

  if(frameCount<150){
  //if(true){
    inicio();
  } else if(frameCount<200){
    fill(226,226, 240, i);
    rect(0,0,width, height);
    i++;
  }else{

    template(j);
    pushMatrix();
    translate(marginW, hBanner+marginH);
    pantallas(j);
    //println(pantalla);
    //mousePointer();
    calibrateBlackboardModes();
    updateCursor();
    if(j<255){
      j+=3;
    }
  }

}


void pantallas (int j){
  //println(pantalla);

    if (pantalla==0) { //entrada
      p0(j);
    }
    if (pantalla==1) { //mi equipo
      p1();
    }
    if (pantalla==2) { //
      p2();
    }
    if (pantalla==3) {
      p3();
    }
    if (pantalla==4) {
      sobreNosotros();
    }
  popMatrix();
}

void keyPressed() {
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
     mouseOverLogo() || save.mouseOverButton()){
      cursor(HAND);
  }
  else {
     cursor(ARROW);
  }

}

void mousePressed(){
  if(goToMiEquipo.mouseOverButton() && mousePressed){
    pantalla =1;
  }
  if(goToPizarra.mouseOverButton()  && mousePressed){
    pantalla = 2;  
  }
  if(goToGuardados.mouseOverButton() && mousePressed){
    pantalla =3;
  }
  if(goToSobreNosotros.mouseOverButton() && mousePressed){
    pantalla = 4;
  }
  if(mouseOverLogo()&& mousePressed){
    pantalla = 0;
  }
  
}

void calibrateBlackboardModes(){
  /*
  if(entrenamiento.getSelected()){
    competicion.setSelected(false);
  }else{
    competicion.setSelected(false);
  }
  
  competicion.setSelected(!entrenamiento.getSelected());

  mediaPista.setSelected(!pistaEntera.getSelected());
  */
  
}

boolean mouseOverLogo(){
  return (mouseX >= marginW+10) && 
          (mouseX<=303) && 
          (mouseY>= 19) && 
          (mouseY<= 50); 
}


void subeFotogramas(){
  img = new PImage [nFotogramas] ;

  for (int i=1; i<img.length; i++) {
    img[i] = loadImage("f"+i+".jpg");
  }
}
