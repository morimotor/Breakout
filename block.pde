class Block
{
  float x, y;
  float w, h;
  int hitPoint;
  boolean flag;
   

  void move(Ball[] balls, int num_balls, Item[] items, int num_items)
  //void move(Ball ball)
  {
    for(int i = 0; i < num_balls; i++)
    {
      if(isHit(balls[i].x, balls[i].y))
      {
         hitPoint--; 
         //ball.vx *= -1;
         balls[i].vy *= -1;
         if(hitPoint <= 0)flag = false;
         
         // append item
         for(int k = 0; k < num_items; i++)
         {
           if(items[i].flag == false)
           {
              int rand = (int)(random(1) * 3);
              
              if(rand > 1)break;
              
              items[i].flag = true;
              if(rand == 0)items[i].init(x, y, 0);  //x,y,kind
              if(rand == 1)items[i].init(x, y, 1);  //x,y,kind
              break;
            }
         }
         
      }
    }
    
    

  }
  
  void draw()
  {
    if(hitPoint == 5)
    {
      fill(255, 215, 0);
      rect(x - w/2, y - h/2, w, h);
    }
    else if(hitPoint == 4)
    {
      fill(192, 192, 192);
      rect(x - w/2, y - h/2, w, h);
    }
    else if(hitPoint == 3)
    {
      fill(0, 0, 255);
      rect(x - w/2, y - h/2, w, h);
    }
    else if(hitPoint == 2)
    {
      fill(0, 255, 0);
      rect(x - w/2, y - h/2, w, h);
    }
    else if(hitPoint == 1)
    {
      fill(255, 0, 0);
      rect(x - w/2, y - h/2, w, h);
    }    
    
    
    
  }
  
  
  boolean isHit(float cx, float cy)
  {
    if ( (y - h/2) > cy || (y + h/2) < cy || (x - w/2) > cx || (x + w/2) < cx )
    {
        return false;
    } else 
    {
        return true;
    }
  }
}
