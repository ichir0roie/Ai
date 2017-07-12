float logistic(float val){
  val=1/(1+exp(-val));
  //print(val);
  return val;
}
float logistic_d(float val){
  val=logistic(val)*(1-logistic(val));
  //print(val);
  return val;
}