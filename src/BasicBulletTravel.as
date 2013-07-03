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
				
				if (myObject.x > 640)
					myObject.canUpdate = false;
				else if (myObject.x < 0)
					myObject.canUpdate = false;
					
				if (myObject.CheckCollision(myObject))
				{
					myObject.MakeInvisible();
				}
			}
		}
		
	}

}