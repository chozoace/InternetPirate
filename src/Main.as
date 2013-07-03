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
	public class Main extends MovieClip
	{
		public static var instance:Main;
		var currentGameState:String;
		var levelManager:LevelManager;
		
		public function Main() 
		{
			instance = this;
			currentGameState = "GAMEPLAY";
			Initialize();
		}
		
		public static function Instance():Main
		{			
			return instance;
		}
		
		public function Initialize():void
		{
			levelManager = new LevelManager();
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function Update(event:Event):void
		{
			if (currentGameState == "GAMEPLAY")
			{
				levelManager.Update();
			}
		}
	}

}