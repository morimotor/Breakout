class ObjectManager
{
  static final int BLOCK_NUM_MAX = 3200;
  static final int BALL_NUM_MAX = 3200;
  static final int ITEM_NUM_MAX = 3200;
  
  Block[] blocks = new Block[BLOCK_NUM_MAX];
  Ball[] balls = new Ball[BALL_NUM_MAX];
  Item[] items = new Item[ITEM_NUM_MAX];
  Bar bar;
  
  int count_ball = 0;
  int count_block = 0;
  int count_item = 0;
    
  ObjectManager()
  {
     // init blocks
     int count = 0;
     for(int i = 0; i < 80; i++)
     {
       for(int k = 0; k < 40; k++)
       {
          blocks[count] = new Block();
          blocks[count].w = 8;
          blocks[count].h = 8;
          blocks[count].flag = true;
          blocks[count].x = 1 + 10 * i + blocks[count].w / 2;
          blocks[count].y = 1 + 10 * k + blocks[count].h / 2;
          blocks[count].hitPoint = 5 - k % 5;
          count++;
       }

     }
     
     // init ball
     count = 0;
     for(int i = 0; i < BALL_NUM_MAX; i++)
     {
          balls[count] = new Ball();
          balls[count].flag = false;
          balls[count].init(4, 0, 0, 0, 0);  //r,x,y,vx,vy
          count++;
     }
     
     // init item
     count = 0;
     for(int i = 0; i < ITEM_NUM_MAX; i++)
     {
          items[count] = new Item();
          items[count].flag = false;
          count++;
     }
      
    bar = new Bar();
    
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
    appendBall(4, bar.x, bar.y - 10, random(4) - 2, -random(1, 2));
  }
  
  
  boolean move()
  {
    count_ball = 0;
    count_block = 0;
    count_item = 0;
  
    bar.move();
    for(int i = 0; i < ITEM_NUM_MAX; i++)
    {
       if(items[i].flag)
       {
         items[i].move(bar, balls, BALL_NUM_MAX);
         if(items[i].flag)count_item++;
       }
    } 
    
    for(int i = 0; i < BALL_NUM_MAX; i++)
    {
       if(balls[i].flag)
       {
         balls[i].move(bar);
         if(balls[i].flag)count_ball++;
       }
    }      
     
    for(int i = 0; i < BLOCK_NUM_MAX; i++)
    {
       if(blocks[i].flag)
       {
         blocks[i].move(balls, BALL_NUM_MAX, items, ITEM_NUM_MAX);
         if(blocks[i].flag)count_block++;
       }
    }
    
    if(count_block == 0 || ( count_ball == 0 &&  count_item == 0))return true;
    return false;
      
  }
  
  void draw()
  {
    for(int i = 0; i < BLOCK_NUM_MAX; i++)
    {
       if(blocks[i].flag) blocks[i].draw();
    }
    for(int i = 0; i < BALL_NUM_MAX; i++)
    {
       if(balls[i].flag) balls[i].draw();
    }
    for(int i = 0; i < ITEM_NUM_MAX; i++)
    {
       if(items[i].flag) items[i].draw();
    }
    
    bar.draw();
    textSize(random(20, 20));
    text("block:" + count_block, 10, 480);
    text("ball:" + count_ball, 10, 500);
    text("item:" + count_item, 10, 520);
    
    if(count_block == 0)
    {
      textSize(random(50, 50));
      text("GAME CLEAR!!", 260, 300);
    }
    if( count_ball == 0 &&  count_item == 0)
    {
      textSize(random(50, 50));
      text("GAME OVER!!", 280, 300);
    }    
  }
  
  void appendBall(float r, float x, float y, float vx, float vy)
  {
     for(int i = 0; i < BALL_NUM_MAX; i++)
     {
       if(balls[i].flag == false)
       {
          balls[i].flag = true;
          balls[i].init(r, x, y, vx, vy);  //r,x,y,vx,vy
          break;
       }
     }
  }
  
}

