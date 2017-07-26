class Layer {
  float[] z;
  float[][] w;
  float[][] befwup;
  float[] d;
  float[][] dz;
  float[] u;

  int deep;
  int deepbefore;
  int biasplace;

  public Layer(int before, int here) {
    deep=here;
    biasplace=before+1;
    deepbefore=before;
    z=new float[here];
    w=new float[here][before+1];//+1--bias
    befwup=new float[here][before+1];
    d=new float[here+1];
    dz=new float[here][before+1];
    u=new float[here+1];

    float o=0;

    for (int i=0; i<here; i++) {
      for (int j=0; j<before+1; j++) {
        befwup[i][j]=0;
        if (j==before) {
          w[i][j]=0;
        } else {
          //o=1/pow(before,0.5);//???
          //w[i][j]=o*randomGaussian();
          w[i][j]=random(1);
        }
      }
    }
    u[here]=1;
    //b=random(1);
  }
}

class NN {

  int forwardcount=0;
  float e, u, r;
  Layer[] l;
  public NN(int[] deeps, float ee, float uu, float rr) {
    e=ee;
    u=uu;
    r=rr;
    l=new Layer[deeps.length];
    l[0]=new Layer(1, deeps[0]);
    for (int i=1; i<deeps.length; i++) {
      l[i]=new Layer(deeps[i-1], deeps[i]);
    }
  }

  public float[] forward(float[] input) {

    //println("forward");
    //l[0].u=input; 
    l[0].z=input;
    //for(int i=0;i<input.length;i++){
    //  l[0].z[i]=logistic(l[0].u[i]);
    //}
    //println(input);
    for (int i=1; i<l.length; i++) {
      for (int j=0; j<l[i].deep; j++) {
        l[i].u[j]=0;
        for (int k=0; k<l[i].deepbefore; k++) {
          l[i].u[j]+=l[i].w[j][k]*l[i-1].z[k];
        }
        l[i].u[j]+=l[i].w[j][l[i].biasplace-1];
        //print(l[i].u[j]+"||");
        l[i].z[j]=logistic(l[i].u[j]);
        //print(l[i].z[j]+"||");
      }
      //println();
    }
    
    return l[l.length-1].u;
  }
  
  public float geterror(float[] teach){
    float ave=0;
    
   for(int i=0;i<teach.length;i++){
    ave+=abs(teach[i]-l[l.length-1].u[i]); 
   }
     return ave;
  }

  public void back_once(float[] teach) {
    forwardcount++;
    for (int j=0; j<l[l.length-1].deep; j++) {
      l[l.length-1].d[j]=l[l.length-1].z[j]-teach[j];

      for(int k=0;k<l[l.length-1].biasplace-1;k++){
      l[l.length-1].dz[j][k]+=(l[l.length-1].u[j]-teach[j])*l[l.length-2].z[k];
      }
      l[l.length-1].dz[j][l[l.length-1].biasplace-1]+=(l[l.length-1].u[j]-teach[j]);
      
    }

    for (int i=l.length-1-1; i>0; i--) {
      for (int j=0; j<l[i+1].biasplace; j++) {
        l[i].d[j]=0;
        for (int k=0; k<l[i+1].deep; k++) {
          l[i].d[j]+=l[i+1].w[k][j]*l[i+1].d[k];
        }
        l[i].d[j]=logistic_d(l[i].u[j])*l[i].d[j];
      }
      for (int j=0; j<l[i].deep; j++) {
        for (int k=0; k<l[i].biasplace-1; k++) {
          l[i].dz[j][k]+=l[i].d[j]*l[i-1].z[k];
        }
        l[i].dz[j][l[i].biasplace-1]+=l[i].d[j];
      }
    }
  }
  public float updataWeight() {
    float ave=0;
    int c=0;
    for (int i=1; i<l.length; i++) {
      for (int j=0; j<l[i].deep; j++) {
        for (int k=0; k<l[i].biasplace; k++) {
          float cval=u*l[i].befwup[j][k];
          float w= l[i].w[j][k];
          cval-=e/(float)forwardcount*(l[i].dz[j][k]+r*w);
         w+=cval;
          if(w>10000000)w=10000000;
          l[i].w[j][k]=w;
          //l[i].w[j][k]-=e/(float)forwardcount*l[i].dz[j][k];
          c++;
          l[i].befwup[j][k]=cval;
          ave-=cval/e;
          l[i].dz[j][k]=0;
          //print( w+":");
        }
        //println();
      }
      //println("---");
    }
    forwardcount=0;
    return ave/c;
  }//biasかかか
}