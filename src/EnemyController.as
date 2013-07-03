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
		var basicEnemyList:Array = new Array();
		
		public function EnemyController() 
		{
			
		}
		
		public function spawnEnemies():void
		{
			var makeNew:Boolean = true;
			for (var i:int = 0; i < basicEnemyList.length; i++)
			{
				trace("enemy reused");
				var theEnemy:BasicEnemy = (BasicEnemy)(basicEnemyList[i]);
				
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
				var yPos:uint = uint(Math.random() * 400);
				var enemy:BasicEnemy = new BasicEnemy(new Enemymc(), 642, yPos);
				LevelManager.Instance().spriteList.addChild(enemy);
				basicEnemyList.push(enemy);
			}
		}
	}

}