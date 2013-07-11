package  
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Roger
	 */
	public class EnemyController extends Sprite
	{
		var basicEnemyList:Array = new Array();
		
		public function EnemyController() 
		{
			
		}
		
		public function spawnEnemies():void
		{
			var makeNew:Boolean = true;
			for (var i:int = 0; i < basicEnemyList.length; i++)
			{
				var theEnemy:BasicEnemy = (BasicEnemy)(basicEnemyList[i]);
				
				if (theEnemy._exists == false)
				{
					var YPos:uint = uint(Math.random() * 580);
					theEnemy.ReUse(800, YPos);
					makeNew = false;
					break;
				}
			}
			if (makeNew)
			{
				var yPos:uint = uint(Math.random() * 580);
				var enemy:BasicEnemy = new BasicEnemy(new Enemymc(), 800, yPos);
				LevelManager.Instance().spriteList.addChild(enemy);
				basicEnemyList.push(enemy);
			}
		}
	}

}