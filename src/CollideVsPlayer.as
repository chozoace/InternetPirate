package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public class CollideVsPlayer implements ICollision
	{
		var myObject:GameObject;
		var objectToReturn:GameObject;
		
		public function CollideVsPlayer(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function CheckCollisionWithSelf():Boolean //checks self objects with player
		{
			var player:Player = LevelManager.Instance().player;
			
			if (myObject.hitTestObject(player))
			{
				return true;
			}
			return false;
		}
		
		public function CheckCollisionWithOther(theObject:GameObject):Boolean // checks certain object with player
		{
			var player:Player = LevelManager.Instance().player;
			
			if (theObject.hitTestObject(player))
			{
				return true;
			}
			return false;
		}
		
		public function returnCollidingObject():GameObject
		{
			return LevelManager.Instance().player;
		}
	}

}