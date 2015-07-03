class Bar
{
  float x = 400, y = 596;
  float w = 80, h = 2;
  float v = 6;
  float vx = 0;
  void move()
  {
    if(keyPressed)
    {
      if((keyCode == LEFT || key == 'a') && x - w/2 > 0) 
      {
         x -= v;
        vx = -v; 
      }
      else if((keyCode == RIGHT || key == 'd') && x + w/2 < width)
      {
         x += v;
         vx = v;
      }
      else vx = 0;
      
    }
  }
  void draw()
  {
    fill(255, 255, 255);
    rect(x - w/2, y - h/2, w, h);
  }
}
