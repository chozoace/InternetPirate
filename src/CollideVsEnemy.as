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
		
		public function CollideVsEnemy(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function CheckCollision(theObject:GameObject):Boolean
		{
			var spriteList:Sprite = LevelManager.Instance().spriteList;
			
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var object:GameObject = (GameObject)(spriteList.getChildAt(i));
				if (myObject.hitTestObject(object) && object != LevelManager.Instance().player)
				{
					object.MakeInvisible();
					return true;
				}
			}
			return false;
		}
	}

}