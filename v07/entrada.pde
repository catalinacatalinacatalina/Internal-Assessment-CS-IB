void p0(int j){
    //video();
    pushStyle();
    textAlign(CENTER);
    textFont(fuente3);
    
    for(int i=0; i<2*width; i+=10){
        if(i%3==0){
            stroke(redSalsa,j);
        }else if(i%3==1){
            stroke(royalBlueDark,j);
        }else{
            stroke(ming,j);
        }
        line(i, 0, 0,i);
    }
    
    fill(royalBlueDark, j);
    text("keep the ball", width/2, 250);
    logoDrawing(width/2, height/2+50, 400, "FLYING", c3, c4); 

    popStyle();

    stroke(2);
    fill(0);

}

