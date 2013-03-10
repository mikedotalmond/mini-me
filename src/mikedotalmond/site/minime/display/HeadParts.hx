package mikedotalmond.site.minime.display;

import com.eclecticdesignstudio.motion.Actuate;
import nme.display.Bitmap;
import nme.display.BitmapData;
import nme.display.PixelSnapping;
import nme.display.Sprite;
import nme.events.MouseEvent;
import nme.Lib;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

@:final class HeadParts {
	
	
	public var parent(default, null)	:Sprite;
	public var container(default, null)	:Sprite;
	
	public var body(default, null)		:Sprite;
	public var mouth(default, null)		:Sprite;
	public var leftBrow(default, null)	:Sprite;
	public var rightBrow(default, null)	:Sprite;
	public var leftEye(default, null)	:Sprite;
	public var rightEye(default, null)	:Sprite;
	
	
	/**
	 * 
	 * @param	container
	 */
	public function new(parent:Sprite) {
		
		container = new Sprite();
		
		container.mouseEnabled = true;
		container.mouseChildren = true;
		
		body = getSprite("labs/minime/img/body.png", 37, 23, false);
		parent.addChild(body);
		
		mouth = getSprite("labs/minime/img/mouth.png", 157, 198.5);
		container.addChild(mouth);
		
		leftBrow = getSprite("labs/minime/img/leftBrow.png", 103, 104);
		container.addChild(leftBrow);
		
		rightBrow = getSprite("labs/minime/img/rightBrow.png", 186, 96.5);
		container.addChild(rightBrow);
		
		leftEye = getSprite("labs/minime/img/leftEye.png", 104.5, 128.5);
		container.addChild(leftEye);
		
		rightEye = getSprite("labs/minime/img/rightEye.png", 193, 122);
		container.addChild(rightEye);
		
		this.parent = parent;
		parent.addChild(container);		
	}
	
	
	/**
	 * 
	 * @param	asset path
	 * @param	x
	 * @param	y
	 * @param	?centre
	 * @return
	 */
	private function getSprite(assetPath:String, x:Float, y:Float, ?centre:Bool=true):Sprite {
	
		var bd	:BitmapData = nme.Assets.getBitmapData(assetPath);
		var bmp	:Bitmap 	= new Bitmap(bd, PixelSnapping.AUTO, true);
		
		bmp.x = centre ? (-bd.width  / 2) : 0;
		bmp.y = centre ? (-bd.height / 2) : 0;
		
		var spr = new Sprite();
		spr.addChild(bmp);
		spr.mouseChildren = false;
		
		spr.x = x;
		spr.y = y;
		
		return spr;
	}
}