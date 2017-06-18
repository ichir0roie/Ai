float nodeCalc(float[] weight, float[] x,float bias){
 float z=0;
 
 for(int i=0;i<x.length;i++){
  z+=weight[i]*x[i]; 
 }
 z+=bias;
 return z;
}

class Node{
 float weight;
 float x;
}

class Layer{
  public Layer(int deep){
    nodes=new Node[deep];
  }
  Node[] nodes;
  
}

class NN{
 ArrayList layers=new ArrayList();
 public void addLayer(int size){
   layers.add(new Layer(size));
 }
 
 public Layer getlayer(int deep){
   return (Layer)layers.get(deep);
 }
 
}