ParticleSystem ps, smokeSystem, lightSystem, flowerSystem, wordSystem, blossomSystem, lightSystem2;
Wind wind;
PerlinNoiseField perlinField;
RadialField centralField, centralUpField, centralDownField, centralUpField2;
Spawner wordSpawner;

int maxX = 360;
int maxY = 640;
float time = 0;
PVector center;

final String[] textos = {"How the Earth\n is pulsating",
"Green",
"Earth",
//"Planet stability measure",
"Planet\nphotography",
"Woods",
//"History of the environment",
"Blue",
//"Measures of planet life",
//"Physiological signs",
"CO2",
//"Earth's physiological measurements",
//"All measurements together somewhere",
"Forests",
"Brown",
"Heart rate",
//"Just as physiological measures measure expectation",
"Gaia",
//"Distant people who access the information that represents the planet",
"Light",
"Planet\naffection",
"Synergy",
"Life",
//"Awareness of what is happening between each other",
"Homeostasis",
"Energy",
"Planet",
"Death",
"Herb",
"Flower",
"Vegetable",
"Shrub",
"Weed",
"Greenery",
"Flora",
"Vegetation", 
"Undergrowth", 
"Herbage", 
"Verdure",
"Sapling",
"Conifer", 
"Evergreen", 
"Bush", 
"Woodland",
"Trees",
"Plantation", 
"Jungle", 
"Greenwood", 
"Holt",
"Global\nwarming",
};

PFont font;

Malla malla;
Malla malla2;
Malla mallaUp;
color color1, color2;

void setup()
{
  size(360, 640);

  center = new PVector(maxX/2.0, maxY/2.0);
  
  ps = new ParticleSystem();  
  smokeSystem = new ParticleSystem();
  lightSystem = new ParticleSystem();
  lightSystem2 = new ParticleSystem();
  flowerSystem = new ParticleSystem();
  wordSystem = new ParticleSystem();
  blossomSystem = new ParticleSystem();
  wind = new Wind(5);
  perlinField = new PerlinNoiseField(0, 360, 0, 640);
  centralField = new RadialField(center.copy(), 0.8, 0, 360, 0, 640);
  centralUpField = new RadialField(center.copy().add(0,-200), -1, 0, 360, 0, 640);
  centralUpField2 = new RadialField(center.copy().add(0,-200), -1, 0, 360, 0, 640);
  centralDownField = new RadialField(center.copy().add(0,+100), 1.5, 0, 360, 0, 640);
  wordSpawner = new Spawner(wordSystem, 6, 1, 10, 350, 10, 630);
  
  font = createFont("Tempus Sans ITC", 32);
  
  
  color cor = color(255, 255, 255);
  WordType word;
  
  BlossomFlower blossom = new BlossomFlower(new PVector(width/2, 150));
  blossomSystem.addParticle(blossom);
  
  for(int i = 0; i<textos.length; i++)
  {
    word = new WordType(textos[i], cor, 20, 4, 0.0005);
    word.setFont(font);
    wordSpawner.addPrototype(word);
  }
  
  for(int i = 0; i<2300; i++)
  {
    //Smoke smoke = new Smoke(new PVector(random(360), random(640)), Smoke.defaultLifespan, 200);
    Smoke smoke = new Smoke(new PVector(random(360), random(640)), Smoke.defaultLifespan);
    smokeSystem.addParticle(smoke);
    
    //SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
    ////light.limitRegion(0, maxX, 0, maxY);
    //lightSystem.addParticle(light);
    
    
  }
  
  for(int i = 0; i<20; i++)
  {
    EllipticalFlower flower = new EllipticalFlower(new PVector(random(360), random(640)));
    flowerSystem.addParticle(flower);
    
  }
  
  for(int i = 0; i<100; i++)
  {
    SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
    light.limitRegion(0, maxX, 0, maxY);
    lightSystem.addParticle(light);
    
    PVector position = center.copy().add(0,-200);
    position.add(random(-100,100), random(-100,100));
    light = new SmallLightning(position);
    lightSystem2.addParticle(light);
  }

  background(255,255,255);
  //background(0,0,0);
  //background(250, 220, 172);
  
  
  //Cor padrão
  color1 = color(255, 0, 255);
  color2 = color(255, 255, 0);
  malla = new Malla(width*0.4, height*0.4, color1, color2);
  
  //Cor da Terra
  color1 = color(14, 192, 166);
  color2 = color(167, 222, 218);
  malla = new Malla(width*0.4, height*0.4, color1, color2);
  color1 = color(54, 68, 228);
  color2 = color(105, 129, 231);
  malla2 = new Malla(width*0.4, height*0.4, color1, color2);
  
  //Cor do Sol
  /*color1 = color(128,9,9);
  color2 = color(240,127,19);
  malla = new Malla(width*0.4, height*0.4, color1, color2);*/
  
  //Corrupção
  //color1 = color(74, 74, 74);
  //color2 = color(0, 0, 0);
  //malla2 = new Malla(width*0.4, height*0.4, color1, color2);
  
  color1 = color(255, 251, 49);
  color2 = color(126, 183, 255);
  mallaUp = new Malla(width*0.3, height*0.3, color1, color2);
  mallaUp.changeCenter(center.copy().add(0,-200));
  
}

void drawEarth()
{
  stroke(105, 129, 231);
  fill(54, 68, 228);
  ellipse(center.x, center.y, 50, 50);
  
  
  stroke(167, 222, 218);
  fill(14, 192, 166);
  ellipse(center.x, center.y, 15, 15);
}

boolean iniciou = false;

void draw()
{
  if(mousePressed || iniciou)
  {
    iniciou = true;
  
  
  
  
    clear();
    //background(250, 220, 172); //Bege
    //background(0,0,0); //Preto
    background(255,255,255); //Branco
    //background(245, 233, 249); //Roxo
    //background(13, 22, 145);
   
    float deltaT = 1.0/frameRate;
    
    WaterDrop drop = new WaterDrop(new PVector(random(0,maxX),0));
    
    
    ps.addParticle(drop);
    
    smokeSystem.insertField(perlinField);
    lightSystem.insertField(perlinField);
    wordSystem.insertField(centralField);
    
    lightSystem.insertField(centralUpField);
    lightSystem.insertField(centralDownField);
    
    lightSystem2.insertField(perlinField);
    
    PVector gravity = new PVector(0,9.8);
    PVector windForce = wind.getWindForce(deltaT);
    
    ps.insertForce(gravity.mult(2.0));
    blossomSystem.insertForce(gravity);
    //wordSystem.insertForce(gravity);
    
    //ps.insertForce(windForce);
    //smokeSystem.insertForce(windForce);
    
    //drawEarth();
    //fill(0, 24);
    //noStroke();
    //rect(0, 0, width, height);
    //malla.display();
    //malla2.display();
    //mallaUp.display();
    
    //Texto loading
    /*textFont(font);
    textAlign(CENTER);
    fill(0,0,0);
    textSize(36);
    text("Loading...", 180, 600);
    text("SenSeSeeds", 180, 100);*/
    
    //ps.run(deltaT);
    
    //smokeSystem.run(deltaT);
    lightSystem2.run(deltaT*20);
    lightSystem.run(deltaT*20);
    
    //flowerSystem.run(deltaT);
    //wordSpawner.run(deltaT);
    //wordSystem.run(deltaT); 
    
    //blossomSystem.run(deltaT);
    
    time += deltaT;
    
    if(time>=0.1)
    {
        for(int i = 0; i<100; i++)
        {
          
          PVector position = center.copy().add(0,-200);
          position.add(random(-100,100), random(-100,100));
          
          SmallLightning light = new SmallLightning(new PVector(random(360), random(640)));
          //SmallLightning light = new SmallLightning(position);
          
          light.limitRegion(0, maxX, 0, maxY);
          lightSystem.addParticle(light);
          
          light = new SmallLightning(new PVector(random(360), random(640)));
          //SmallLightning light = new SmallLightning(position);
          
          light.limitRegion(0, maxX, 0, maxY);
          
          //light = new SmallLightning(position);
          //light.limitRegion(center.x-100, center.x+100, center.y-100-200, center.y+100-200);
          lightSystem2.addParticle(light);
        }
        
        time = 0;
    }
  
  }
}
