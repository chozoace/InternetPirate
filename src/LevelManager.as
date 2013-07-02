package  
{
	import flash.display.BitmapData;
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.MovieClip;
	import flash.display.DisplayObject;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.KeyboardEvent;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.utils.Dictionary;
	import flash.utils.clearInterval;
	import flash.utils.setInterval;
	/**
	 * ...
	 * @author Roger
	 */
	public class LevelManager extends Sprite
	{
		static public var instance:LevelManager;
		public var player:Player;
		var spriteList:Sprite = new Sprite();
		var enemyController:EnemyController;
		
		var frameInt:Number = 0;
		
		public function LevelManager() 
		{
			instance = this;
			Initialize();
		}
		
		public static function Instance():LevelManager
		{
			return instance;
		}
		
		public function Initialize():void
		{
			Main.Instance().addChild(spriteList);
			player = new Player();
			spriteList.addChild(player); 
			player.Initialize();
			enemyController = new EnemyController();
			clearInterval(frameInt)
			frameInt = setInterval(moveFrame, 1000);
		}
		
		public function Update():void
		{
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var theSprite:GameObject = (GameObject)(spriteList.getChildAt(i));
				theSprite.Update();
			}
		}
		
		public function moveFrame():void
		{
			trace("spawned");
			enemyController.spawnEnemies();
		}
	}

}