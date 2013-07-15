package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Roger
	 */
	public class Bullet extends GameObject
	{
		public var speed:int;
		public var damage:int;
		public var facing:int;
		public var canUpdate:Boolean = true;
		var vsEnemy:Boolean;
		var myClip:MovieClip;
		
		public function Bullet(xPos:int, yPos:int, theSpeed:int = 10, theDamage:int = 0, theClip:MovieClip = null, direction:int = 0, vEnemy = false ) 
		{
			objectName = "Bullet";
			var collisionType:ICollision;
			this.x = xPos + 30;
			this.y = yPos + 30;
			vsEnemy = vEnemy;
			speed = theSpeed;
			damage = theDamage;
			facing = direction;
			if (theClip == null)
				myClip = new Bulletmc();
			else
				myClip = theClip;
			this.addChild(myClip);
			if(!vsEnemy)
				collisionType = new CollideVsPlayer(this);
			else if (vsEnemy)
				collisionType = new CollideVsEnemy(this);
			
			super(new Visible(myClip), new BasicBulletTravel(this), null, collisionType);
		}
		
		public function Reload(xPos:int, yPos:int):void
		{
			this.x = xPos + 30;
			this.y = yPos + 30;
			this._exists = true;
		}
		
	}

}