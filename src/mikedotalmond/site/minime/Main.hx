package mikedotalmond.site.minime;

import haxe.Timer;

import mikedotalmond.site.minime.display.HeadParts;

import nme.display.Bitmap;
import nme.display.Sprite;
import nme.events.Event;
import nme.external.ExternalInterface;
import nme.Lib;

	
import com.eclecticdesignstudio.motion.Actuate;
	
/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

class Main extends Sprite {
	
	var inited:Bool;
	
	private var head:Head;

	/* ENTRY POINT */
	
	function resize(e) {
		if (!inited) init();
		// else (resize or orientation change)
	}
	
	function init() {
		if (inited) return;
		inited = true;
		
		trace("[minime] " + Version.toString());
		
		head = new Head(new HeadParts(this));
		
		Actuate.tween(this, .5, { alpha:1 } ).delay(.25).onComplete(start);
	}
	
	
	private function start():Void {
		head.start();
	}
	

	/* SETUP */

	public function new() {
		super();	
		alpha = 0;
		addEventListener(Event.ADDED_TO_STAGE, added);
	}

	function added(e) {
		removeEventListener(Event.ADDED_TO_STAGE, added);
		stage.addEventListener(Event.RESIZE, resize);
		
		#if ios
		haxe.Timer.delay(init, 100); // iOS 6
		#else
		init();
		#end
	}
	
	public static function main() {
		// static entry point
		Lib.current.stage.align = nme.display.StageAlign.TOP_LEFT;
		Lib.current.stage.scaleMode = nme.display.StageScaleMode.NO_SCALE;
		Lib.current.addChild(new Main());
	}
}
