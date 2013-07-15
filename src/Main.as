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
		var gamePlayState:String = "GAMEPLAY";
		var mainMenuState:String = "MAINMENU";
		var pauseMenuState:String = "PAUSEMENU";
		var mainMenu:MainMenu;
		var currentGameState:String;
		var levelManager:LevelManager;
		
		public function Main() 
		{
			instance = this;
			currentGameState = mainMenuState;
			Initialize();
		}
		
		public static function Instance():Main
		{			
			return instance;
		}
		
		public function Initialize():void
		{
			mainMenu = new MainMenu();
			this.addChild(mainMenu);
			mainMenu.createMainMenu();
			this.addEventListener(Event.ENTER_FRAME, Update);
		}
		
		public function createLevel()
		{
			this.removeChild(mainMenu);
			levelManager = new LevelManager();
			currentGameState = gamePlayState;
		}
		
		public function Update(event:Event):void
		{
			if (currentGameState == gamePlayState)
			{
				levelManager.Update();
			}
			else if (currentGameState == mainMenuState)
			{
				mainMenu.Update();
			}
		}
	}

}