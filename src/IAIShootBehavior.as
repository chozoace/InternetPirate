package  
{
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author Roger
	 */
	public interface IAIShootBehavior 
	{
		function shoot(event:TimerEvent = null):void;
		function shootUpdate():void;
		function isEnemyBullet():Boolean;
	}

}