byte[] teIm;
byte[] teLa,trIm,trLa;
String val="";

int loadplace=0;

void getfile(){
  teIm=loadBytes("trainD/teI.idx3-ubyte");
  teLa=loadBytes("trainD/teL.idx1-ubyte");
  getD_teIm(8*16);
}

//all data load and translate function make!!
  

void getD_teIm(int howmuch){
  for(int i=loadplace;i<loadplace+howmuch;i++){
    val+=binary(teIm[i]);
  }
  //println(val);
  loadplace+=howmuch;
}

void viewDataStruct(){
  String buf;
  buf=val.substring(0,32);
  int a=unbinary(buf);
  println(a);
}

int[] getPic(int num){
  getD_teIm(8*28*28);
  int place=8*16;
  int[] pic=new int[28*28];
  place+=(28*28)*num*16;
    for(int x=0;x<28*28;x++){
      //println(val.charAt(place));
      
      int v=unbinary(val.substring(place,place+8));
      //print(v+" ");
      
      pic[x]= v;
      place+=8;
      //print(pic[x][y]);
    }
    //println();
  
  return pic;
}
      