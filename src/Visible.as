package  
{
	import flash.display.MovieClip;
	/**
	 * ...
	 * @author Roger
	 */
	public class Visible implements IVisible
	{
		public var myClip:MovieClip;
		
		public function Visible(clipName:MovieClip) 
		{
			myClip = clipName;
		}
		
		public function Draw():MovieClip
		{
			return myClip;
		}
	}

}