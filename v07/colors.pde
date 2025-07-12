color prussianBlue = color(0, 36, 61);
color blackCoral =   color(63, 90, 110);
color ming =         color(88, 123, 127);
color royalBlueDark =color(10, 36, 99);
color redSalsa =     color(251, 54, 64);
color platinum =     color(226, 226, 226);
color celadonBlue =  color(#FB3640);

color c1;
color c2;

//pantalla paleta
void paleta(){
    pushStyle();
        noStroke();

        fill(prussianBlue);
        rect(0,0, width/7, height);
        

        fill(blackCoral);
        rect(width/7, 0, width/7, height);
        

        fill(ming);
        rect(2*width/7,0, width/7, height);


        fill(royalBlueDark);
        rect(3*width/7,0, width/7, height);


        fill(redSalsa);
        rect(4*width/7,0, width/7, height);

        fill(platinum);
        rect(5*width/7,0, width/7, height);


        fill(celadonBlue);
        rect(6*width/7,0, width/7, height);

        textFont(fuente3); stroke(255); textSize(15); textAlign(CENTER); fill(255);
        text("Prussian blue" , width/14, height - 100);
        text("Black coral" ,   3*width/14, height - 100);
        text("Ming" ,          5*width/14, height - 100);
        text("Royal Blue Dark",7*width/14, height - 100);
        text("Red Salsa" ,     9*width/14, height - 100);
        text("Platinum" ,      11*width/14, height - 100);
        text("Celadon blue" , 13*width/14, height - 100);
    popStyle();

}