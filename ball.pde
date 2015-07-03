class Ball
{
  float x, y;
  float vx, vy;
  float radius;
  boolean flag;
  
  void init( float _radius, float _x, float _y , float _vx, float _vy) 
  {
    radius = _radius;
    x = _x;
    y = _y;
    vx = _vx;
    vy = _vy;
  }

  void move(Bar bar)
  {
    x = x + vx;
    y = y + vy;
    
    if(x < 0 || x > width )
    {
      vx *= -1; 
    }
    if(y < 0)
    {
      vy *= -1;
    }
    
    if(isOut())flag = false;
    
    if(isHit(x, y, radius, bar.x - bar.w/2, bar.y + bar.h/2, bar.x + bar.w/2, bar.y + bar.h/2))
    {
      vx += bar.vx /10;
      vy *= -1;
      
    }
    
  }
  void draw()
  {
    fill(255, 255, 0);
    ellipse(x,  y,  radius,  radius);
  }

  boolean isOut()
  {
     if(y > height + radius)return true;
     else return false;
  }

  // collision line and circle
  boolean isHit(float cx, float cy, float cr,float lx1, float ly1, float lx2, float ly2)
  {
    float A, B, C, CA, AS, BS;
    float d;

    A = pow(cx - lx1, 2.0) + pow(cy - ly1, 2.0);
    B = pow(cx - lx2, 2.0) + pow(cy - ly2, 2.0);
    C = pow(lx1 - lx2, 2.0) + pow(ly1 - ly2, 2.0);
    CA = (lx2 - lx1) * (cy - ly1) - (cx - lx1) * (ly2 - ly1);
    AS = (cx - lx1) * (lx2 - lx1) + (cy - ly1) * (ly2 - ly1);
    BS = (cx - lx2) * (lx2 - lx1) + (cy - ly2) * (ly2 - ly1);

    if(C != 0) d = pow(CA, 2.0) / C;
    else d = 0;
    if(d <= pow(cr, 2.0))
    {
        if(AS * BS <= 0)
        {
            return true;
        } 
        else if(pow(cr, 2.0) > A || pow(cr, 2.0) > B)
        {
            return true;
        }
    }
    return false;
  }
  
}
