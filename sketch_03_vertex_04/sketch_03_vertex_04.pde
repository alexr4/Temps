float margin = 100;

float phi; //angle de départ
float speedPhi;
float speedPhiPerElement; //vitesse de l'ange
float periode; //duree de l'angle
float amplitude; //amplitude de la ligne

float[] radiusList; //liste des valeurs y des points de la ligne
int radiusMax; //nombre d'element dans le tableau de valeur

void setup()
{
  size(500, 500, P3D);

  periode = 250;
  speedPhi = TWO_PI/periode;
  radiusMax = 10;  
  speedPhiPerElement = speedPhi * radiusMax; //vitesse de l'ange
  amplitude = 100;

  radiusList = new float[radiusMax];
}

void draw()
{
  background(200);
  updateWave();
  beginShape();
  noFill();
  for (int i=0; i< radiusMax; i++)
  {
    float eta = map(i, 0, radiusMax, 0, TWO_PI);
    float redvalue = map(i, 0, radiusMax, 0, 255);
    float radius = radiusList[i];
    float x = width/2 + sin(eta) * radius;
    float y = height/2 + cos(eta) * radius;
    fill(redvalue, 0, 0);
    vertex(x, y);
  }
  endShape(CLOSE);
}


void updateWave()
{
  phi += speedPhi;

  float radiusEta = phi;
  for (int i=0; i<radiusList.length; i++)
  {
    radiusList[i] = sin(radiusEta) * amplitude;
    radiusEta += speedPhiPerElement;
  }
}