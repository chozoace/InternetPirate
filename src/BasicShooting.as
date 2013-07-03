package  
{
	import flash.events.TimerEvent;
	import flash.utils.Timer;
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicShooting implements IAIShootBehavior
	{
		var myObject:GameObject;
		var fireRate:int = 1000;
		var bulletSpeed:int = 10;
		var damage:int = 0;
		var bulletList:Array = new Array();
		var myTimer:Timer;
		
		public function BasicShooting(theObject:GameObject) 
		{
			myObject = theObject;
			myTimer = new Timer(fireRate);
			myTimer.addEventListener(TimerEvent.TIMER, shoot);
			myTimer.start();
		}
		
		public function shootUpdate():void
		{
			
		}
		
		public function shoot(event:TimerEvent):void
		{
			if (myObject._exists)
			{
				var makeNew:Boolean = true;
				for (var i:int = 0; i < bulletList.length; i++)
				{
					var theBullet:Bullet = (Bullet)(bulletList[i]);
					
					if (theBullet.canUpdate == false)
					{
						theBullet.Reload(myObject.x, myObject.y);
						makeNew = false;
						break;
					}
				}
				if (makeNew)
				{
					var newBullet:Bullet = new Bullet(myObject.x, myObject.y, bulletSpeed, damage, new Bullet2mc(), 1);
					bulletList.push(newBullet);
					LevelManager.Instance().spriteList.addChild(newBullet);
				}
			}
		}
		
	}

}