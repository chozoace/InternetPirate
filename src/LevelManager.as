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
	/**
	 * ...
	 * @author Roger
	 */
	public class LevelManager extends Sprite
	{
		static public var instance:LevelManager;
		public var player:Player;
		var spriteList:Sprite = new Sprite();
		
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
		}
		
		public function Update():void
		{
			for (var i:int = 0; i < spriteList.numChildren; i++)
			{
				var theSprite:VisibleObject = (VisibleObject)(spriteList.getChildAt(i));
				theSprite.Update();
			}
		}
	}

}