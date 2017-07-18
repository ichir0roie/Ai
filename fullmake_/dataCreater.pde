byte[] teIm;
byte[] teLa, trIm, trLa;

void getfile() {
  teIm=loadBytes("trainD/teI.idx3-ubyte");
  teLa=loadBytes("trainD/teL.idx1-ubyte");
  println(teIm.length);
  println(teLa.length);
}

//all data load and translate function make!!


String getD_teLa(int place) {
  String buf="";
  int count=8;
  count+=place;
  buf+=binary(teLa[count]);

  return buf;
}
int getLa(int num) {
  String val=getD_teLa(num);
  int ret=unbinary(val);
  return ret;
}

String getD_teIm(int place) {
  String buf="";
  int count=16;
  count+=28*28*place;
  int end=count+28*28;
  for (; count<end; count++) {
    buf+=binary(teIm[count]);
  }
  return buf;
}


int[] getPic(int num) {
  String val=getD_teIm(num);
  int[] pic=new int[28*28];
  for (int x=0; x<28*28; x++) {
    //println(val.charAt(place));

    int v=unbinary(val.substring(x*8, x*8+8));
    //print(v+" ");

    pic[x]= v;
    //print(pic[x][y]);
  }
  //println();

  return pic;
}