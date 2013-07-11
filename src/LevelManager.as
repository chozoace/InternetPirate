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
		var background:Background;
		var spriteList:Sprite = new Sprite();
		var enemyController:EnemyController;
		var levelConstructor:LevelConstructor;
		var testLevel:String = "TestLevel1.xml";
		var testBackground:MovieClip;
		
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
			background = new Background();
			Main.Instance().addChild(spriteList);
			levelConstructor = new LevelConstructor();
			levelConstructor.LoadMap(testLevel);
			
			
			//enemyController = new EnemyController();
			//clearInterval(frameInt)
			//frameInt = setInterval(moveFrame, 2000);
		}
		
		public function createPlayer(xPos:int, yPos:int)
		{
			player = new Player(xPos, yPos);
			spriteList.addChild(player);
		}
		
		public function Update():void
		{
			background.Update();
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var theSprite:GameObject = (GameObject)(spriteList.getChildAt(i));
				theSprite.Update();
			}
		}
		
		public function moveFrame():void
		{
			enemyController.spawnEnemies();
		}
	}

}