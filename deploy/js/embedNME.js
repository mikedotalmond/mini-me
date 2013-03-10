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
	/** default embed config **/
	defaultConfig = {
		name			: "nmeEmbedConfig-not-set", 
		width			: 960, 
		height			: 640, 
		assetRoot		: "./", 
		backgroundColour: "ffffff", 
		containerStyles	: "", 
		containerClass	: "",
		flash : {
			minVersion		: "10.3",
			wmode			: "direct",
			allowFullscreen	: true
		}
	},

	/**
	* Create and embed the Flash version
	*/
	doSWFEmbed = function(config){
		
		// create the container
		var container = '<div class="'+config.containerClass+'" id="' + config.name + 'Container" style="'+config.containerStyles+'width:'+config.width+'px;height:'+config.height+'px;"><div id="'+config.name+'"/></div>'; 
		w.document.write(container);
		
		var params = {
			menu				: "false",
			scale				: "noScale",
			wmode				: config.flash.wmode,
			bgcolor				:"#" + config.backgroundColour,
			allowScriptAccess	: "always",
			allowFullscreen		: config.flash.allowFullscreen
		};
		
		swfobject.embedSWF(
			config.assetRoot + "swf/"+config.name+".swf", 
			config.name, config.width+"px", config.height+"px", config.flash.minVersion, 
			null, config, params, { id:config.name, name:config.name }
		);
	},
	
	/**
	* Write the JS version to the the page...
	*/
	doJSEmbed = function(config){
		
		w.winParameters = function (){ return config; } // nme js uses this for Lib.current.loaderVars.parameters
		
		var src = 
		'<div class="'+config.containerClass+'" id="' + config.name + 'Container" style="'+config.containerStyles+'width:'+config.width+'px;height:'+config.height+'px;">' + 
			'<div id="haxe:jeash" style="background-color:#' + config.backgroundColour + '; width:' + config.width + 'px; height:' + config.height + 'px" data-framerate="60"></div>' +
			'<sc'+'ri'+'pt id="haxe:jeash:script" type="text/javascript" src="'+config.assetRoot+'js/' + config.name + '.min.js"></sc'+'ri'+'pt>' +
		'</div>';
			
		w.document.write(src);
	},
	
	/**
	* initialise
	*/
	init = function(config){
		
		if(typeof config === "undefined") { config = defaultConfig; }
		
		// use flash if it's available, 
		if(w.swfobject.hasFlashPlayerVersion(config.flash.minVersion)){
			doSWFEmbed(config);
		} else { // or js/html5 if not
			doJSEmbed(config);
		}
	};
	
	//
	init(w.nmeEmbedConfig);
	w.nmeEmbedConfig = null;
	
})(window);