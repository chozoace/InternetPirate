package 
{
	import adobe.utils.CustomActions;
	import flash.display.BitmapData;
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
	public class Background extends Sprite
	{
		var _background1:MovieClip = new TestBackground();
		var _background2:MovieClip = new TestBackground();
		var _background3:MovieClip = new TestBackground();
		
		public static var _instance:Background;
		
		var _backgroundHolder:Sprite = new Sprite();
		
		public function Background()
		{
			_instance = this;
			
			Main.Instance().addChild(_background1);//center
			
			Main.Instance().addChild(_background2);//right
			_background2.x = _background1.x + _background1.width;
			
			Main.Instance().addChild(_background3);//left
			_background3.x = _background1.x - _background1.width;
		}
		
		public function Instance()
		{
			return _instance;
		}
		
		public function GetBackgroundHolder():Sprite
		{
			return _backgroundHolder;
		}
		
		public function Update():void
		{
			_background1.x -= 2;
			_background2.x -= 2;
			_background3.x -= 2;
			
			//to the right
			if (_background1.x < -_background1.width)
				_background3.x = _background2.x + _background2.width;
			if (_background2.x < -_background2.width)
				_background1.x = _background3.x + _background3.width;
			if (_background3.x < -_background3.width)
				_background2.x = _background1.x + _background1.width;
				
			//to the left
			if (_background1.x > _background1.width)
				_background2.x = _background3.x - _background3.width;
			if (_background3.x > _background3.width)
				_background1.x = _background2.x - _background2.width;
			if (_background2.x > _background2.width)
				_background3.x = _background1.x - _background1.width;
		}
		
		public function RemoveBackgrounds():void
		{
			Main.Instance().removeChild(_background1);
			Main.Instance().removeChild(_background2);
			Main.Instance().removeChild(_background3);
		}
	}
	
}