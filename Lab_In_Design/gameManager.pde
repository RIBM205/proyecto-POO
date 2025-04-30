PImage mapaLab,cafetera;

class GameManager{

  void llamar(){
  cam1=loadImage("Camara1.jpg");
cam2=loadImage("Camara2.jpg");
bosque=loadImage("Bosque.jpg"); 
cam0=loadImage("Camara0.jpg");
//Escenarios
recepcion=loadImage("Recepcion.jpg"); //0
mainHall=loadImage("PasilloEntrada.jpg"); //1
pasilloSecundario=loadImage("pasilloSec.jpg"); //2
stairs=loadImage("Escaleras_PB.png");        //3
oficina=loadImage("Oficina.jpg");         //2
twoHall=loadImage("PasilloDerecha.jpg");  //3
cleaning=loadImage("cleaning.jpg");       //4
twoLab=loadImage("escena2.jpg");          //5
stairsS=loadImage("stairsSotano.jpg");    //6.1
stairsR=loadImage("Escaleras_PA.png");      //6.2
restRoom=loadImage("Sala.png");            //7
sotano=loadImage("Sotano.png");           //9
SR=loadImage("DarkRoom.jpg");             //11
conductos=loadImage("conductos.jpg");      //Conductos

laboratorio1=loadImage("Lab1.png");
laboratorio2=loadImage("Lab2.png");
laboratorio3=loadImage("Lab3.png");
laboratorio4=loadImage("Lab4.png");
laboratorio5=loadImage("Lab5.png");
laboratorio6=loadImage("Lab6.png");

//Imagenes para los escondites
eOfi=loadImage("EscOf.jpg");
eLab=loadImage("EscLab.jpg");
eSot=loadImage("EscSot.jpg");

//////////////////
acechador = loadImage("AcechadorP.png");
merodeador = loadImage("Enemigos/Merodeador.png");
slime=loadImage("Enemigos/Slime.png");
//////////////////////Menus/////////////////////////////////////
mapaLab=loadImage("MapaLaboratorio.jpg");
//////////////////////Assets Laboratorio//////////////////////////////////////////
cafetera=loadImage("Assets/Cafetera.png");
  }
  void configuracion(){
  if(ActiveMenu==true)
  MM.MainMenu();
if(pausa==true)
  MM.PausaMenu();

    if(ActiveMenu==false&&pausa==false){
      enPartida=true;
    } else {
      if(ActiveMenu==true||pausa==true){
    enPartida=false;
      }
    }
    
    if(hidden==-1&&V.conductosActivos==0&&camarasCerradas==true&&PL.enPalanca==false&&P.panelAbierto==false){
      normalSetup=true;} 
      else {
      normalSetup=false;}
  } //Fin de la funcion configuracion
  
    void reset(){
    escenario=0;
    camara=1;
    A.posAct=0;
    A.moveTime = 0;
    A.tiempoAvance=0;
    A.finality=0;
    normalSetup=true;
    cerrado=false;
    noches.tiempoNoche=0;
    S.posSlime=0;
    V.conductosActivos=0;
    PL.enPalanca=false;
    P.panelAbierto=false;
    S.espera=0;
    PL.palancaY=250;
    } //Fin de la Funcion Reset


} // Fin de la Clase Game Manager





GameManager GM= new GameManager();
