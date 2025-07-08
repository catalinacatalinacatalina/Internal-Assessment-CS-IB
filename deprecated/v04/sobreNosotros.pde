float ancho= 500;
float alto = ancho*0.62;
float margenVertical = 110;

void sobreNosotros(){
    pushStyle();
        fill(0);
        
        pushStyle();

            textAlign(LEFT);
               
            textFont(fuente2, 60);
            fill(255); 
            text("¿Quién soy?", 10, 68);
            fill(royalBlueDark);
            //fill(blackCoral); 
            text("¿Quién soy?", 12, 70);

        popStyle();
        
        textAlign(LEFT);
        textSize(20);
        
    popStyle();

}