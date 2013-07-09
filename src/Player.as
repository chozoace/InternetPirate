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
			this.x = xPos;
			this.y = yPos;
			
			super(new Visible(new testPlayermc()), new PlayerMovement(this), new BasicGun(this));
		}
	}

}