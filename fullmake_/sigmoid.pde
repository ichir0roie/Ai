float sigmoid(float v){
  v=exp(1/v);
  v=1/(1+v);
  return v;
}