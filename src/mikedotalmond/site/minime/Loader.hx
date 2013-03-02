package mikedotalmond.site.minime;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

 /**
  * Custom NMEPreloader with no visble components...
  */
@:final class Loader extends NMEPreloader{

	public function new() {
		super();
		visible = false;
	}
	
	override public function onUpdate(bytesLoaded:Int, bytesTotal:Int):Dynamic {
		//super.onUpdate(bytesLoaded, bytesTotal);
	}
	
	override public function onLoaded():Dynamic {
		super.onLoaded();
		visible = true;
	}
	
}