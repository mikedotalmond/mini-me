package mikedotalmond.site.minime;

import com.eclecticdesignstudio.motion.Actuate;
import com.eclecticdesignstudio.motion.easing.Bounce;
import com.eclecticdesignstudio.motion.easing.Sine;
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
				Actuate.tween(e.target, .045, { height:1.1 } ).delay(.1).repeat(1).reflect().ease(Sine.easeInOut);
				
				
			case headParts.leftEar:
				Actuate.tween(e.target, .20, { x:31 } ).delay(.1).repeat(1).reflect().ease(Sine.easeInOut);
				
			case headParts.rightEar:
				Actuate.tween(e.target, .20, { x:250 } ).delay(.1).repeat(1).reflect().ease(Sine.easeInOut);
				
				
			case headParts.leftBrow:
				Actuate.tween(e.target, .20, { y:100 } ).delay(.1).repeat(1).reflect().ease(Sine.easeInOut);
				
			case headParts.rightBrow:
				Actuate.tween(e.target, .20, { y:88 } ).delay(.1).repeat(1).reflect().ease(Sine.easeInOut);
		}
		
	}
}