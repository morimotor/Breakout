ObjectManager om;

boolean isGameEnd;

void setup()
{
  size(800, 600);

  om = new ObjectManager();

}

void draw()
{
  background(0, 0, 0);  
    
  isGameEnd = om.move();
  om.draw();
  
  if(key == 's' && isGameEnd)om = new ObjectManager();
  
  if(isGameEnd)
  {
    textSize(random(35, 35));
    text("press 's' -> NEW GAME", 260, 350);
  }
}

