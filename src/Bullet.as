package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Roger
	 */
	public class Bullet extends GameObject
	{
		var speed:int = 10;
		public var canUpdate:Boolean = true;
		var myClip:MovieClip = new Bulletmc();
		
		public function Bullet(xPos:int, yPos:int) 
		{
			this.x = xPos + 30;
			this.y = yPos + 30;
			this.addChild(myClip);
		}
		
		override public function Update():void
		{
			this.x += speed;
			
			if (this.x > 640)
				canUpdate = false;
		}
		
		public function Reload(xPos:int, yPos:int):void
		{
			this.x = xPos + 30;
			this.y = yPos + 30;
			canUpdate = true;
		}
		
	}

}