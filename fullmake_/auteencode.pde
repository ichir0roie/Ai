//void settings() {
//  size(320, 320);
//}
//NN nn;

//int traindata=2;
//float[][] ques=new float[traindata][28*28];
//float[][] answ=new float[traindata][10];
//int[] anss=new int[traindata];

//NNViewer nv;

//void setup() {
//  //frameRate(traindata);
//  getfile();
//  colorMode(HSB, 100, 100, 100, 100);
//  nn=new NN(new int[]{28*28, 100, 28*28}, 0.001, 0.9, 0.0001);
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


//int place=(int)random(10000);
////int place=(int)random(traindata);

//void draw() {
//  nn.forward(ques[count]);
//  nn.back_once(ques[count]);
//  count++;
//  if (count>=traindata) {
//  //if (true) {
//    count=0;
//    nn.updataWeight();

//    float tesin[]=new float[28*28];

//    //place=(int)random(10000);
//    //println(place);
//    //float[] tes=ques[0];
//    noStroke();
//    for (int w=0; w<5; w++) {
//      for (int h=0; h<5; h++) {
//        int[] bu=getPic(place);
//        for (int j=0; j<bu.length; j++) {
//          tesin[j]=(float)bu[j]/255;
//        }
//        //tesin=ques[place];
//        float[] tes=nn.forward(tesin);
//        for (int i=0; i<28; i++) {
//          for (int j=0; j<28; j++) {
//            fill(0, 0, tes[i*28+j]*100);
//            rect(j*2+w*56, i*2+h*56, 2, 2);
//          }
//        }
//        place=(int)random(10000);
//        //place=(int)random(traindata);
//      }
//    }

//    //nv.update(nn);
//    //nv.View();

//    if (first)first=false;
//  }
//}