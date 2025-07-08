//animación pantalla de carga
void inicio(){
    background(blackCoral);
    pushMatrix();
        pushStyle();
        rotate(PI/5);
            textAlign(LEFT);
            fill(royalBlueDark);
            for(int i=-1000; i< 2000; i+=100){
                textFont(fuente3);
                logoDrawing(width/2-420, i-500+k, 100, "KEEP THE BALL FLYING", redSalsa, royalBlueDark);
                textFont(fuente2);
                logoDrawing(width-40, i+350-k, 100, "   KEEP THE BALL FLYING", redSalsa, royalBlueDark);
            }

            k+=5;
        popStyle();
    popMatrix();
}