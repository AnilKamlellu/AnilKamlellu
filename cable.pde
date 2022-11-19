  boolean windowDisplay=true;
  boolean windowLivingFoodz; 
  boolean windowStarPlus;
  boolean windowZeeTV;
  boolean windowSony;
  boolean windowColors;
  boolean windowSonySab;
  boolean windowAndTv;
  boolean windowStarBharat;
  int mlf, msp, mztv, msy;
  int mcl, msb, mav, mst;
  int today, time, now;
  int [] m= new int [12];
  float mx=0, mp, mr;
  String twig, week, grid;
  String [] mday=new String [7];
  String [] mmonth=new String [12];
  String [] play=new String [8];
  PImage reena, StarPlus, ZeeTV, Colors;
  PImage Sony, SonySab, LivingFoodz; 
  PImage AndTv, StarBharat;
  PImage add, delete;

  void setup() {
  fullScreen(P2D);
  frameRate(24);
  orientation(PORTRAIT);
  textSize (25);
  fill (0);
  reena= loadImage("Reena.jpg");
  LivingFoodz= loadImage ("LivingFoodz.jpg");
  StarPlus= loadImage("StarPlus.jpg");
  ZeeTV= loadImage ("ZeeTV.jpg");
  Sony= loadImage ("Sony.jpg");
  Colors= loadImage ("Colors.jpg");
  SonySab= loadImage ("SonySab.jpg");
  AndTv= loadImage ("&TV.jpg");
  StarBharat= loadImage ("StarBharat.jpg");
  add=loadImage ("Add.jpg");
  delete=loadImage ("Delete.jpg");
  // for year 2021
  m[0]=4; m[4]=5; m[8]=2;
  m[1]=0; m[5]=1; m[9]=4;
  m[2]=0; m[6]=3; m[10]=0;
  m[3]=4; m[7]=6; m[11]=2;
  today=(day()+m[month()-1])%7;
  mday [0]="Sunday"; mday [1]="Monday"; mday [2]="Tuesday"; mday [3]="Wednesday";
  mday [4]="Thursday"; mday [5]="Friday"; mday [6]="Saturday";
  mmonth[0]="Jan"; mmonth[1]="Feb"; mmonth[2]="Mar";
  mmonth[3]="Apr"; mmonth[4]="May"; mmonth[5]="Jun";
  mmonth[6]="Jul"; mmonth[7]="Aug"; mmonth[8]="Sep";
  mmonth[9]="Oct"; mmonth[10]="Nov"; mmonth[11]="Dec";
  twig= "MY FAVORITE : "+ str (day ())+" "+mmonth[month()-1]+" "+year();
  week=mday [today];
  for (int j=0; j <8; j++) play[j]="";
  if(hour()> 12) grid= (nf ((hour()-12),2)+":"+nf(minute(),2));
  else grid= (nf(hour(),2)+":"+nf(minute(),2));
  time= hour()*60 + minute();
  for (int j=0; j<serial.length/5; j++) {
  getnow(serial[j*5]);
  int start= now;
  getnow(serial[j*5+1]);
  int end= now;
  if (time>=start && time <end && serial[j*5+3].equals("mf") && today>0 && today<6) 
  play[int(serial[j*5+4])]= serial[j*5+2]+"\n"+serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4) ;
  if (time>=start && time <end && serial[j*5+3].equals("ss") && (today==0 || today==6))
  play[int(serial[j*5+4])]= serial[j*5+2]+"\n"+serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4) ;
  }//end for
  }//end setup
  
  void draw() {
  background (#AEC1FF);
  if (windowDisplay) {
  translate (0, mx);
  if (second()==0) {
  if(hour()> 12) grid= (nf ((hour()-12),2)+":"+nf(minute(),2));
  else grid= (nf(hour(),2)+":"+nf(minute(),2));
  time= hour()*60 + minute();
  for (int j=0; j <8; j++) play[j]="";
  for (int j=0; j<serial.length/5; j++) {
  getnow(serial[j*5]);
  int start= now;
  getnow(serial[j*5+1]);
  int end= now;
  if (time>=start && time <end && serial[j*5+3].equals("mf") && today>0 && today<6) 
  play[int(serial[j*5+4])]= serial[j*5+2]+"\n"+serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4) ;
  if (time>=start && time <end && serial[j*5+3].equals("ss") && (today==0 || today==6))
  play[int(serial[j*5+4])]= serial[j*5+2]+"\n"+serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4) ;
  }//end for
  }//end second
  image (reena,10,10);
  image (LivingFoodz, 10, 120);
  image (StarPlus,10, 230);
  image (ZeeTV,10, 340);
  image (Sony, 10, 450);
  image (Colors, 10, 560);
  image (SonySab, 10, 670);
  image (AndTv, 10, 780);
  image (StarBharat, 10, 890);
  text ("Channel :- 354",120, 213);
  text ("Channel :- 104",120, 323);
  text ("Channel :- 107",120, 433);
  text ("Channel :- 106",120, 543);
  text ("Channel :- 105",120, 653);
  text ("Channel :- 109",120, 763);
  text ("Channel :- 108",120, 873);
  text ("Channel :- 111",120, 983);
  text (twig+"\n"+week+" "+grid, 120, 40);
  for (int j=0; j <8; j++){
  text (play[j],120, 150+j*110);
  image (add, 320,160+110*j);
  image (delete, 400,160+110*j);
  }//end for
  }//end windowDisplay
  if (windowLivingFoodz) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("0")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("0")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (LivingFoodz,10,10,460,200);
  fill (0);
  text ("Living Foodz : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) mlf= 530-40*c;
  }//end windowLivingFoodz
  if (windowStarPlus) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("1")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("1")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (StarPlus,10,10,460,200);
  fill (0);
  text ("Star Plus : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) msp= 530-40*c;
  }//end windowStarPlus
  if (windowZeeTV) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("2")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("2")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (ZeeTV,10,10,460,200);
  fill (0);
  text ("Zee TV : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) mztv= 530-40*c;
  }//end windowZeeTV
  if (windowSony) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("3")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("3")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (Sony,10,10,460,200);
  fill (0);
  text ("Sony : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) msy= 530-40*c;
  }//end windowSony
  if (windowColors) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("4")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("4")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (Colors,10,10,460,200);
  fill (0);
  text ("Colors : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) mcl= 530-40*c;
  }//end windowColors
  if (windowSonySab) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("5")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("5")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (SonySab,10,10,460,200);
  fill (0);
  text ("SonySab : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) msb= 530-40*c;
  }//end windowSonySab
  if (windowAndTv) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("6")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("6")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (AndTv,10,10,460,200);
  fill (0);
  text ("& TV : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) mav= 530-40*c;
  }//end windowAndTv
  if (windowStarBharat) {
  pushMatrix ();
  translate (0, mx);
  int c=0;
  for (int j=0; j<serial.length/5; j++) {
  if (today>0&&today<6&&serial[j*5+3].equals("mf")&&serial[j*5+4].equals("7")){
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  if ((today==6||today==0)&&serial[j*5+3].equals("ss")&&serial[j*5+4].equals("7")) {
  text(serial[j*5].substring(0,2)+":"+serial[j*5].substring(2,4)+" to "+serial[j*5+1].substring(0,2)+":"+serial[j*5+1].substring(2,4)+" "+serial[j*5+2], 20, c*40+290);
  c++;
  }
  }
  popMatrix ();
  fill (#AEC1FF);
  noStroke ();
  rect (0,0,480,260);
  image (StarBharat,10,10,460,200);
  fill (0);
  text ("Star Bharat : "+week+" "+str (day ())+" "+mmonth[month()-1]+" "+year(), 20, 250);
  if(c>13) mst= 530-40*c;
  }//end windowStarBharat
  }//end draw
  
  void mouseDragged() {
  mx += mouseY- pmouseY ;
  if (abs(mp-mr)>=10) {
  if(windowDisplay) mx =constrain (mx,-200,0);
  if(windowLivingFoodz) mx =constrain (mx,mlf,0);
  if(windowStarPlus) mx =constrain (mx,msp,0);
  if(windowZeeTV) mx =constrain (mx,mztv,0);
  if(windowSony) mx =constrain (mx,msy,0);
  if(windowColors) mx =constrain (mx,mcl,0);
  if(windowSonySab) mx =constrain (mx,msb,0);
  if(windowAndTv) mx =constrain (mx,mav,0);
  if(windowStarBharat) mx =constrain (mx,mst,0);
  }//end abs
  }//end mouseDragged
  
  void getnow(String s) {
  if(s.substring(4,5).equals("$"))
  now=(int(s.substring(0,1))*10+int(s.substring(1,2))+12)*60+(int(s.substring(2,3))*10+int(s.substring(3,4)));
  else
  now=(int(s.substring(0,1))*10+int(s.substring(1,2)))*60+(int(s.substring(2,3))*10+int(s.substring(3,4)));
  }
  
  void mousePressed() {
  mp=mouseY; 
  }
  
  void mouseReleased (){
  mr=mouseY; 
  if (abs(mp-mr)<10) {
  if (windowDisplay) {
  if(mouseY-mx>120&&mouseY-mx<230) {
  windowLivingFoodz=true;
  windowDisplay=false;
  return; 
  }//end LivingFoodz
  if(mouseY-mx>230&&mouseY-mx<340) {
  windowStarPlus=true;
  windowDisplay=false;
  return; 
  }//end StarPlus
  if(mouseY-mx>340&&mouseY-mx<450) {
  windowZeeTV=true;
  windowDisplay=false;
  return; 
  }//end ZeeTV
  if(mouseY-mx>450&&mouseY-mx<560) {
  windowSony=true;
  windowDisplay=false;
  return; 
  }//end Sony
  if(mouseY-mx>560&&mouseY-mx<670) {
  windowColors=true;
  windowDisplay=false;
  return; 
  }//end Colors
  if(mouseY-mx>670&&mouseY-mx<780) {
  windowSonySab=true;
  windowDisplay=false;
  return; 
  }//end SonySab
  if(mouseY-mx>780&&mouseY-mx<890) {
  windowAndTv=true;
  windowDisplay=false;
  return; 
  }//end AndTv
  if(mouseY-mx>890&&mouseY-mx<9100) {
  windowStarBharat=true;
  windowDisplay=false;
  return; 
  }//end StarBharat
  }else {
  windowStarBharat=false; 
  windowAndTv=false;
  windowSonySab=false; 
  windowColors=false; 
  windowSony=false;
  windowZeeTV=false;
  windowLivingFoodz=false;
  windowStarPlus=false;
  windowDisplay=true;
  }
  mx=0;
  }
  }//end mousePresse
  