import processing.pdf.*;




int [] pitches = new int[9];
int[] durations = new int[7];
int count = 0;
int duration;
int pitch;
int time = 0;
int d, p, transposition;
String keySignature;

void setup() {
  strokeCap(ROUND);
  ellipseMode(CENTER);
  frameRate(8);
  size(640, 120);
  noLoop();  
  beginRecord(PDF, "1.8.pdf");
  background(220);
  staff(); 
  dynamics();
  // **********************************************
  keySignature = "G";
  
  
if(keySignature == "Em"){
    transposition = 0;
  }
  if(keySignature == "C"){
    transposition = 10;
  }
  if(keySignature == "D"){
    transposition = 5;
  }
  if(keySignature == "Dm"){
    transposition = 5;
  }
  if(keySignature == "G"){
    transposition = -10;
  }


// default Do = E
  pitches[0] = 55; //rest
  pitches[1] = 80 + transposition; // Do
  pitches[2] = 75 + transposition; // Re
  pitches[3] = 70 + transposition; // Mi
  pitches[4] = 65 + transposition; // Fa
  pitches[5] = 60 + transposition; // So
  pitches[6] = 55 + transposition; // La
  pitches[7] = 50 + transposition; // Ti
  pitches[8] = 45 + transposition; // Do'

  durations[0] = 160;
  durations[1] = 120;
  durations[2] = 80;
  durations[3] = 60;
  durations[4] = 40;
  durations[5] = 20;
  durations[6] = 0;
}


void draw() {
background(220);
  staff(); 
  trebbleCleff();
  
  if(keySignature == "Em"){
    Em();
  }
   if(keySignature == "G"){
    G();
  }
   if(keySignature == "D"){
    D();
  }
   if(keySignature == "Dm"){
    Dm();
  }
  
  
  dynamics();
  fill(0);
  stroke(255);

                                                                                                                                                                                                               



  firstNote();
  write();
  println(pitches[pitch]);
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  time = 0;
  translate(160, 0);

  firstNote();
  //write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  time = 0;
  translate(160, 0);

  firstNote();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  time = 0;
  translate(160, 0);

  firstNote();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  durationTime();
  pitchPitch();
  write();
  time = 0;
  translate(160, 0);




  endRecord();

  /*
  // duration/pitch
   // set durration in relationship to pitch
   if (pitch == 2 || pitch ==7){
   duration =5;
   }
   else if (pitch == 4 || pitch == 6){
   duration = round(random(4,5));
   }
   else if (pitch == 3){
   duration = round(random(2,5);
   }
   else if(pitch ==5){
   duration = round(random(1,5));
   }
   else{ duration = round(random(5));
   }
   */


  // pitch/durration
  // sets pitch in relation to a given duration
}



void write() {
  //draw the note
  //if (pitch == 0) {
  //  fill(0, 50);
  //} else {
  //  fill(0);
  //}
  //rect(time, pitches[pitch], durations[duration], 50);
  if (duration == 0) {
    if (pitch == 0) {
      wholeRest();
    } else
      whole();
  } else if (duration == 1) {
    if (pitch == 0) {
      dottedHalfRest();
    } else
      dottedHalf();
  } else if (duration == 2) {
    if (pitch == 0) {
      halfRest();
    } else
      half();
  } else if (duration == 3) {
    dottedQuarter();
  } else if (duration == 4) {
    quarter();
  } else if (duration == 5) {
    eighth();
  }



  time = time + durations[duration];

}


void firstNote() {
  // set pitch 1
  p = round(random(-0.5, 3.5));
  println(p);
  if (p == 0) {
    pitch = 0;
  }
  if (p == 1) {
    pitch = 1;
  }
  if (p == 2) {
    pitch = 5;
  }
  if (p == 3) {
    pitch = 8;
  }

  // set duration 1
  d = round(random(-0.5, 2.5));
  if (d == 0) {
    duration = 0;
  }
  if (d == 1) {
    duration = 1;
  }
  if (d == 2) {
    duration = 2;
  }
}

void durationTime() {
  // duration/time
  //Set duration in relationship to time
  if (time == 0) {
    duration = round(random(5));
  }
  if (time == 20 || time == 20) {
    duration = round(random(1, 5));
  }
  if (time == 60 || time == 80) {
    duration = round(random(2, 5));
  }
  if (time == 100) {
    duration = round(random(3, 5));
  }
  if (time == 120) {
    duration = round(random(4, 5));
  }
  if (time == 140) {
    duration = 5;
  }
  if (time == 160) {
    duration = 6;
  }
}


void pitchPitch() {
  // pitch/previous pitch
  //set a new pitch reletive to last pitch
  if (pitch == 0) {
    p = round(random(8));
    pitch = pitch + p;
  }

  if (pitch == 8) {
    p = round(random(-8, 0));
    pitch = pitch + p;
  }

  if (pitch > 0 && pitch < 8) {
    p = round(random(-1.4, 1.4));
    pitch = pitch + p;
  }


  if (pitch > 1 && pitch < 7) {
    p = round(random(-2.4, 2.4));
    pitch = pitch + p;
  }


  if (pitch > 2 && pitch < 6) {
    p = round(random(-3.4, 3.4));
    pitch = pitch + p;
  }


  if (pitch > 3 && pitch < 5) {
    p = round(random(-4.4, 4.4));
    pitch = pitch + p;
  }
}


void whole() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
}

void wholeRest() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  fill(0);
  rect(time + durations[duration] / 2 - 5, pitches[pitch] - 5, 10, 5);
}

void dottedHalfRest() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);

  fill(0);
  rect(time + durations[duration] / 2 - 5, pitches[pitch], 10, 5);
  ellipse(time + durations[duration] / 2 + 8, pitches[pitch] + 3, 2, 2);
}

void dottedHalf() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
  line(time + durations[duration] / 2 + 5, pitches[pitch], time + durations[duration] / 2 + 5, pitches[pitch] - 20);
  fill(0);
  ellipse(time + durations[duration] / 2 + 8, pitches[pitch] + 3, 2, 2);
}

void half() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
  line(time + durations[duration] / 2 + 5, pitches[pitch], time + durations[duration] / 2 + 5, pitches[pitch] - 20);
}

void halfRest() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  fill(0);
  rect(time + durations[duration] / 2 - 5, pitches[pitch], 10, 5);

}



void dottedQuarter() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
  line(time + durations[duration] / 2 + 5, pitches[pitch], time + durations[duration] / 2 + 5, pitches[pitch] - 20);
  ellipse(time + durations[duration] / 2 + 8, pitches[pitch] + 3, 2, 2);
}

void quarter() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
  line(time + durations[duration] / 2 + 5, pitches[pitch], time + durations[duration] / 2 + 5, pitches[pitch] - 20);
}

void eighth() {
  noFill();
  noStroke();
  rect(time, pitches[pitch], durations[duration], 10);
  stroke(0);
  strokeWeight(2);
  fill(0);
  ellipse(time + durations[duration] / 2, pitches[pitch], 10, 10);
  line(time + durations[duration] / 2 + 5, pitches[pitch], time + durations[duration] / 2 + 5, pitches[pitch] - 20);
  strokeWeight(1);
  line(time + durations[duration] / 2 + 5, pitches[pitch] - 20, time + durations[duration] / 2 + 5 + 4, pitches[pitch] - 20 + 6);
}

void staff() {
  float h = 10;
  fill(255);
  strokeWeight(1);
  rect(0, 40, width, 40);
  stroke(0);
  line(160, 40, 160, 80);
  line(320, 40, 320, 80);
  line(480, 40, 480, 80);
  line(640, 40, 640, 80);
  while ( h < height -30) {
    if(h>30){line(0, h, width, h);
    }
    h = h + 10;
  }
}

void dynamics(){
  float d = floor(random(6));
  if(d == 1){
    //crescendo
    line(60,height-15, width -60, height-25);
    line(60,height-15, width -60, height-5);
    fill(0);
    text("p",30,height-10);
    text("f",width -30,height-10);
  }
  if(d == 2){
    //decrescendo
    line(60,height-25, width -60, height-15);
    line(60,height-5, width -60, height-15);
    fill(0);
    text("f",30,height-10);
    text("p",width -30,height-10);
  }
  
   if(d == 3){
    //crescendo - decrescendo
    line(60,height-15, width/2 -30, height-25);
    line(60,height-15, width/2 -30, height-5);
    line(width - 60,height-15, width/2 +30, height-25);
    line(width - 60,height-15, width/2 +30, height-5);
    fill(0);
    text("p",30,height-10);
    text("f",width/2,height-10);
    text("p",width -30,height-10);
  }
  
  if(d == 4){
    //decrescendo - crescendo
    line(60,height-25, width/2 -30, height-15);
    line(60,height-5, width/2 -30, height-15);
    line(width - 60,height-25, width/2 +30, height-15);
    line(width - 60,height-5, width/2 +30, height-15);
    fill(0);
    text("f",30,height-10);
    text("p",width/2,height-10);
    text("f",width -30,height-10);
  }
  
}

void trebbleCleff(){
  fill(0);
  strokeWeight(1);
  textSize(15);
  text("G",5,75);
  stroke(0);
  line(10,90,10,30);
  ellipse(10,90,4,4);
}

//***************************************************
//Key Signatures

void Em(){
  fill(0);
  strokeWeight(1);
  textSize(20);
  text("#",15,47);
  stroke(0);
}
void G(){
  fill(0);
  strokeWeight(1);
  textSize(20);
  text("#",15,47);
  stroke(0);
}

void D(){
  fill(0);
  strokeWeight(1);
  textSize(20);
  text("#",15,47);
  text("#",20,62);
  stroke(0);
}

void Dm(){
  fill(0);
  strokeWeight(2);
  textSize(20);
  text("b",15,65);
  
  stroke(0);
}
