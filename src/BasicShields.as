package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicShields implements IShields
	{
		var health:int;
		var myObject:GameObject;
		
		public function BasicShields(theHealth:int) 
		{
			health = theHealth;
		}
		
		public function onHit(damage:int):void
		{
			health -= damage;
			
			checkDeath();
		}
		
		public function checkDeath():void
		{
			if (health <= 0)
			{
				if (myObject != LevelManager.Instance().player)
				{
					myObject.MakeInvisible();
				}
				else
				{
					//player death
				}
			}
		}
		
	}

}