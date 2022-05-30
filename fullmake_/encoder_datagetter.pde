void settings() {
  size(1000, 500);
}
NN nn;

int traindata=3;
float[][] ques=new float[traindata][28*28];
float[][] answ=new float[traindata][10];
int[] anss=new int[traindata];

NNViewer nv;


PrintWriter out;

void setup() {
  key='l';
  //frameRate(traindata);
  getfile();
  colorMode(HSB, 100, 100, 100, 100);
  nn=new NN(new int[]{28*28, 10, 28*28}, 0.025, 0.01, 0.99);
  for (int i=0; i<traindata; i++) {
    //int place=(int)random(10000);
    int place=i;
    //println(place);
    int[] bu=getPic(place);
    for (int j=0; j<bu.length; j++) {
      ques[i][j]=(float)bu[j]/255;
    }
    int b=getLa(place);
    anss[i]=b;
    for (int j=0; j<answ[i].length; j++) {
      answ[i][j]=0;
      if (j==b) {
        answ[i][j]=1;
      }
    }
    println(answ[i]);
    println();
  }
  nv=new NNViewer(nn);

  out=createWriter("outdata.txt");
}
int count=0;
boolean first=true;

float[][] es=new float[500][2];
int escount=0;
int rescount=0;
public void reset_es() {
  //TODO output textfile
  escount=0;

  for (int i=0; i<es.length; i++) {
    out.println(i+es.length*rescount+"  "+
      es[i][0]+"  "+es[i][1]);
  }
  out.flush();
  rescount++;
}

float buferror=0;
void draw() {

  nn.forward(ques[count]);
  buferror+=nn.geterror(ques[count]);
  nn.back_once(ques[count]);
  count++;

  if (count>=traindata) {
    //background(0, 0, 50);
    es[escount][0]=buferror/count;
    println("-----------"+escount);
    println(es[escount][0]);
    buferror=0;
    count=0;
    nn.updataWeight();




    noStroke();
    int cou=0;
    float tesin[]=new float[28*28];
    for (int w=0; w<4; w++) {
      for (int h=0; h<5; h++) {

        if (cou<ques.length) {
          //tesin=ques[(int)random(ques.length)];

          tesin=ques[cou];

          viewPic(tesin, w, h+4);


          cou++;
        }
      }
      if (first)first=false;
    }
    int c=0;
    for (int w=0; w<4; w+=2) {
      for (int h=0; h<3; h++) {
        float[] tesin2=new float[28*28];
        float[] tesin2_2=new float[28*28];
        int[] bu=getPic((int)random(10000));
        int[] bu_2=getPic(c);
        c++;
        for (int j=0; j<bu.length; j++) {
          tesin2[j]=(float)bu[j]/255;
          tesin2_2[j]=(float)bu_2[j]/255;
        }
        viewPic(tesin2, w, h);
        viewPic(tesin2_2, w+5, h);
        buferror+=nn.geterror(tesin2);
        viewPic_nonn(tesin2, w+1, h);
        viewPic_nonn(tesin2_2, w+1+5, h);
      }
    }
    es[escount][1]=buferror/6;
    println(es[escount][1]);
    buferror=0;
    
    printLine();

    escount++;
    if (escount>=es.length) {
      reset_es();
    }
  }
}

void dispose(){
 out.close(); 
}

public void viewPic(float[] dat, int w, int h) {
  float[] tes=nn.forward(dat);
  for (int i=0; i<28; i++) {
    for (int j=0; j<28; j++) {
      fill(0, 0, tes[i*28+j]*100);
      rect(j*2+w*56, i*2+h*56, 2, 2);
    }
  }
}
public void viewPic_nonn(float[] dat, int w, int h) {
  for (int i=0; i<28; i++) {
    for (int j=0; j<28; j++) {
      fill(0, 0, dat[i*28+j]*100);
      rect(j*2+w*56, i*2+h*56, 2, 2);
    }
  }
}
float setter=400;
public void printLine() {
  float[] val=es[escount];
  float x=setter+escount+es.length*rescount;
  if (x>width) {
    setter-=600;
    background(0, 0, 60);
  }
  fill(0, 0, 0);
  ellipse(x, height-val[0]/200*height, 2, 2);
  fill(0, 0, 100);
  ellipse(x, height-val[1]/200*height, 2, 2);
}
