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
  
  float[][] weights;
  
  public void setWeight(int beforeLayerLength){
   weights=new float[nodes.length][beforeLayerLength];
  }
  
  public int getlength(){return nodes.length;}
  
}

class NN{
  Layer[] layers;
  private NN(int deep,int firstLaysSize){
    layers=new Layer[deep];
    layers[count]=new Layer(firstLaysSize);
    layers[count].setWeight(0);
    count++;
  }
  int count=0;
 public void addLayer(int size){
   layers[count]=new Layer(size);
   layers[count].setWeight(layers[count-1].getlength());
   count++;
 }
 
 
}