//void settings() {
//  size(600, 600);
//}
//NN nn;

//int traindata=3;
//float[][] ques=new float[traindata][28*28];
//float[][] answ=new float[traindata][10];
//int[] anss=new int[traindata];

//NNViewer nv;

//void setup() {
//  //frameRate(traindata);
//  getfile();
//  colorMode(HSB, 100, 100, 100, 100);
//  nn=new NN(new int[]{28*28, 100, 10}, 0.1, 0.3, 0.09);
//  setT();
//  nv=new NNViewer(nn);
//}
//int time=0;
//public void setT() {
//  for (int i=0; i<traindata; i++) {
//    int place=(int)random(10000);
//    //println(place);
//    int[] bu=getPic(place);
//    for (int j=0; j<bu.length; j++) {
//      ques[i][j]=(float)bu[j]/255;
//      //print(ques[i][j]+":");
//    }
//    int b=getLa(place);
//    anss[i]=b;
//    for (int j=0; j<answ[i].length; j++) {
//      answ[i][j]=0;
//      if (j==b) {
//        answ[i][j]=1;
//        print(i+":"+j+",");
//      }
//    }
//    //println(answ[i]);
//    //println();
//  }
//}


//public float[] getDat(int place) {
//  float[] ret=new float[28*28];
//  //println(place);
//  int[] bu=getPic(place);
//  for (int j=0; j<bu.length; j++) {
//    ret[j]=(float)bu[j]/255;
//    //print(ques[i][j]+":");
//  } 
//  return ret;
//}

//public float[] getans(int place) {
//  int b=getLa(place);
//  print(b+":");
//  float[] ret=new float[10];
//  for (int j=0; j<ret.length; j++) {
//    ret[j]=0;
//    if (j==b) {
//      ret[j]=1;
//    }
//  }
//  return ret;
//}

//int count=0;
//boolean first=true;
//void draw() {
//  //time++;
//  //println(time);
//  nn.forward(ques[count]);
//  nn.back_once(answ[count]);
//  count++;
//  if (count>=traindata) {
//    count=0;
//    nn.updataWeight();


//    background(0, 0, 0, 0);
//    float error=0;
//    for (int i=0; i<traindata; i++) {
//      //print(anss[i]+":");
//      float[] vals=nn.forward(ques[i]);
//      float buferror=0;
//      for (int j=0; j<10; j++) {
//        buferror+=abs(answ[i][j]-vals[j]);
//        //println(j+":"+nn.forward(ques[i])[j]);
//        fill(0, 0, vals[j]*100);
//        //print(vals[j]+":");
//        rect(i*25+300, 20*j, 20, 18);
//      }
//      error+=buferror/10;
//      //println();
//    }
//    error/=traindata;
//    println("tra:"+error);

//    for (int i=0; i<10; i++) {
//      int place=(int)random(10000);
//      float[] ans=getans(place);
//      float[] vals=nn.forward( getDat(place));
//      float buferror=0;
//      for (int j=0; j<10; j++) {
//        buferror+=abs(ans[j]-vals[j]);
//        //println(j+":"+nn.forward(ques[i])[j]);
//        fill(0, 0, vals[j]*100);
//        //print(vals[j]+":");
//        rect(i*25+300, 20*j+300, 20, 18);
//      }
//      error+=buferror/10;
//      //println();
//    }
//    error/=traindata;
//    println();
//    println("tes:"+error);
//    println("----------");

//    viewer();



//    if (key=='c') {
//      setT();
//      key='e';
//      first=true;
//    }

//    //nv.update(nn);
//    //nv.View();

//    if (first)first=false;
//  }
//}

//float[][] ws=new float[100][28*28];
//public void viewer() {
//  noStroke();
//  ws= nn.l[1].w;
//  int i=0;
//  int h=0;
//  for (float[] nd : ws) {
//    int j=0;
//    int k=0;
//    for (float wei : nd) {
//      fill(0, 0, wei*100);
//      rect(j+i*28, k+h*28, 1, 1);
//      j++;
//      if (j>=28) {
//        j=0;
//        k++;
//      }
//    }
//    k=0;
//    j=0;
//    i++;
//    if (i>=10) {
//      i=0;
//      h++;
//    }
//  }
//}