package mikedotalmond.site.minime;

import com.eclecticdesignstudio.motion.Actuate;
import mikedotalmond.site.minime.display.HeadParts;
import nme.events.MouseEvent;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */
class Head {

	private var headParts:HeadParts;
	
	public function new(headParts:HeadParts) {
		this.headParts = headParts;
	}
	
	public function start() {
		headParts.container.addEventListener(MouseEvent.CLICK, onClick);
		
	}
	
	private function onClick(e:MouseEvent):Void {
		//trace(e, "info");
		
		// blink test
		switch(e.target) {
			case headParts.leftEye, headParts.rightEye:
				Actuate.tween(e.target, .04, { height:1.1 } ).delay(.1).repeat(1).reflect();
				
		}
		
	}
}