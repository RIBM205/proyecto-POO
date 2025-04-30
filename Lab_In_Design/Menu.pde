boolean ActiveMenu=true;
boolean pausa=false;

class Menus{
  int playX=width*3+50,playY=height*3;
  int exitX=width*3+50,exitY=height*5;
  
  int resX=width*3+50,resY=height*2;
  int mainX=width*3+50,mainY=height*5;
  int mapaX=width*3+50,mapaY=height*3+50;
  
   int creX=width*9,creY=height*6;
  int volverX=width,volverY=height;
  

  
  
  void MainMenu(){
  fill(255);
  textSize(100);
  text("LAB IN DESIGN",290,100);
  
 
  fill(255);
  rect(playX,playY,500,100);
  fill(0);
  text("Jugar",470,375);
  
    fill(255);
 rect(exitX,exitY,500,100);
  fill(0);
  text("SALIR",470,590);
  
  
  }
  
  void PausaMenu(){
   fill(255);
   
  fill(255);
  rect(resX,resY,500,100);
  fill(0);
   textSize(75);
  text("Reanudar",450,275);
  
    fill(255);
  rect(mapaX,mapaY,500,100);
  fill(0);
   textSize(75);
  text("Mapa",450,425);

  
    fill(255);
 rect(mainX,mainY,500,100);
  fill(0);
  textSize(75);
  text("Menu Principal",370,580);
  }
}

Menus MM= new Menus();


void mapa(){



}
