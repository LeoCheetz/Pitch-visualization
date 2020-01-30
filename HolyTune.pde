import processing.serial.*;
Serial ass;
import ddf.minim.analysis.*;
import ddf.minim.*;
Minim minim; AudioInput in; FFT fftLin;
PitchDetectorFFT PD; AudioSource AS;
float a=1,b=1,easing=0.3;//ease for frequency

void setup(){
  size(400,400);
  ass = new Serial(this, Serial.list()[2], 9600);
  printArray(Serial.list());
  minim = new Minim(this);
  minim.debugOn();
  AS = new AudioSource(minim);
  AS.OpenMicrophone();
  PD = new PitchDetectorFFT();
  PD.ConfigureFFT(2048, AS.GetSampleRate());
  PD.SetSampleRate(AS.GetSampleRate());
  AS.SetListener(PD);
}
void draw(){
  background(255);
  float level = AS.GetLevel();//threshold
  if(level>0.01){
    float f = 0;
    f = PD.GetFrequency();//
    ////
    float dA=f-a;
    a +=dA*easing;//easing Freq
        ////
    float dB=level-b;
    b +=dB*easing*2;//easing Vol
    ////
    float cc=map(b,0.01,0.06,255,170);//easing draw
    float H=map(a,0,800,400,100);//easing draw
    textSize(60); fill(cc);//Theremin FreqValue
    text("Louder", 100, 100);

    strokeWeight(0.5); fill(80);
    rect(120,H,150,5);
    textSize(10); fill(125);//Theremin FreqValue
    text(f, 180, 10);
    //////////
    //int send=int(f);
    
    byte out[]=new byte[1];
    out[0]=byte(a);
    //out[1]=byte(a);
    print(a + " ");
    ass.write(out);
    //ass.write(Integer.toString(cc));
  }
}

void stop(){
  AS.Close();
  minim.stop();
  super.stop();
}
