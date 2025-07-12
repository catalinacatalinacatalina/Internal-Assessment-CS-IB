
  void setup() {
    connectBBDD();
    String [][] infoJugadores = getInfoTablaJugadores();
    String [][] infoEquipo    = getInfoTablaEquipo();
    infoPartido   = getInfoTablaPartido();
    infoPosicion = getInfoPosicion();
    
    // creacion de objetos
    p = new Pines((float)50, (float)280, (float)700,(float)700, (float)100, (float)width-100);

    img0 = loadImage("pizarra.jpg");
    img1 = loadImage("sobreNosotros1.jpg");
    img2 = loadImage("sobreNosotros2.jpg");
    img3 = loadImage("sobreNosotros3.jpg");
    usuario = loadImage("userIcon.png");

    s1 = new Select2(infoPosicion, 550, 475, (float)selectW, (float)selectH);
    s2 = new Select2(infoPosicion, 1200, 475, (float)selectW, (float)selectH);

    //botones
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

    guardarJugador =  new Button("GUARDAR", width- 150 - 25, height - 55, 150, 50, true);
    reset          =  new Button("Reset", 50, height - hButton - 20,wButton, hButton, true);
    entrenamiento  =  new Select("Modo entrenamiento",50, 70 ,  true,   20);
    competicion    =  new Select("Modo competición",  50, 100 , false,  20);
    mediaPista     =  new Select("Media pista",       50, 150 , false,  20);
    pistaEntera    =  new Select("Pista entera",      50, 180 , true,   20);

    guardado1      =  new Guardado(img0, "k1", 17, 04, 2021);

    // Creació de la taula -- no funciona
    t = new Table(files, columnes);
    t.setHeaders(headers);
    t.setData(infoJugadores);
    t.setColumnWidths(colWidths);

    //creació jugadors
    p1   = new Player("Pere Joan", "Libero", "Col", 10, 2001, 16, 2);
    p2   = new Player("Pere Joan", "Central", "Punta", 10, 2001, 16, 2);
    p3   = new Player("Pere Joan", "Opuesto", "Central", 10, 2001, 16, 2);

    cono = loadImage("cono.png");

    fuente1 = createFont("HKGrotesk-Bold.otf", 40);
    fuente2 = createFont("Coco-Sharp-Extrabold-trial.ttf", 40);
    fuente3 = createFont("Coco-Sharp-Heavy-Italic-trial.ttf", 40);
    fuente4 = createFont("Keiner-SemiBold.ttf", 25);

    nSaved = new TextField(550, 400, 200, 35);
    dSaved = new TextField(800, 450, 50, 35);
    mSaved = new TextField(870, 450, 50, 35);
    ySaved = new TextField(940, 450, 50, 35);

    nombre    = new TextField(450, 175, 700, alturaCelda-10);
    dayn      = new TextField(520 + 120-50, 350 - (int)hBanner, 3/2*alturaCelda, alturaCelda);
    monthn    = new TextField(520 + 120   , 350 - (int)hBanner, 3/2*alturaCelda, alturaCelda);
    yearn     = new TextField(520 + 170   , 350 - (int)hBanner, 3/2*alturaCelda, alturaCelda);
    ndorsal   = new TextField(520, 451 - (int)hBanner, alturaCelda, alturaCelda);

    r1 = new Resultado((width+ 20)/6, height/2 - 50, 0);
    r2 = new Resultado(3*(width+20)/6,height/2 - 50 , 1);
    r3 = new Resultado(5*(width+20)/6, height/2 - 50, 2);
    r4 = new Resultado((width+20)/6, height/2 - 50, 3);
    r5 = new Resultado(3*(width+20)/6,height/2 - 50 , 4);
    

    //array de resultados para el posterior recorrimiento
    Resultado [] arrResultados = {r1, r2, r3, r4, r5};

    cono1 = new Cone (width-45, height - hBanner - 70);

    e = new ListaPaginada(arrResultados,10, 10, width- 100, height*9/10);

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

      mousePointer();
      updateCursor();

      if(j<255){
        j+=25;
      }
    }
  }

  void pantallas (int j){
    //println(pantalla);
    if (pantalla==-1) { //paleta
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
    nSaved.keyPressed(key, (int)keyCode);
    dSaved.keyPressed(key, (int)keyCode);
    mSaved.keyPressed(key, (int)keyCode);
    ySaved.keyPressed(key, (int)keyCode);
    nombre.keyPressed(key, (int)keyCode);
    dayn.keyPressed(key, (int)keyCode);
    yearn.keyPressed(key, (int)keyCode);
    monthn.keyPressed(key, (int)keyCode);
    ndorsal.keyPressed(key, (int)keyCode);

  }

  void mousePointer(){
    /*
    if(mousePressed){  
      println("mouse X: "+ mouseX);
      println("mouse Y: "+ mouseY);
    }
    */
  }

  void updateCursor(){
    if((goToMiEquipo.mouseOverButton() && goToMiEquipo.enabled)||
      (goToGuardados.mouseOverButton() && goToGuardados.enabled)||
      (goToPizarra.mouseOverButton() && goToPizarra.enabled) ||
      mouseOverObject(0,0,0,0) || save.mouseOverButton() || 
      (b1.mouseOverButton() && b1.enabled)||
      (b2.mouseOverButton() && b2.enabled)|| 
      mouseOverObject(width-45, height - 70, 35, 45) ||
      (s1.mouseOverSelect2() && s1.enabled)||
      (s2.mouseOverSelect2() && s2.enabled) ||
      nombre.mouseOverTextField() ||
      nSaved.mouseOverTextField() ||
      dSaved.mouseOverTextField() ||
      mSaved.mouseOverTextField() ||
      ySaved.mouseOverTextField() ||
      nombre.mouseOverTextField() ||
      dayn.mouseOverTextField() ||
      yearn.mouseOverTextField() ||
      monthn.mouseOverTextField() ||
      ndorsal.mouseOverTextField()
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
    nombre.isPressed();
    dayn.isPressed();
    monthn.isPressed();
    yearn.isPressed();
    ndorsal.isPressed();
    nSaved.isPressed();
    ySaved.isPressed();
    dSaved.isPressed();

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
    nombre.isPressed();

    if(s1.mouseOverSelect2() && s1.enabled){
    if(!s1.collapsed){
      s1.update();      // Actualitzar valor
    }
    s1.toggle();        // Plegar o desplegar
    }

    if(s2.mouseOverSelect2() && s2.enabled){
    if(!s2.collapsed){
      s2.update();      // Actualitzar valor
    }
    s2.toggle();        // Plegar o desplegar
    }

    if(mousePressed && guardarJugador.mouseOverButton()){

    if(s1.selectedValue=="Colocador"){
      s = "1";
    }
      insertaJugador(nombre.text, ndorsal.text, s);
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

// Modificar el número segons Select 2
  void updateNumber(){
    n = Integer.parseInt(s1.selectedValue);
  }


void insertaJugador(String n, String d, String s){
  
  try {
        String q = " INSERT INTO `jugador` (`id`, `nombre`, `dorsal`, `equipo`, `posicion_id`) VALUES (NULL, '"+n+"', '"+d+"', 1, '"+s+"')";
        println("INSERT: "+q);
        query.execute(q);
        println("INSERT OK :)");
    }
    catch(Exception e) {
        System.out.println(e);
    }

}

