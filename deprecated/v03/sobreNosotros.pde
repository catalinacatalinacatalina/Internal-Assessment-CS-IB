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
        text(" Mi nombre es Catalina Fullana, he desarrollado este programa y actualmente estoy \n cursando segundo de Bachillerato Internacional en el IES Manacor. \n Mi corazón siempre ha estado dividido en dos pasiones completamente diferentes,\n el voleibol y la informática;  es por ello que he decidido llevar a cabo esta aplicación,\n para mostrar que es posible poder combinar ambas areas. \n \n A parte de esto, también han aparecido varios factores que me han \n llevado hacia el desarrollo de este programa: el primero, el exceso de \n uso de papel en los numerosos partidos que presencié, así como la \n pérdida de estos; el segundo, el problema de los entrenadores, ya que \n a veces, si el entrenador propio de un equipo no puede asistir a un \n partido u entrenamiento y el substituto no conoce al equipo, pierde \n mucho tiempo para informarse de quien ocupa cada posición y que \n estrategias está acostumbrado a jugar el equipo que deberá presentar a \n competicion u entrenar.", 20, margenVertical+ 20);

        image(img1, width-ancho- 30 , margenVertical, ancho,alto);
        image(img2, width- ancho/2 -30, margenVertical + alto,ancho/2, ancho/2*0.62);
        image(img3, width- ancho -30, margenVertical + alto,ancho/2, ancho/2*0.62);
        
    popStyle();

}