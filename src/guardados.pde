void guardados(){
    fondo();

    guardado1.setXY(30,155- hBanner);
    guardado1.display();
}

void fondo(){
    if(entrenamiento.getSelected()){
        fill(120);
    } else{
        fill(100);
    }
    
    stroke(0);
    for(int i=0; i<4; i+=1){
        for(int j=0; j<3; j+=1){
            rect( 30 + i*(width/4), 75 + j*(20 + height/4), 350, 250, 5);
            //println(i+" "+j);
        }
    }
    
}