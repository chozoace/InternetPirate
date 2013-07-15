package  
{
	/**
	 * ...
	 * @author Roger
	 */
	public interface ICollision 
	{
			function CheckCollisionWithOther(theObject:GameObject):Boolean;
			function CheckCollisionWithSelf():Boolean;
			function returnCollidingObject():GameObject;
	}

}