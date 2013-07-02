package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicEnemyMovement implements ITickable
	{
		var mySpeed:int = 8;
		var isDead:Boolean = false;
		var myObject:GameObject;
		
		public function BasicEnemyMovement(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function Update():void
		{
			if (!isDead)
			{
				myObject.x -= mySpeed;
				
				if (myObject.x < -79)
				{
					isDead = true;
					myObject._exists = false;
				}
			}
		}
		
	}

}