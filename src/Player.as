package  
{
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Roger
	 */
	public class Player extends GameObject
	{
		var currentClip:MovieClip;
		var maxSpeed:int = 8;
		public var clipWidth:int;
		public var clipHeight:int;
		var currentKeyState:KeyboardEvent;
		var previousKeyState:KeyboardEvent;
		var leftMove:Boolean = false;
		var rightMove:Boolean = false;
		var downMove:Boolean = false;
		var upMove:Boolean = false;
		var bulletList:Sprite = new Sprite();
		
		var canShoot:Boolean = true;
		
		public function Player() 
		{
			currentClip = new testPlayermc();
			currentClip.stop();
			this.addChild(currentClip);
			
			
			this.x = 100;
			this.y = 100;
		}
		
		public function Initialize():void
		{
			stage.addEventListener(KeyboardEvent.KEY_DOWN, CheckKeysDown);
			stage.addEventListener(KeyboardEvent.KEY_UP, CheckKeysUp);
			stage.addChild(bulletList);
		}
		
		override public function Update():void
		{
			UpdateMovement();
			
			for (var i:int = 0; i < bulletList.numChildren; i++)
			{
				var theBullet:Bullet = (Bullet)(bulletList.getChildAt(i));
				if (theBullet.canUpdate == true)
					theBullet.Update();
			}
		}
		
		public function UpdateMovement():void
		{
			if (leftMove)
			{
				this.x -= maxSpeed;
			}
			if (upMove)
			{
				this.y -= maxSpeed;
			}
			if (rightMove)
			{
				this.x += maxSpeed;
			}
			if (downMove)
			{
				this.y += maxSpeed;
			}
		}
		
		public function CheckKeysDown(keyState:KeyboardEvent):void
		{
			if (keyState.keyCode == 65)//left
			{
				leftMove = true;
			}
			if (keyState.keyCode == 68)//Right
			{
				rightMove = true;
			}
			if (keyState.keyCode == 87)//Up
			{
				upMove = true;
			}
			if (keyState.keyCode == 83)//left
			{
				downMove = true;
			}
			if (keyState.keyCode == 32 && canShoot)
			{
				shootBullet();
				canShoot = false;
			}
			previousKeyState = keyState;
		}
		
		public function CheckKeysUp(keyState:KeyboardEvent):void
		{
			if (keyState.keyCode == 65)//left
			{
				leftMove = false;
			}
			if (keyState.keyCode == 68)//right
			{
				rightMove = false;
			}
			if (keyState.keyCode == 87)//up
			{
				upMove = false;
			}
			if (keyState.keyCode == 83)//down
			{
				downMove = false;
			}
			if (keyState.keyCode == 32 && !canShoot)
			{
				canShoot = true;
			}
			previousKeyState = currentKeyState
			currentKeyState = keyState;
		}
		
		public function shootBullet()
		{
			trace("shooting");
			var makeNew:Boolean = true;
			for (var i:int = 0; i < bulletList.numChildren; i++)
			{
				trace("reused bullet");
				var theBullet:Bullet = (Bullet)(bulletList.getChildAt(i));
				
				if (theBullet.canUpdate == false)
				{
					theBullet.Reload(this.x, this.y);
					makeNew = false;
					break;
				}
			}
			if (makeNew)
			{
				trace("made bullet");
				bulletList.addChild(new Bullet(this.x, this.y));
			}
		}
	}

}