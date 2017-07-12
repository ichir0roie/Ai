NN teN;
NNViewer nv;

void settings() {
  size(300, 300);
}

void setup() {

  colorMode(HSB, 100, 100, 100);
  teN=new NN(new int[]{2, 3, 1}, 0.01, 0.5, 0.0001);

  inp=new float[]{random(1), random(1)};
  //frameRate(1);

  nv=new NNViewer(teN);
}

float[] inp;
float tea;
float oup;

float ExFunc(float x, float y) {
  float ret=0;
  if (y-x>0)ret=1;
  //ret=x+y;

  return ret;
}

int c=0;
boolean pat=true;

void draw() {
  c++;
  //if(pat){
  //inp[0]=2;
  //inp[1]=1;
  inp[0]=random(1);
  inp[1]=random(1);
  //}else{
  //inp[0]=1;
  //inp[1]=2;
  ////inp[0]=random(1);
  ////inp[1]=random(2);
  //}

  //println("in:"+inp[0]+"|"+inp[1]);

  tea=ExFunc(inp[0], inp[1]);

  //println("te:"+tea);

  //teN.l[0].z[0]=inp[0];
  //teN.l[0].z[1]=inp[1];

  teN.forward(inp);
  teN.back_once(new float[]{tea});
  if (c>50) {
    teN.updataWeight();
    c=0;
    //pat=!pat;
    //inp[0]=random(1);
    //inp[1]=random(1);
    //inp[0]=2;
    //inp[1]=1;
  }

  //float v=teN.updataWeight();
  //if (abs(tea-teN.l[teN.l.length-1].u[0])<0.01) {
  //  inp[0]=random(1);
  //  inp[1]=random(1);
  //}
  
  //println("ou:"+teN.l[teN.l.length-1].z[0]);
  println("er:"+(tea-teN.l[teN.l.length-1].z[0]));
  //println("up:"+v);
  //println();

  nv.update(teN);
  nv.View();

  //for (int i=1; i<teN.l.length; i++) {
  //  for (int j=0; j<teN.l[i].deep; j++) {
  //    for (int k=0; k<teN.l[i].deepbefore; k++) {
  //      rect(i*30+10, j*100+30+k*10, teN.l[i].w[j][k]*100, 100*teN.l[i].w[j][k]);
  //    }
  //  }
  //}

  //println();
}