package  
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicGun implements IAIShootBehavior
	{
		var myObject:GameObject;
		var fireRate:int = 1000;
		var bulletSpeed:int = 10;
		var damage:int = 0;
		var bulletList:Array = new Array();
		var myTimer:Timer;
		
		public function BasicGun(theObject:GameObject) 
		{
			myObject = theObject;
		}
		
		public function isEnemyBullet():Boolean
		{
			return false;
		}
		
		public function shootUpdate():void
		{
			
		}
		
		public function shoot(event:TimerEvent = null):void
		{
			if (myObject._exists)
			{
				var makeNew:Boolean = true;
				for (var i:int = 0; i < bulletList.length; i++)
				{
					var theBullet:Bullet = (Bullet)(bulletList[i]);
					if (theBullet._exists == false)
					{
						theBullet.ReUse(myObject.x + 30, myObject.y + 30);
						makeNew = false;
						break;
					}
				}
				if (makeNew)
				{
					var newBullet:Bullet = new Bullet(myObject.x, myObject.y, bulletSpeed, damage, null, 0, true);
					bulletList.push(newBullet);
					LevelManager.Instance().spriteList.addChild(newBullet);
				}
			}
		}
		
	}

}