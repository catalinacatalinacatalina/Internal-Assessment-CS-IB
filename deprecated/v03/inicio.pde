void inicio(){
    background(blackCoral);
    pushMatrix();
        pushStyle();
        rotate(PI/5);
            textAlign(LEFT);
            textFont(fuente2);
            fill(royalBlueDark);
            //text("keep the ball", width/2, height/2-150);
            for(int i=-1000; i< 2000; i+=100){
                logoDrawing(width/2-450, i-500+k, 100, "KEEP THE BALL FLYING", redSalsa, royalBlueDark);
                logoDrawing(width+100, i+350-k, 100, "   KEEP THE BALL FLYING", redSalsa, royalBlueDark);
            }

            k+=5;
        popStyle();
    popMatrix();
}