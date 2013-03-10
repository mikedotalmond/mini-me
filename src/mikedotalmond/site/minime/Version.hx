/**
 * ...
 * @author Mike Almond - https://github.com/mikedotalmond
 */

package mikedotalmond.site.minime;

@:final class Version {
	
	static public inline var Major:Int = 0;
	static public inline var Minor:Int = 0;
	static public inline var Build:Int = 46122;
	static public inline var Revision:Int = 126;
	
	#if flash
	static public inline var Platform:String = "Flash";
	#elseif html5
	static public inline var Platform:String = "HTML5";
	#else
	static public inline var Platform:String = "Selected target-platform is not tested";
	#end
	
	static public inline function toString():String {
		#if debug
		return "[" + Platform + "] " + Major + "." + Minor + "." + Build + " r" + Revision + " debug";
		#else
		return "[" + Platform + "] " + Major + "." + Minor + "." + Build + " r" + Revision;
		#end
	}
}