class Item
{
  float x, y;
  float vy = 2;
  float w = 10, h = 10;
  int kind;
  boolean flag;
  
  void init(float _x, float _y, int _kind)
  {
    x = _x;
    y = _y;
    kind = _kind;
  }
  
  
  void move(Bar bar, Ball[] balls, int num_balls)
  {
     y += vy;
     
     if(isOut())flag = false;
     
     if(isHit(bar))
     {
         flag = false;
         if(kind == 0)bar.w += 2;
         if(kind == 1)appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(2), balls, num_balls);
         
     }
    
  }
  
  void draw()
  {
     if(kind == 0)
     {
        stroke(255, 0, 0);
        noFill();
        rect(x - w/2, y - h/2, w, h);
        noStroke();
     }
     else if (kind == 1)
     {
        stroke(0, 255, 0);
        noFill();
        rect(x - w/2, y - h/2, w, h);
        noStroke();
     }
    
  }
  
  // collision rect and rect
  boolean isHit(Bar bar)
  {
    if(bar.x + bar.w/2 >= x - w/2 && bar.x - bar.w/2 <= x + w/2   //x
    && bar.y + bar.h/2 >= y - h/2 && bar.y - bar.h/2 <= y + h/2)  //y
    {
      return true;
    }
    else return false;
  }
  
  void appendBall(float r, float x, float y, float vx, float vy, Ball[] balls, int num_balls)
  {
     for(int i = 0; i < num_balls; i++)
     {
       if(balls[i].flag == false)
       {
          balls[i].flag = true;
          balls[i].init(r, x, y, vx, vy);  //r,x,y,vx,vy
          break;
       }
     }
  }
  
  boolean isOut()
  {
     if(y > height + h)return true;
     else return false;
  }
  
}
