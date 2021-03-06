package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicBulletTravel implements ITickable
	{
		var myObject:Bullet;
		
		public function BasicBulletTravel(theObject:Bullet) 
		{
			myObject = theObject;
		}
		
		public function Update():void
		{
			if (myObject._exists)
			{
				if(myObject.facing == 0)
					myObject.x += myObject.speed;
				else
					myObject.x -= myObject.speed;
				
				if (myObject.x > 800)
				{
					myObject.MakeInvisible();
				}
				else if (myObject.x < 0)
				{
					myObject.MakeInvisible();
				}
					
				if (myObject.CheckCollisionWithSelf())
				{
					var target:GameObject = myObject.returnCollidingObject();
					
					if(target.objectName != "Bullet")
						target.bulletHit(myObject);
					
					myObject.MakeInvisible();
				}
			}
		}
		
	}

}