package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	/**
	 * ...
	 * @author Roger
	 */
	public class MainMenu extends Sprite
	{
		var menuImage:MovieClip;
		var menuAdded:Boolean = false;
		var isVisible:Boolean = false;
		
		public function MainMenu() 
		{
			menuImage = new mainMenuMc();
			this.addChild(menuImage);
		}
		
		public function Update():void
		{
			if (!menuAdded)
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, CheckKeysDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, CheckKeysUp);
				menuAdded = true;
			}
		}
		
		public function CheckKeysDown(keyState:KeyboardEvent):void
		{
			if (isVisible)
			{
				if (keyState.keyCode == 32)
				{
					removeMainMenu();
				}
			}
		}
		
		public function CheckKeysUp(keyState:KeyboardEvent):void
		{
			
		}
		
		public function createMainMenu():void
		{
			//add buttons; kinda like an initialize
			isVisible = true;
		}
		
		public function removeMainMenu():void
		{
			//fade effects here
			Main.Instance().createLevel();
			isVisible = false;
		}
	}

}