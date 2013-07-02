package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Roger
	 */
	public class EnemyController extends Sprite
	{
		//for random numbers
		//var randUint:uint = uint(Math.random() * 4);
		//trace(randUint);
		var basicEnemyList:Sprite = new Sprite();
		
		public function EnemyController() 
		{
			trace("enemyController made");
		}
		
		public function spawnEnemies():void
		{
			var makeNew:Boolean = true;
			for (var i:int = 0; i < basicEnemyList.numChildren; i++)
			{
				trace("enemy reused");
				var theEnemy:BasicEnemy = (BasicEnemy)(basicEnemyList.getChildAt(i));
				
				if (theEnemy._exists == false)
				{
					var YPos:uint = uint(Math.random() * 480);
					theEnemy.ReUse(642, YPos);
					makeNew = false;
					break;
				}
			}
			if (makeNew)
			{
				trace("enemy made");
				var yPos:uint = uint(Math.random() * 480);
				var enemy:BasicEnemy = new BasicEnemy(new Enemymc(), 642, yPos);
				LevelManager.Instance().spriteList.addChild(enemy);
				//basicEnemyList.addChild(enemy);
			}
		}
	}

}