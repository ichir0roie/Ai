//NN teN;
//NNViewer nv;

//void settings() {
//  size(800, 400);
//}

//int[] lay=new int[]{2, 3, 3, 1};
//float q=0.5;
//float u=0.9;
//float r=0.01;
//int traindata=8;

//void setup() {

//  colorMode(HSB, 100, 100, 100, 100);
//  teN=new NN(lay, q, u, r);

//  //frameRate(1);

//  nv=new NNViewer(teN);


//  setTrain();
//}


//float ExFunc(float x, float y) {
//  float ret=0;
//  if (y>x)ret=1;
//  //ret=x+y;

//  return ret;
//}

//float[][] train=new float[traindata][2];
//float[] tea=new float[traindata];

//int progcou=0;
//float aver=0;
//float averbef=0;
//public void setTrain() {
//  for (int i=0; i<traindata; i++) {
//    progcou=0;
//    averbef=100;
//    train[i][0]=random(1);
//    train[i][1]=random(1);
//    tea[i]=ExFunc(train[i][0], train[i][1]);
//  }
//}

////public void learning(int trys) {
////  for (int i=0; i<trys; i++) {
////    for (int j=0; j<trainlength; j++) {
////      println("num:"+j);

////      println("te:"+tea[j]);

////      teN.forward(train[j]);
////      teN.back_once(new float[]{tea[j]});
////      println("er:"+(tea[j]-teN.l[teN.l.length-1].z[0]));

////      nv.update(teN);
////      nv.View();
////    }
////      teN.updataWeight();
////  }
////}

//int j=0;
//int i=0;

//float er=0;

//boolean learningMode=true;

//void draw() {
//  if (learningMode) {
//    //println("num:"+j);

//    //println("te:"+tea[j]);
//    teN.forward(train[j]);
//    teN.back_once(new float[]{tea[j]});
//    //println("ou:"+teN.l[teN.l.length-1].u[0]);
//    //println("er:"+(tea[j]-teN.l[teN.l.length-1].u[0]));
//    er+=abs(tea[j]-teN.l[teN.l.length-1].u[0]);


//    nv.update(teN);
//    nv.View(); 
//    testView();

//    j++;
//    if (j>=traindata) {

//      teN.updataWeight();
//      nv.update(teN);
//      aver=er/traindata;

//      if (key=='c') {
//        key='q';
//        setTrain();
//      } else if (key=='p') {
//        learningMode=false;
//      } else {
//        averbef=aver;
//      }
//      println("aveerror:"+er/traindata);

//      er=0;
//      j=0;
//    }
//  } else {
//    //playmode
//  }
//}


//public void testView() {
//  //background(50, 50, 50);
//  float len=0.01;

//  for (float x=0; x<1; x+=len) {
//    for (float y=0; y<1; y+=len) {
//      float teath=ExFunc(x, y);
//      float test=teN.forward(new float[]{x, y})[0];
//      float er=abs(test-teath);
//      noStroke();
//      fill(0, 0, teath*100);
//      rect(x*height+width/2, (1-y)*height, height*len, height*len);
//      fill(0, 100, 100, er*100);
//      rect(x*height+width/2, (1-y)*height, height*len/2, height*len/2);
//    }
//  }
//  for (int i=0; i<traindata; i++) {
//    //noStroke();
//    fill(60, 100, 100);
//    ellipse(train[i][0]*height+width/2, train[i][1]*height, height*len*3, height*len*3) ;
//  }
//}