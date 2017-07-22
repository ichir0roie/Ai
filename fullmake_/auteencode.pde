//void settings() {
//  size(320, 320);
//}
//NN nn;

//int traindata=25;
//float[][] ques=new float[traindata][28*28];
//float[][] answ=new float[traindata][10];
//int[] anss=new int[traindata];

//NNViewer nv;

//void setup() {
//  key='l';
//  //frameRate(traindata);
//  getfile();
//  colorMode(HSB, 100, 100, 100, 100);
//  nn=new NN(new int[]{28*28, 100, 28*28}, 0.01, 0.5, 0.5);
//  for (int i=0; i<traindata; i++) {
//    int place=(int)random(10000);
//    //println(place);
//    int[] bu=getPic(place);
//    for (int j=0; j<bu.length; j++) {
//      ques[i][j]=(float)bu[j]/255;
//    }
//    int b=getLa(place);
//    anss[i]=b;
//    for (int j=0; j<answ[i].length; j++) {
//      answ[i][j]=0;
//      if (j==b) {
//        answ[i][j]=1;
//      }
//    }
//    println(answ[i]);
//    println();
//  }
//  nv=new NNViewer(nn);
//}
//int count=0;
//boolean first=true;

//boolean lmode=true;

//void draw() {
//  if (key=='l') {
//    lmode=true;
//  } else if (key=='t') {
//    lmode=false;
//  }

//  if (lmode) {
//    nn.forward(ques[count]);
//    nn.back_once(ques[count]);
//    count++;

//    if (count>=traindata) {

//      count=0;
//      nn.updataWeight();

//      float tesin[]=new float[28*28];

//      noStroke();
//      int cou=0;
//      background(0, 0, 50);
//      for (int w=0; w<5; w++) {
//        for (int h=0; h<5; h++) {

//          //tesin=ques[(int)random(ques.length)];
//          if (cou<ques.length&&lmode) {

//            tesin=ques[cou];

//            viewPic(tesin, w, h);


//            cou++;
//          }
//        }
//        if (first)first=false;
//      }
//    }
//  } else {
//    waitcount++;
//    if (waitcount>100) {
//      waitcount=0;
//      background(0, 0, 50);
//      for (int w=0; w<6; w+=2) {
//        for (int h=0; h<3; h++) {
//          float[] tesin=new float[28*28];
//          int[] bu=getPic((int)random(10000));
//          for (int j=0; j<bu.length; j++) {
//            tesin[j]=(float)bu[j]/255;
//          }
//          viewPic(tesin, w, h);
//          viewPic_nonn(tesin, w+1, h);
//        }
//      }
//    }
//  }
//}
//int waitcount=0;

//public void viewPic(float[] dat, int w, int h) {
//  float[] tes=nn.forward(dat);
//  for (int i=0; i<28; i++) {
//    for (int j=0; j<28; j++) {
//      fill(0, 0, tes[i*28+j]*100);
//      rect(j*2+w*56, i*2+h*56, 2, 2);
//    }
//  }
//}
//public void viewPic_nonn(float[] dat, int w, int h) {
//  for (int i=0; i<28; i++) {
//    for (int j=0; j<28; j++) {
//      fill(0, 0, dat[i*28+j]*100);
//      rect(j*2+w*56, i*2+h*56, 2, 2);
//    }
//  }
//}