package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Roger
	 */
	public class Player extends GameObject
	{
		public function Player(xPos:int = 100, yPos:int = 100)
		{
			objectName = "Player";
			this.x = xPos;
			this.y = yPos;
			health = 100;
			
			super(new Visible(new testPlayermc()), new PlayerMovement(this), new BasicGun(this));
			super.equipShields(new BasicShields(health));
		}
	}

}