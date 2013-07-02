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
	public class GameObject extends MovieClip
	{
		var _v:IVisible;
		var _t:ITickable;
		var _s:IAIShootBehavior;
		var _g:IGunBehavior;
		public var _exists:Boolean = true;
		
		public function GameObject(v:IVisible = null, t:ITickable = null, s:IAIShootBehavior = null ) 
		{
			_v = v;
			_t = t;
			_s = s;
			this.Draw();
		}
		
		public function Draw():void
		{
			if (_v != null)
				this.addChild(_v.Draw());
		}
		
		public function Shoot():void
		{
			if(_s != null)
				_s.shoot();
		}
		
		public function Update():void
		{
			if(_t != null)
				_t.Update();
		}
		
		public function ReUse(xPos:int, yPos:int):void
		{
			this.x = xPos;
			this.y = yPos;
			_exists = true;
		}
		
	}

}