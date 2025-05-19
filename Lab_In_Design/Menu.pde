boolean ActiveMenu=true;
boolean pausa=false;
boolean enMapa;
boolean enCreditos;

class Menus{
  int playX=width*3+50,playY=height*2;
  int exitX=width*3+50,exitY=height*5;
  int creX,creY;
  
  int resX=width*3+50,resY=height*2;
  int mainX=width*3+50,mainY=height*5;
  int mapaX=width*3+50,mapaY=height*3+50;
  
   
  int volverX=0,volverY=0;
   int volverCX,volverCY;
  

  Menus(){
  creX=width*3+50;
  creY=height*3+50;
  volverCX=width*4;
  volverCY=height*7;
  }
  
  void MainMenu(){
 image(menuP,0,0,width,height);
 
  fill(255);
  textSize(100);
  text("LAB IN DESIGN",290,100);
  
 
  fill(255);
  rect(playX,playY,500,100);
  fill(0);
  text("Jugar",470,275);
  
    fill(255);
  rect(creX,creY,500,100);
  fill(0);
  text("Creditos",470,425);
  
    fill(255);
 rect(exitX,exitY,500,100);
  fill(0);
  text("SALIR",470,590);
  

  }
  
  void PausaMenu(){
  
   
  if(!enMapa){
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
 
 void creditos(){
   if(enCreditos){
   image(creditos,0,0,width,height);
       fill(255);
   rect(volverCX,volverCY,500,100);
    fill(0);
    textSize(75);
    text("Volver",width/12+20,height/8-30);
   }
 
 }
 
  void mapa(){
  if(enMapa){
  image(mapaLab,0,0,width,height);
  
    fill(255);
 rect(volverX,volverY,500,100);
  fill(0);
  textSize(75);
  text("Volver",width/12+20,height/8-30);
  
   noStroke();
   fill(50);
    switch(escenario){
    
    case 0: {circle(width/5.41,height/1.23,25);}
    break;
    
    case 1: {circle(width/12+77,height/2+27,25);}
    break;
    
    case 2: {circle(width/4+53,height/2+23,25);}
    break;
    
    case 3: {circle(width/4+9,height/4+20,25);}
    break;
    
    case 4: {circle(width/2+173,height/8+58,25);}
    break;
    
    case 5: {circle(width-52,height/8+58,25);}
    break;
    
    case 6: {circle(width/2+80,height/4+101,25);}
    break;
    
    case 7: {circle(width/2-34,height/2+63,25);}
    break;
    
    case 8: {circle(width/2+80,height/2+119,25);}
    break;
    
    case 9: {circle(width-181,height/4+88,25);}
    break;
    
    case 10: {circle(width/6+72,height/4+120,25);}
    break;
    
    case 11: {circle(width/4+58,height/4+120,25);}
    break;
    
    case 12: {circle(width/3+49,height/4+120,25);}
    break;
    
    case 13: {circle(width/3+49,height/2+140,25);}
    break;
    
    case 14: {circle(width/4+58,height/2+140,25);}
    break;
    
    case 15: {circle(width/6+72,height/2+140,25);}
    break;
  

  }//Fin del Switch

  }
  }
}

Menus MM= new Menus();
