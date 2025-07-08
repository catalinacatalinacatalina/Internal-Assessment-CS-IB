void guardados(){
    if(entrenamiento.getSelected()){
        logoDrawing(width/2, 60, 50,"últimos entrenos guardados", color(0,0,0,0), c4);
    } else{
        logoDrawing(width/2, 60, 50,"últimas estrategias de partido guardadas", color(0,0,0,0), c4);
    }
    fondo();

    
    guardado1.display();
}

void fondo(){
    if(entrenamiento.getSelected()){
        fill(150);
    } else{
        fill(100);
    }
    
    stroke(0);
    for(int i=0; i<3; i+=1){
        for(int j=0; j<3; j+=1){
            rect( 125 + i*(width/4+20), 100 + j*(20 + height/4), 300, 200, 5);
            //println(i+" "+j);
        }
    }
    
}