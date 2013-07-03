package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class CollideVsPlayer implements ICollision
	{
		var myObject:GameObject
		
		public function CollideVsPlayer(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function CheckCollision(theObject:GameObject):Boolean
		{
			var player:Player = LevelManager.Instance().player;
			
			if (theObject.hitTestObject(player))
			{
				return true;
			}
			return false;
		}
	}

}