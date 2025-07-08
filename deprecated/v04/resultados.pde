void resultados(){
    //r1.display();
    //r2.display();
    //r3.display();
    e.display();
    
    prev.display();
    next.display();
    
}

void nuevoJugador(boolean display){
    if(display){
        campo("Nombre: ", 200, 300);
    }
}

void campo(String txt, float x, float y){
    pushStyle();
        fill(255); textAlign(CORNER);
        textSize(18);
        text(txt, x, y);
        fill(255); rectMode(CENTER);
        rect( x+ 80, y, 50.0, 7.0);
    popStyle();
}