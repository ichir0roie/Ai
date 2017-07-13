public class NNViewer {
  Layer ls[];
  float ellisize=70;
  public NNViewer(NN usingNetwork) {
    ls=usingNetwork.l;
  }

  public void update(NN now) {
    ls=now.l;
  }

  public void View() {
    background(0, 0, 50);
    int befnd=0;
    for (int layc=0; layc<ls.length; layc++) {
      int nownd=ls[layc].deep+1;
      for (int ndc=0; ndc<nownd; ndc++) {
        if (ndc!=nownd-1) {
          elli(layc, ndc, ls[layc].z[ndc]);
          if (layc!=0)
            lin(layc, ndc, befnd, ls[layc].w[ndc]);
        } else {
          elli(layc,ndc,1);
        }
      }


      befnd=nownd;
    }
    
  }

  public void elli(int nx, int ny, float size) {
    noStroke();
fill(0,0,100);
    ellipse((float)nx*ellisize+ellisize, (float)ny*ellisize+ellisize, 
      size*ellisize/2, size*ellisize/2);
  }
  public void lin(int nx, int ny, int befy, float size[]) {
    for (int befc=0; befc<befy; befc++) {
      stroke(1);
      float buf=size[befc];
      if (buf<0)buf=0;
      strokeWeight(buf*ellisize/20);
      line((float)(nx-1)*ellisize+ellisize, 
        (float)befc*ellisize+ellisize, 
        (float)nx*ellisize+ellisize, 
        (float)ny*ellisize+ellisize
        );
    }
  }
}