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
    logoDrawing(width/2, height/2+50, 300, "FLYING", c3, c4); 

    popStyle();

    stroke(2);
    fill(0);

/*
    beginShape();
        vertex((width-40)/2, 500);
        vertex((width-40)/2, 600);
        vertex((width+40)/2, 550);
    endShape();
*/

}

void video(){
    
    image(img[f], 0, 0, width, height);
    fill(0,0,0,150);
    rect(0,0, width, height);

    if (frameCount%2==0&& vid) {
        f++;
    }
    if (f==nFotogramas-1) {
        vid = false;
    }

}

