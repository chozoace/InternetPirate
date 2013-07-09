package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Roger
	 */
	public class BasicEnemy extends GameObject
	{
		//updatable, visible, AI, canshoot
		var enemyImage:MovieClip;
		public function BasicEnemy(enemyType:MovieClip, xPos:int, yPos:int)  
		{
			this.x = xPos;
			this.y = yPos;
			enemyImage = enemyType;
			super(new Visible(enemyType), new BasicEnemyMovement(this), new BasicShooting(this));
		}
	}

}