package  
{
	import flash.display.MovieClip;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.net.URLRequest;
	import flash.net.URLLoader;
	import flash.display.BitmapData;
	import flash.display.Bitmap;
	import flash.geom.*;
	import flash.utils.*;
	/**
	 * ...
	 * @author Roger
	 */
	public class LevelConstructor 
	{
		private var loader:Loader;
		
		private var xmlLoader:URLLoader; 
		private var xml:XML; 
		private var screenBitmap:Bitmap; 
		private var screenBitmapData:BitmapData;
		private var tilesBitmapData:BitmapData; 
		private var spriteWidth:uint;
		private var spriteHeight:uint;
		private var tileWidth:uint;
		private var tileHeight:uint;
		private var tileLength:uint;
		private var spriteSource:String;
		private var tiles:Array = new Array();
		// converting the tiles array into a multidimensional array later
		private var tileCoordinates:Array = new Array();
		
		public static var _instance:LevelConstructor;
		
		public function Instance():LevelConstructor
		{
			return _instance;
		}
		
		public function LevelConstructor()
		{
			_instance = this;
		}
		
		public function LoadMap(level:String)
		{
			LoadMapXML(level);
		}
		
		public function LoadMapXML(level:String):void
		{
			xmlLoader=new URLLoader();
			xmlLoader.addEventListener(Event.COMPLETE, xmlLoadComplete);
			var request:URLRequest = new URLRequest(level);
			xmlLoader.load(request);
		}
		
		public function xmlLoadComplete(e:Event):void
		{
			xml = new XML(e.target.data);
			tileLength = xml.layer.data.tile.length();
			spriteWidth = xml.attribute("width");
			spriteHeight = xml.attribute("height");
			tileWidth = xml.attribute("tilewidth");
			tileHeight = xml.attribute("tileheight");
			spriteSource = xml.tileset.image.attribute("source");
			
			for (var tileFor = 0; tileFor < tileLength; tileFor++) //puts all tile data in "tiles"
			{
				tiles.push(xml.layer.data.tile[tileFor].attribute("gid"));
			}
			
			for (var tileX = 0; tileX < spriteWidth; tileX++) //makes two dimensional array of tiles called tilecoordinates
			{
				tileCoordinates[tileX] = new Array();
				for (var tileY = 0; tileY < spriteHeight; tileY++)
				{
					tileCoordinates[tileX][tileY] = tiles[(tileX+(tileY*spriteWidth))]//assigns info from tiles into the tilecoordinates array
				}
			}
			tilesLoadInit();
		}
		
		public function tilesLoadInit ():void
		{
			
			var t:GameObject; 
			var playerXPos:int;
			var playerYPos:int;
			
			for (var spriteForX = 0; spriteForX < spriteWidth; spriteForX++)
			{
				for (var spriteForY = 0; spriteForY < spriteHeight; spriteForY++)
				{
					var tileNum:int = int(tileCoordinates[spriteForX][spriteForY]);
					var destY:int = spriteForY * tileWidth;
					var destX:int = spriteForX * tileWidth;
	
					if ( tileCoordinates[spriteForX][spriteForY] == 1) 
					{
						//nothing
					}
					if ( tileCoordinates[spriteForX][spriteForY] == 2) 
					{
						t = new BasicEnemy(new Enemymc(), destX, destY);
						LevelManager.Instance().spriteList.addChild(t);
						//add to "t" to list
					}
					if ( tileCoordinates[spriteForX][spriteForY] == 3)
					{
						//nothing
					}
					if ( tileCoordinates[spriteForX][spriteForY] == 4)
					{
						playerXPos = destX;
						playerYPos = destY;
						//add to "t" to list
					}
					if ( tileCoordinates[spriteForX][spriteForY] == 5)
					{
						//nothing
					}
				}
			}
			LevelManager.Instance().createPlayer(playerXPos, playerYPos);			
		}
		
		//public function loadTiles():void
		//{
			//
			//var t:Wall; 
			//
			//for (var spriteForX = 0; spriteForX < spriteWidth; spriteForX++)
			//{
				//for (var spriteForY = 0; spriteForY < spriteHeight; spriteForY++)
				//{
					//var tileNum:int = int(tileCoordinates[spriteForX][spriteForY]);
					//var destY:int = spriteForY * tileWidth;
					//var destX:int = spriteForX * tileWidth;
	//
					//if ( tileCoordinates[spriteForX][spriteForY] == 1) //use this to determine what wall to make
					//{
						//t = new Wall(32,32, 1);
						//t.x = destX;
						//t.y = destY;
						//add to "t" to list
					//}
					//if ( tileCoordinates[spriteForX][spriteForY] == 2) //use this to determine what wall to make
					//{
						//t = new Wall(32,32, 2);
						//t.x = destX;
						//t.y = destY;
						//add to "t" to list
					//}
					//if ( tileCoordinates[spriteForX][spriteForY] == 3) //use this to determine what wall to make
					//{
						//t = new Wall(32,32, 3);
						//t.x = destX;
						//t.y = destY;
						//add to "t" to list
					//}
					//if ( tileCoordinates[spriteForX][spriteForY] == 4) //deathBlock
					//{
						//t = new Wall(32,32, 4);
						//t.x = destX;
						//t.y = destY;
						//add to "t" to list
					//}
				//}
			//}
		//}
	}	
}