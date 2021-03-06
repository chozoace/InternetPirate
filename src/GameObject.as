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
	import flash.events.TimerEvent;
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
		var _c:ICollision;
		var _sh:IShields;
		var objectName:String;
		protected var health:int;
		public var _exists:Boolean = true;
		
		public function GameObject(v:IVisible = null, t:ITickable = null, s:IAIShootBehavior = null, c:ICollision = null ) 
		{
			_v = v;
			_t = t;
			_s = s;
			_c = c;
			this.Draw();
		}
		
		public function equipShields(s:IShields)
		{
			_sh = s;
		}
		
		public function Draw():void
		{
			if (_v != null)
				this.addChild(_v.Draw());
		}
		
		public function MakeInvisible():void
		{
			this.removeChild(_v.Draw());
			_exists = false;
		}
		
		public function Shoot():void
		{
			if (!_s.isEnemyBullet())
				_s.shoot();
		}
		
		public function Update():void
		{
			if (_t != null)
			{
				//_s.shootUpdate();
				_t.Update();
			}
		}
		
		public function CheckCollisionWithSelf():Boolean
		{
			return _c.CheckCollisionWithSelf();
		}
		
		public function CheckCollisionWithOther(theObject:GameObject):Boolean
		{
			return _c.CheckCollisionWithOther(theObject);
		}
		
		public function returnCollidingObject():GameObject
		{
			return _c.returnCollidingObject();
		}
		
		public function bulletHit(theBullet:Bullet):void
		{
			//_sh.onHit(theBullet.damage);
			health -= theBullet.damage;
			if (health <= 0)
			{
				MakeInvisible();
			}
		}
		
		public function ReUse(xPos:int, yPos:int):void
		{
			this.x = xPos;
			this.y = yPos;
			this.Draw();
			_exists = true;
		}
		
	}

}