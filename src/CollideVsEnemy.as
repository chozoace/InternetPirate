package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Roger
	 */
	public class CollideVsEnemy implements ICollision
	{
		var myObject:GameObject;
		var objectToReturn:GameObject;
		
		public function CollideVsEnemy(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function CheckCollisionWithSelf():Boolean //checks all other objects with self
		{
			var spriteList:Sprite = LevelManager.Instance().spriteList;
			
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var object:GameObject = (GameObject)(spriteList.getChildAt(i));
				if (myObject.hitTestObject(object) && object != LevelManager.Instance().player && object != myObject)
				{
					//object.MakeInvisible();
					objectToReturn = object;
					return true;
				}
			}
			return false;
		}
		
		public function CheckCollisionWithOther(theObject:GameObject):Boolean // checks certain object with all other object
		{
			var spriteList:Sprite = LevelManager.Instance().spriteList;
			
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var object:GameObject = (GameObject)(spriteList.getChildAt(i));
				if (theObject.hitTestObject(object) && object != LevelManager.Instance().player && object != theObject)
				{
					//object.MakeInvisible();
					objectToReturn = object;
					return true;
				}
			}
			return false;
		}
		
		public function returnCollidingObject():GameObject
		{
			return objectToReturn;
		}
	}

}