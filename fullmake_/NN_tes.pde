NN teN;
NNViewer nv;

void settings() {
  size(300, 300);
}

void setup() {

  colorMode(HSB, 100, 100, 100);
  teN=new NN(new int[]{2, 3, 1}, 0.5,0.5,0.001);

  //frameRate(1);

  nv=new NNViewer(teN);
  
  
  setTrain(); 
}


float ExFunc(float x, float y) {
  float ret=0;
  if (y-x>0)ret=1;
  //ret=x+y;

  return ret;
}

int trainlength=100;
float[][] train=new float[trainlength][2];
float[] tea=new float[trainlength];

public void setTrain() {
  for (int i=0; i<trainlength; i++) {
    train[i][0]=random(1);
    train[i][1]=random(1);
    tea[i]=ExFunc(train[i][0], train[i][1]);
  }
}

//public void learning(int trys) {
//  for (int i=0; i<trys; i++) {
//    for (int j=0; j<trainlength; j++) {
//      println("num:"+j);

//      println("te:"+tea[j]);

//      teN.forward(train[j]);
//      teN.back_once(new float[]{tea[j]});
//      println("er:"+(tea[j]-teN.l[teN.l.length-1].z[0]));

//      nv.update(teN);
//      nv.View();
//    }
//      teN.updataWeight();
//  }
//}

int j=0;
int i=0;

float er=0;

void draw() {
      println("num:"+j);

      println("te:"+tea[j]);

      teN.forward(train[j]);
      teN.back_once(new float[]{tea[j]});
      println("ou:"+teN.l[teN.l.length-1].u[0]);
      println("er:"+(tea[j]-teN.l[teN.l.length-1].u[0]));
      er+=abs(tea[j]-teN.l[teN.l.length-1].u[0]);

      nv.update(teN);
      nv.View();
      
      j++;
    if(j>=trainlength){
    teN.updataWeight();
    println("aveerror:"+er/trainlength);
    er=0;
    j=0;
    }
  i++;
}