//pantalla tabla
void p1(){

  pushStyle();
    //dibujar el objeto tabla
    t.display((width-tableW)/2, 100, tableW, tableH);
    
    //dibujar los botones correspondientes
    b1.display();
    b2.display();
    
    // Actualizar forma del cursor
    updateCursor();
    
    //Dibujar el nuevo jugador como objeto
    newPlayer.display();

  popStyle();
}

//pantalla para introducir un nuevo jugador
void newPlayer(){
  textAlign(LEFT);
  pushStyle();
    image(usuario, 130, 70, 50, 50);
    logoDrawing(450, 102.0, 70, "Nuevo jugador", redSalsa, royalBlueDark);
  popStyle();

  textSize(15); fill(0);

  pushStyle();
    textFont(fuente1);
    fill(blackCoral);
    textSize(30);

    text("Nombre:", 300, 200);
    text("Fecha de nacimiento:", 300, 300);
    text("Número dorsal: ", 300, 400);
    text("Primera posición: ", 300, 500);
    text("Segunda posición: ",  900, 500);
    

    s1.display();
    s2.display();
    nombre.display();
    dayn.display();
    monthn.display();
    yearn.display();
    ndorsal.display();
    guardarJugador.display();

  popStyle();

}