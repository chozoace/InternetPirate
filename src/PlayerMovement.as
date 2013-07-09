package  
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.KeyboardEvent;
	import flash.display.Stage;
	/**
	 * ...
	 * @author Roger
	 */
	public class PlayerMovement extends Sprite implements ITickable 
	{
		var myObject:GameObject;
		var currentKeyState:KeyboardEvent;
		var previousKeyState:KeyboardEvent;
		var leftMove:Boolean = false;
		var rightMove:Boolean = false;
		var downMove:Boolean = false;
		var upMove:Boolean = false;
		var listenersAdded:Boolean = false;
		var maxSpeed:int = 8;
		var canShoot:Boolean = true;
		
		public function PlayerMovement(theObject:GameObject) 
		{
			myObject = theObject;
			Main.Instance().addChild(this);
		}
		
		public function Update():void
		{
			if (listenersAdded == false)
			{
				stage.addEventListener(KeyboardEvent.KEY_DOWN, CheckKeysDown);
				stage.addEventListener(KeyboardEvent.KEY_UP, CheckKeysUp);
				listenersAdded = true;
			}
			
			if (leftMove)
			{
				myObject.x -= maxSpeed;
			}
			if (upMove)
			{
				myObject.y -= maxSpeed;
			}
			if (rightMove)
			{
				myObject.x += maxSpeed;
			}
			if (downMove)
			{
				myObject.y += maxSpeed;
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
				myObject.Shoot();
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
		
	}

}