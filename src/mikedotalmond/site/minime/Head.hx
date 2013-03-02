package mikedotalmond.site.minime;

import mikedotalmond.site.minime.display.HeadParts;

/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */
class Head {

	//private var eyes		:EyesController;
	//private var eyebrows	:EyebrowsController;
	//private var mouth		:MouthController;
	
	private var headParts	:HeadParts;
	
	public function new(headParts:HeadParts) {
		
		this.headParts 	= headParts;
		
		//eyes 			= new EyesController(headParts.leftEye, headParts.rightEye);
		//eyebrows 		= new EyebrowsController(headParts.leftBrow, headParts.rightBrow);
		//mouth 			= new MouthController(headParts.mouth);		
		
	}
	
	public function start() {
		
	}
}