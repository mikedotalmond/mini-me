package mikedotalmond.site.minime.display;

import flash.display.BitmapData;
import flash.display.Sprite;
import nme.display.Bitmap;
import nme.Lib;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

@:final class HeadParts {
	
	
	public var container				:Sprite;
	
	public var body(default, null)		:Bitmap;
	public var mouth(default, null)		:Bitmap;
	public var leftBrow(default, null)	:Bitmap;
	public var rightBrow(default, null)	:Bitmap;
	public var leftEye(default, null)	:Bitmap;
	public var rightEye(default, null)	:Bitmap;
	
	
	/**
	 * 
	 * @param	container
	 */
	public function new(container:Sprite) {
		
		this.container = container;
		
		body = getBitmap("img/body.png", 37, 23, false);
		container.addChild(body);
		
		mouth = getBitmap("img/mouth.png", 157, 198.5);
		container.addChild(mouth);
		
		leftBrow = getBitmap("img/leftBrow.png", 103, 104);
		container.addChild(leftBrow);
		
		rightBrow = getBitmap("img/rightBrow.png", 186, 96.5);
		container.addChild(rightBrow);
		
		leftEye = getBitmap("img/leftEye.png", 104.5, 128.5);
		container.addChild(leftEye);
		
		rightEye = getBitmap("img/rightEye.png", 193, 122);
		container.addChild(rightEye);
	}
	
	
	/**
	 * 
	 * @param	asset path
	 * @param	x
	 * @param	y
	 * @param	?centre
	 * @return
	 */
	private function getBitmap(assetPath:String, x:Float, y:Float, ?centre:Bool=true):Bitmap {
	
		var bd	:BitmapData = nme.Assets.getBitmapData(assetPath);
		var bmp	:Bitmap 	= new Bitmap(bd);
		
		bmp.x = centre ? (-bd.width  / 2) + x : x;
		bmp.y = centre ? (-bd.height / 2) + y : y;
		
		return bmp;
	}
}