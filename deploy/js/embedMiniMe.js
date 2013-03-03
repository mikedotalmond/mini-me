/**
 * Embed script for NME authored content targetting Flash and HTML5 targets
 * 
 * Will use Flash where available, HTML5 everywhere else.
 * 
 * @author Mike Almond - https://github.com/mikedotalmond
 */

(function(w) {
	"use strict";

	var 
	/**
	* Create and embed the Flash version
	*/
	doSWFEmbed = function(projectName, config){
		
		// create the container
		w.document.write('<div id="' + projectName + 'Container"><div id="' + projectName + '"></div>');
		
		var params = {
			menu: "false",
			scale: "noScale",
			allowScriptAccess: "always",
			wmode: "opaque",
			bgcolor:"#"+config.backgroundColour
		};
		swfobject.embedSWF(
			"swf/"+projectName+".swf", 
			projectName, config.width+"px", config.height+"px", "10.3.0", 
			null, config, params, { id:projectName, name:projectName }
		);
	},
	
	/**
	* Write the JS version to the the page...
	*/
	doJSEmbed = function(projectName, config){
		
		w.winParameters = function (){ return config; } // nme js uses this for Lib.current.loaderVars.parameters
		
		var src = 
		'<div id="' + projectName + 'Container">' + 
			'<div id="haxe:jeash" style="background-color:#' + config.backgroundColour + '; width:' + config.width + 'px; height:' + config.height + 'px" data-framerate="60"></div>' +
			'<sc'+'ri'+'pt id="haxe:jeash:script" type="text/javascript" src="js/' + projectName + '.min.js"></sc'+'ri'+'pt>' +
		'</div>';
			
		w.document.write(src);
	},
	
	/**
	* initialise
	*/
	init = function(config){
		
		var
		projectName		= config.projectName,
		playerVersion 	= w.swfobject.getFlashPlayerVersion(),
		majorVersion 	= playerVersion.major,
		minorVersion 	= playerVersion.minor;
		
		// use flash if it's available, 
		if(majorVersion > 10 || (majorVersion>=10 && minorVersion >= 3)){ // 10.3 minimum...
			doSWFEmbed(projectName, config);
		} else { // or js/html5 if not
			doJSEmbed(projectName, config);
		}
		
		//return w.document.getElementById(projectName + "Container");
	};
	
	//
	init({projectName:"minime", width:300, height:300, backgroundColour:"F0DF69"});
	
})(window);