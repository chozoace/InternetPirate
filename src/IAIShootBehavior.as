package  
{
	import flash.events.TimerEvent;
	/**
	 * ...
	 * @author Roger
	 */
	public interface IAIShootBehavior 
	{
		function shoot(event:TimerEvent):void;
		function shootUpdate():void;
	}

}