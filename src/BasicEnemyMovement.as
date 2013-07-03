package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicEnemyMovement implements ITickable
	{
		var mySpeed:int = 5;
		var isDead:Boolean = false;
		var myObject:GameObject;
		
		public function BasicEnemyMovement(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function Update():void
		{
			if (myObject._exists)
			{
				myObject.x -= mySpeed;
				
				if (myObject.x < -79)
				{
					myObject.MakeInvisible();
				}			
			}
			
		}
		
	}

}