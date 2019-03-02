package questions;

using StringTools;

enum TLibraries
{
	Hxcpp;
	Hxcs;
	Openfl;
	Lime;
	Actuate;
	Haxeui;
	HaxePunk;
	HaxeFlixel;
	Kha;
	Heaps;
	Tink;
	PixiJS;
	Thx;
	Utest;
	Hxnodejs;
	Electron;
	Dox;
	RecordMacros;
	JQuery;
	HScript;
	Format;
	FormatTiled;
	Hxparse;
	Polygonal;
	Away3D;
	Munit;
	SmartFox;
	MSignal;
	Minject;
	Jsprop;
	AdvancedLayout;
	Priori;
	Ash;
	Systools;
	HxMake;
	DBAdmin;
	HtmlParser;
	Profiler;
	Monsoon;
	Sugoi;
	Creates;
	Hamcrest;
	Buddy;
	Mockatoo;
	MCover;
	HowlerJS;
	Crashdumper;
	Firetongue;
	Castle;
	Coconut;
	Checkstyle;
	Doom;
	Framework7;
	HaxeJSKit;
	Hexmachina;
	HxBolts;
	HxString;
	UFront;
	HaxeModular;
	HaxeWebpack;
	As3hx;
	AsyncTools;
	Asys;
	Box2D;
	CleverSort;
	CompileTime;
	Detox;
	Erazor;
	Express;
	ExtensionLocale;
	Feffects;
	Glory;
	Gsap;
	HaxeGA;
	HaxeWebsocketRemoting;
	HaxeWS;
	HxLibc;
	HxTools;
	JsonRpc;
	JStack;
	Keybinding;
	Layout;
	Linc;
	LogShim;
	Markdown;
	MCli;
	MConsole;
	Mime;
	Modular;
	MonsterDebugger;
	MTwin;
	NodeWebkit;
	NodeJS;
	ObjectInit;
	PromHx;
	PureMvc;
	PushState;
	Random;
	Redux;
	Refactor;
	SelectHxml;
	ShaderBlox;
	SkylarkUI;
	SmtpMailer;
	SourceMap;
	Svg;
	Swf;
	ThreeJS;
	Unknown;
	Websocket;
	Pony;
	HxBit;
	HxTelemetry;
	Luxe;
	Vuehx;
	Bindings;
	Phaser;
	DConsole;
	Arguable;
	Flambe;
	Nape;
	Kit2D; // 2DKit
	Starling;
	Tweenx;
	Mmvc;
	ByteConvert;
	Docopt;
	Slambda;
	StablexUI;
	React;
	Cannonml;
	HaxeKiwi;
	Robotlegs;
	SpriterHaxeEngine;
	Json2Object;
	Mphx;
	Task;
	Mlib;
	HxcppDebugger;
	HxYaml;
	Hml;
	Bindx2;
	Dragonbones;
	Feathers;
	Mloader;
	AndroidSupportV4;
	GooglePlayGames;
	Datetime;
	Easylog;
	Mohxa;
	MsgPackHaxe;
	HeadButt;
	Glm;
	Math;
	Unifill;
	Ceramic;
	HxAssert;
	Haxegon;
	HxMustache;
	Nme;
	Exception;
	Pako;
	ScreenManager;
	Steamwrap;
	HxInflate;
	BitmapFont;
	ZameParticles;
	Mtprng;
	HxSignal;
	Xt3d;
	Farcek;
	Hmm;
	Greensock;
	DatGui;
	Air3;
	Ansi;
	CanvasMarkdown;
	Fracs;
	Gm2D;
	HashLink;
	Haxelow;
	HtmlHelper;
	HxArgs;
	HxDaedalus;
	HxJava;
	HxPixel;
	HxPolyK;
	Hxsl;
	HxSpiro;
	Jasper;
	Triangulation;
	Just;
	KScenes;
	LSystem;
	Nodule;
	Poly2Trihx;
	StbOggSound;
	TJson;
	Trilateral;
	Unity3D;
	Waxe;
	Yagp;
	Rxjs;
	DataClass;
	Niik;
	Armory3D;
	Nice;
	Elixir;
	Rebar3;
	Jsx;
	Zui;
	HaxeLoader;
	Sdl;
	Unicode;
	CodeGen;
	PerfJS;
	Formula;
	WhatFormat;
	OpenGL;
	HxIni;
	Continuation;
	Babylonhx;
	B2d;
	Socket;
	Mysql;
	Sqlite;
}

class Libraries
{
	public static function parse(value:String) : Array<TLibraries>
	{
		var v = value.replace(",", " ").replace("  ", " ").replace(" ", ";").replace(";;", ";").split(";").map(parseSingleValue).filter(f -> f != null);
		var set = new Map<TLibraries, Bool>();

		for (k in v)
		{
			set[k] = true;
		}

		var aset = [];

		for (k in set.keys())
		{
			aset.push(k);
		}

		return aset;
	}

	static function parseSingleValue(value:String) : TLibraries
	{
		return switch (value)
		{
			case "hxcpp", "Hxcpp": Hxcpp;
			case "hxcs", "Hxcs": Hxcs;
			case "openfl", "Openfl", "OpenFL", "OpenFl", "openfl-bitfive", "openfl-html5", "openfl-html5-dom", "openfl-native", "openfl-samples", "openFL", "openfl-xinput", "onpenfl", "OpenFL?": Openfl;
			case "lime", "Lime", "lime-samples", "lime-tools": Lime;
			case "actuate", "Actuate", "acutate": Actuate;
			case "haxeui-core", "haxeui-openfl", "HaxeUI", "haxeui", "component-examples", "haxeui-builder", "haxeui-file-dialogs", "haxeui-hxwidgets", "haxeui-rich-text", "haxeui-templates", "hxWidgets", "haxe-ui", "Haxeui": Haxeui;
			case "HaxePunk", "haxepunk", "Haxepunk": HaxePunk;
			case "Haxeflixel", "haxeflixel", "flixel", "flixel-ui", "HaxeFlixel", "flixel-addons", "flixel-tools", "Flixel", "FlxScrollableArea", "flixelclearlibs": HaxeFlixel;
			case "Kha", "kha": Kha;
			case "Heaps", "heaps", "heaps.io", "heap": Heaps;
			case "tink_state", "tink", "tink_*", "tink(s)", "Tink", "tink_await", "tink_core", "tink_io", "tink_macro", "tink_priority", "tink_streams", "tink_syntaxhub", "tink*", "tinkerbell", "tink_web", "tink_stringly", "tink_url", "tink_cli", "haxetink": Tink;
			case "pixijs", "PixiJS", "pixi", "pixi-haxe", "Pixi", "Pixijs": PixiJS;
			case "thx.core", "thx", "Thx": Thx;
			case "utest", "Utest": Utest;
			case "hxnodejs", "Hxnodejs", "node": Hxnodejs;
			case "electron", "hxelectron", "Electron": Electron;
			case "dox", "dox-skillz", "Dox": Dox;
			case "record-macros", "RecordMacros": RecordMacros;
			case "jQueryExtern", "jquery", "JQuery": JQuery;
			case "hscript", "Hscript", "HScript": HScript;
			case "format", "format_", "Format": Format;
			case "format-tiled", "FormatTiled": FormatTiled;
			case "hxparse", "Hxparse": Hxparse;
			case "polygonal-ds", "polygonal-printf", "polygonal-ai", "polygonal-core", "polygonal-gl", "polygonal-motor", "polygonal-native", "polygonal-ui", "polygonal", "polygonal.ds", "Polygonal": Polygonal;
			case "Away3D", "away3d", "Away3d": Away3D;
			case "munit", "Munit": Munit;
			case "smartfox-haxe-client", "SmartFoxServer", "SmartFox": SmartFox;
			case "msignal", "MSignal": MSignal;
			case "minject", "MInject", "Minject": Minject;
			case "jsprop", "Jsprop": Jsprop;
			case "advanced-layout", "AdvanceLayout", "AdvancedLayout": AdvancedLayout;
			case "Priori": Priori;
			case "Ash", "Ash-HaXe", "ash-haxe", "ash": Ash;
			case "systools", "Systools": Systools;
			case "hxmake", "HxMake": HxMake;
			case "dbadmin", "DBAdmin": DBAdmin;
			case "HtmlParser": HtmlParser;
			case "profiler", "Profiler": Profiler;
			case "monsoon", "Monsoon": Monsoon;
			case "sugoi", "Sugoi": Sugoi;
			case "creates", "Creates": Creates;
			case "hamcrest", "Hamcrest": Hamcrest;
			case "Buddy", "buddy": Buddy;
			case "Mockatoo", "mockatoo": Mockatoo;
			case "MCover", "mcover": MCover;
			case "HowlerJS", "howlerjs": HowlerJS;
			case "firetongue", "Firetongue": Firetongue;
			case "crashdumper", "CrashDumper", "Crashdumper": Crashdumper;
			case "castle", "Castle", "CastleDB.": Castle;
			case "coconut.*", "coconut_mvc", "coconut", "Coconut": Coconut;
			case "checkstyle", "haxe-checkstyle", "Checkstyle": Checkstyle;
			case "doom", "Doom": Doom;
			case "framework7", "Framework7": Framework7;
			case "haxe-js-kit", "js-kit", "HaxeJSKit": HaxeJSKit;
			case "hexmachina", "hexMachina", "hexUnit", "Hexmachina": Hexmachina;
			case "hxbolts", "HxBolts": HxBolts;
			case "Hx-strings", "HxString": HxString;
			case "ufront", "ufront-client", "ufront-easyauth", "ufront-mail", "ufront-mvc", "ufront-orm", "ufront-ufadmin", "ufront-uftasks", "UFront": UFront;
			case "haxe-modular", "HaxeModular": HaxeModular;
			case "haxe-webpack", "webpack", "HaxeWebpack": HaxeWebpack;
			case "as3hx", "As3hx": As3hx;
			case "asynctools", "AsyncTools": AsyncTools;
			case "asys", "Asys": Asys;
			case "box2d", "Box2D": Box2D;
			case "cleversort", "CleverSort": CleverSort;
			case "compiletime", "CompileTime": CompileTime;
			case "detox", "Detox": Detox;
			case "erazor", "Erazor": Erazor;
			case "express", "Express": Express;
			case "extension-locale", "ExtensionLocale": ExtensionLocale;
			case "feffects", "Feffects": Feffects;
			case "glory", "Glory": Glory;
			case "gsap", "gsapi", "Gsap": Gsap;
			case "haxe-ga", "HaxeGA": HaxeGA;
			case "haxe-websocket-remoting", "HaxeWebsocketRemoting": HaxeWebsocketRemoting;
			case "haxe-ws", "HaxeWS": HaxeWS;
			case "haxelib_client": null; // ignore haxelib itself
			case "hxlibc", "HxLibc": HxLibc;
			case "hxtools", "HxTools": HxTools;
			case "json-rpc", "JsonRpc": JsonRpc;
			case "jstack", "JStack": JStack;
			case "keybinding", "Keybinding": Keybinding;
			case "layout", "Layout": Layout;
			case "linc_ogg", "linc_openal", "linc_opengl", "linc_sdl", "linc_stb", "linc_timestamp", "linc_*", "linc", "Linc": Linc;
			case "logshim", "LogShim": LogShim;
			case "markdown", "Markdown": Markdown;
			case "mcli", "MCli": MCli;
			case "mconsole", "MConsole": MConsole;
			case "mime", "Mime": Mime;
			case "modular", "Modular": Modular;
			case "monsterdebugger", "MonsterDebugger": MonsterDebugger;
			case "mtwin", "MTwin": MTwin;
			case "node-webkit", "NodeWebkit": NodeWebkit;
			case "nodejs", "Nodejs", "NodeJS": NodeJS;
			case "objectinit", "ObjectInit": ObjectInit;
			case "promhx", "promhx-unit-test", "PromHx": PromHx;
			case "puremvc-asynccommand-multicore", "puremvc-asynccommand-standard", "puremvc-multicore", "puremvc-pipes", "puremvc-standard", "puremvc-statemachine-multicore", "puremvc-statemachine-standard", "puremvc-undo-multicore", "PureMVC", "PureMvc": PureMvc;
			case "pushstate", "PushState": PushState;
			case "random", "Random": Random;
			case "redux", "Redux": Redux;
			case "refactor", "Refactor": Refactor;
			case "selecthxml", "SelectHxml": SelectHxml;
			case "shaderblox", "ShaderBlox": ShaderBlox;
			case "skylark-ui", "SkylarkUI": SkylarkUI;
			case "smtpmailer", "SmtpMailer": SmtpMailer;
			case "sourcemap", "SourceMap": SourceMap;
			case "svg", "Svg": Svg;
			case "swf", "swflib", "Swf": Swf;
			case "threejs", "treejs", "three.js", "ThreeJS": ThreeJS;
			case "unknown", "Unknown": Unknown;
			case "websocket", "Websocket": Websocket;
			case "Pony": Pony;
			case "hxbit", "HxBit": HxBit;
			case "hxtelemetry", "HxTelemetry": HxTelemetry;
			case "Luxe", "snow", "luxe", "flow", "flow_", "flowOld", "snowfall", "Snowkit", "snowflake": Luxe;
			case "Vuehx", "vue.js": Vuehx;
			case "bindings", "Bindings": Bindings;
			case "Phaser": Phaser;
			case "dconsole", "DConsole": DConsole;
			case "arguable", "Arguable": Arguable;
			case "Flambé", "flambe", "flump", "openflump", "Flambe": Flambe;
			case "Nape", "nape": Nape;
			case "2DKit", "Kit2D": Kit2D;
			case "Starling", "starling", "haxe-starling": Starling;
			case "tweenxcore", "tweenx", "TweenX", "Tweenx": Tweenx;
			case "mmvc", "Mmvc": Mmvc;
			case "byteconvert", "ByteConvert": ByteConvert;
			case "docopt", "Docopt": Docopt;
			case "slambda", "Slambda": Slambda;
			case "StablexUI", "stablexui": StablexUI;
			case "react", "React-Native", "haxe-react", "React", "haxe-react-native": React;
			case "cannonml", "Cannonml": Cannonml;
			case "haxe-kiwi", "HaxeKiwi": HaxeKiwi;
			case "Robotlegs", "robotlegs": Robotlegs;
			case "SpriterHaxeEngine": SpriterHaxeEngine;
			case "json2object", "Json2Object": Json2Object;
			case "MPHX", "Mphx": Mphx;
			case "task", "Task": Task;
			case "mlib", "Mlib": Mlib;
			case "hxcpp-debugger", "HxcppDebugger": HxcppDebugger;
			case "hx-yaml", "yaml", "HxYaml": HxYaml;
			case "hml", "Hml": Hml;
			case "bindx2", "Bindx2": Bindx2;
			case "dragonbones", "Dragonbones": Dragonbones;
			case "feathers", "Feathers": Feathers;
			case "mloader", "Mloader": Mloader;
			case "extension-android-support-v4", "AndroidSupportV4": AndroidSupportV4;
			case "extension-googleplaygames", "GooglePlayGames": GooglePlayGames;
			case "datetime", "Datetime": Datetime;
			case "easylog", "Easylog": Easylog;
			case "mohxa", "Mohxa": Mohxa;
			case "msgpack-haxe", "MsgPackHaxe": MsgPackHaxe;
			case "headbutt", "HeadButt": HeadButt;
			case "glm", "Glm": Glm;
			case "Math", "khaMath": Math;
			case "unifill", "Unifill": Unifill;
			case "ceramic...", "Ceramic": Ceramic;
			case "hxassert", "HxAssert": HxAssert;
			case "haxegon", "Haxegon": Haxegon;
			case "hxmustache", "HxMustache": HxMustache;
			case "nme", "acadnme", "nme-dev", "nme-toolkit", "Nme": Nme;
			case "exception", "Exception": Exception;
			case "pako", "Pako": Pako;
			case "screen-manager", "ScreenManager": ScreenManager;
			case "Steamwrap", "SteamWrap": Steamwrap;
			case "hxInflate", "HxInflate": HxInflate;
			case "bitmapFont", "BitmapFont": BitmapFont;
			case "zame-particles", "ZameParticles": ZameParticles;
			case "mtprng", "Mtprng": Mtprng;
			case "hxsignal", "HxSignal": HxSignal;
			case "https://github.com/stuartcaunt/xt3d", "Xt3d": Xt3d;
			case "farcek", "Farcek": Farcek;
			case "hmm", "Hmm": Hmm;
			case "greensock", "Greensock": Greensock;
			case "dat.gui", "DatGui": DatGui;
			case "air3", "Air3": Air3;
			case "ansi", "Ansi": Ansi;
			case "canvasMarkdown", "CanvasMarkdown": CanvasMarkdown;
			case "fracs", "fracs_", "Fracs": Fracs;
			case "gm2d", "Gm2D": Gm2D;
			case "hashlink", "hlopenal", "hlsdl", "hldx", "hl", "HashLink": HashLink;
			case "haxelow", "Haxelow": Haxelow;
			case "htmlHelper", "HtmlHelper": HtmlHelper;
			case "hxargs", "HxArgs": HxArgs;
			case "hxDaedalus", "HxDaedalus": HxDaedalus;
			case "hxjava", "HxJava": HxJava;
			case "hxPixel", "hxPixels", "HxPixel": HxPixel;
			case "hxPolyK", "HxPolyK": HxPolyK;
			case "hxsl", "Hxsl": Hxsl;
			case "hxSpiro", "hxSpiroDemo", "HxSpiro": HxSpiro;
			case "jasper", "Jasper": Jasper;
			case "jsTriangluationsReference", "jsTriangulationsReference", "triangulations", "triangulationsWebGLtest", "Triangulation": Triangulation;
			case "justDrawing", "justPath", "justTriangles", "justTrianglesFlambe", "justTrianglesNoPoint", "justTrianglesWebGL", "Just": Just;
			case "kScenes", "KScenes": KScenes;
			case "L-System", "LSystem": LSystem;
			case "Nodule": Nodule;
			case "poly2trihx", "Poly2Trihx": Poly2Trihx;
			case "stb_ogg_sound", "StbOggSound": StbOggSound;
			case "tjson", "TJson": TJson;
			case "trilateral", "trilateralXtra", "Trilateral": Trilateral;
			case "unity3d", "Unity3D": Unity3D;
			case "waxe", "waxe-works", "Waxe": Waxe;
			case "yagp", "Yagp": Yagp;
			case "rxjs", "Rxjs": Rxjs;
			case "DataClass": DataClass;
			case "Niik": Niik;
			case "armory3d", "iron", "Armory", "Iron", "Armory3D": Armory3D;
			case "nice", "Nice": Nice;
			case "Elixir": Elixir;
			case "Rebar3": Rebar3;
			case "JSX", "Jsx": Jsx;
			case "zui", "Zui": Zui;
			case "haxe-loader", "HaxeLoader": HaxeLoader;
			case "sdl", "Sdl": Sdl;
			case "unicode", "Unicode": Unicode;
			case "codegen", "CodeGen": CodeGen;
			case "perf.js", "PerfJS": PerfJS;
			case "formula", "Formula": Formula;
			case "whatformat", "WhatFormat": WhatFormat;
			case "OpenGL": OpenGL;
			case "hxini", "HxIni": HxIni;
			case "continuation", "Continuation": Continuation;
			case "babylonhx", "Babylonhx": Babylonhx;
			case "b2d", "B2d": B2d;
			case "Socket": Socket;
			case "mysql", "Mysql": Mysql;
			case "Sqlite": Sqlite;
			case "", "...", "etc...", "own", "fork", "Too", "many", "to", "list.", "A", "few", "dozens", "but", "i", "plan", "on", "learning", "Mostly", "with", "lib", "(sadly", "unmainainted)", "libs", "and", "three", "js", "core", "ds", "None", "yet.", "std", "others", "2X", "Haxe", "client", "API", "Proprietary", "information.", "Self", "written", "system", "lots", "of", "internal", "all", "the", "stuff", "+", "is", "most", "common", "Extern", "JS", "externs", "(which", "should", "really", "be", "adopted", "by", "foundation", "mantained", "a", "life-saver", "overall", "much", "better", "than", "what", "stdlib", "offers)", "mostly", "lot", "as", "need", "arises", "default", "pachage", "I", "am", "trying", "some", "Sys", "only", "associated", "addons", "custom", "made", "yet", "Standard", "(=google", "analytics)", "mainly", "etc", "suite", "none", "runtime", "&", "my", "own(clay", "sparkler)", "All", "etc.", "for", "framework", "libraries", "almost", "every", "project", "personal", "library", "Probably", "going", "use", "Not", "sure", "other", "frameworks", "I'll", "use.", "N/A", "more", "php": null;
			default: throw 'Unknown Libraries value "${value}"';
		}
	}

	public static function toString(value:Array<TLibraries>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TLibraries) : String
	{
		return switch (value)
		{
			case Hxcpp: "Hxcpp";
			case Hxcs: "Hxcs";
			case Openfl: "Openfl";
			case Lime: "Lime";
			case Actuate: "Actuate";
			case Haxeui: "Haxeui";
			case HaxePunk: "HaxePunk";
			case HaxeFlixel: "HaxeFlixel";
			case Kha: "Kha";
			case Heaps: "Heaps";
			case Tink: "Tink";
			case PixiJS: "PixiJS";
			case Thx: "Thx";
			case Utest: "Utest";
			case Hxnodejs: "Hxnodejs";
			case Electron: "Electron";
			case Dox: "Dox";
			case RecordMacros: "RecordMacros";
			case JQuery: "JQuery";
			case HScript: "HScript";
			case Format: "Format";
			case FormatTiled: "FormatTiled";
			case Hxparse: "Hxparse";
			case Polygonal: "Polygonal";
			case Away3D: "Away3D";
			case Munit: "Munit";
			case SmartFox: "SmartFox";
			case MSignal: "MSignal";
			case Minject: "Minject";
			case Jsprop: "Jsprop";
			case AdvancedLayout: "AdvancedLayout";
			case Priori: "Priori";
			case Ash: "Ash";
			case Systools: "Systools";
			case HxMake: "HxMake";
			case DBAdmin: "DBAdmin";
			case HtmlParser: "HtmlParser";
			case Profiler: "Profiler";
			case Monsoon: "Monsoon";
			case Sugoi: "Sugoi";
			case Creates: "Creates";
			case Hamcrest: "Hamcrest";
			case Buddy: "Buddy";
			case Mockatoo: "Mockatoo";
			case MCover: "MCover";
			case HowlerJS: "HowlerJS";
			case Crashdumper: "Crashdumper";
			case Firetongue: "Firetongue";
			case Castle: "Castle";
			case Coconut: "Coconut";
			case Checkstyle: "Checkstyle";
			case Doom: "Doom";
			case Framework7: "Framework7";
			case HaxeJSKit: "HaxeJSKit";
			case Hexmachina: "Hexmachina";
			case HxBolts: "HxBolts";
			case HxString: "HxString";
			case UFront: "UFront";
			case HaxeModular: "HaxeModular";
			case HaxeWebpack: "HaxeWebpack";
			case As3hx: "As3hx";
			case AsyncTools: "AsyncTools";
			case Asys: "Asys";
			case Box2D: "Box2D";
			case CleverSort: "CleverSort";
			case CompileTime: "CompileTime";
			case Detox: "Detox";
			case Erazor: "Erazor";
			case Express: "Express";
			case ExtensionLocale: "ExtensionLocale";
			case Feffects: "Feffects";
			case Glory: "Glory";
			case Gsap: "Gsap";
			case HaxeGA: "HaxeGA";
			case HaxeWebsocketRemoting: "HaxeWebsocketRemoting";
			case HaxeWS: "HaxeWS";
			case HxLibc: "HxLibc";
			case HxTools: "HxTools";
			case JsonRpc: "JsonRpc";
			case JStack: "JStack";
			case Keybinding: "Keybinding";
			case Layout: "Layout";
			case Linc: "Linc";
			case LogShim: "LogShim";
			case Markdown: "Markdown";
			case MCli: "MCli";
			case MConsole: "MConsole";
			case Mime: "Mime";
			case Modular: "Modular";
			case MonsterDebugger: "MonsterDebugger";
			case MTwin: "MTwin";
			case NodeWebkit: "NodeWebkit";
			case NodeJS: "NodeJS";
			case ObjectInit: "ObjectInit";
			case PromHx: "PromHx";
			case PureMvc: "PureMvc";
			case PushState: "PushState";
			case Random: "Random";
			case Redux: "Redux";
			case Refactor: "Refactor";
			case SelectHxml: "SelectHxml";
			case ShaderBlox: "ShaderBlox";
			case SkylarkUI: "SkylarkUI";
			case SmtpMailer: "SmtpMailer";
			case SourceMap: "SourceMap";
			case Svg: "Svg";
			case Swf: "Swf";
			case ThreeJS: "ThreeJS";
			case Unknown: "Unknown";
			case Websocket: "Websocket";
			case Pony: "Pony";
			case HxBit: "HxBit";
			case HxTelemetry: "HxTelemetry";
			case Luxe: "Luxe";
			case Vuehx: "Vuehx";
			case Bindings: "Bindings";
			case Phaser: "Phaser";
			case DConsole: "DConsole";
			case Arguable: "Arguable";
			case Flambe: "Flambe";
			case Nape: "Nape";
			case Kit2D: "Kit2D";
			case Starling: "Starling";
			case Tweenx: "Tweenx";
			case Mmvc: "Mmvc";
			case ByteConvert: "ByteConvert";
			case Docopt: "Docopt";
			case Slambda: "Slambda";
			case StablexUI: "StablexUI";
			case React: "React";
			case Cannonml: "Cannonml";
			case HaxeKiwi: "HaxeKiwi";
			case Robotlegs: "Robotlegs";
			case SpriterHaxeEngine: "SpriterHaxeEngine";
			case Json2Object: "Json2Object";
			case Mphx: "Mphx";
			case Task: "Task";
			case Mlib: "Mlib";
			case HxcppDebugger: "HxcppDebugger";
			case HxYaml: "HxYaml";
			case Hml: "Hml";
			case Bindx2: "Bindx2";
			case Dragonbones: "Dragonbones";
			case Feathers: "Feathers";
			case Mloader: "Mloader";
			case AndroidSupportV4: "AndroidSupportV4";
			case GooglePlayGames: "GooglePlayGames";
			case Datetime: "Datetime";
			case Easylog: "Easylog";
			case Mohxa: "Mohxa";
			case MsgPackHaxe: "MsgPackHaxe";
			case HeadButt: "HeadButt";
			case Glm: "Glm";
			case Math: "Math";
			case Unifill: "Unifill";
			case Ceramic: "Ceramic";
			case HxAssert: "HxAssert";
			case Haxegon: "Haxegon";
			case HxMustache: "HxMustache";
			case Nme: "Nme";
			case Exception: "Exception";
			case Pako: "Pako";
			case ScreenManager: "ScreenManager";
			case Steamwrap: "Steamwrap";
			case HxInflate: "HxInflate";
			case BitmapFont: "BitmapFont";
			case ZameParticles: "ZameParticles";
			case Mtprng: "Mtprng";
			case HxSignal: "HxSignal";
			case Xt3d: "Xt3d";
			case Farcek: "Farcek";
			case Hmm: "Hmm";
			case Greensock: "Greensock";
			case DatGui: "DatGui";
			case Air3: "Air3";
			case Ansi: "Ansi";
			case CanvasMarkdown: "CanvasMarkdown";
			case Fracs: "Fracs";
			case Gm2D: "Gm2D";
			case HashLink: "HashLink";
			case Haxelow: "Haxelow";
			case HtmlHelper: "HtmlHelper";
			case HxArgs: "HxArgs";
			case HxDaedalus: "HxDaedalus";
			case HxJava: "HxJava";
			case HxPixel: "HxPixel";
			case HxPolyK: "HxPolyK";
			case Hxsl: "Hxsl";
			case HxSpiro: "HxSpiro";
			case Jasper: "Jasper";
			case Triangulation: "Triangulation";
			case Just: "Just";
			case KScenes: "KScenes";
			case LSystem: "LSystem";
			case Nodule: "Nodule";
			case Poly2Trihx: "Poly2Trihx";
			case StbOggSound: "StbOggSound";
			case TJson: "TJson";
			case Trilateral: "Trilateral";
			case Unity3D: "Unity3D";
			case Waxe: "Waxe";
			case Yagp: "Yagp";
			case Rxjs: "Rxjs";
			case DataClass: "DataClass";
			case Niik: "Niik";
			case Armory3D: "Armory3D";
			case Nice: "Nice";
			case Elixir: "Elixir";
			case Rebar3: "Rebar3";
			case Jsx: "Jsx";
			case Zui: "Zui";
			case HaxeLoader: "HaxeLoader";
			case Sdl: "Sdl";
			case Unicode: "Unicode";
			case CodeGen: "CodeGen";
			case PerfJS: "PerfJS";
			case Formula: "Formula";
			case WhatFormat: "WhatFormat";
			case OpenGL: "OpenGL";
			case HxIni: "HxIni";
			case Continuation: "Continuation";
			case Babylonhx: "Babylonhx";
			case B2d: "B2d";
			case Socket: "Socket";
			case Mysql: "Mysql";
			case Sqlite: "Sqlite";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		var count = { hxcpp: 0, hxcs: 0, openfl: 0, lime: 0, actuate: 0, haxeui: 0, haxepunk: 0, haxeflixel: 0, kha: 0, heaps: 0, tink: 0, pixijs: 0, thx: 0, utest: 0, hxnodejs: 0, electron: 0, dox: 0, recordmacros: 0, jquery: 0, hscript: 0, format: 0, formattiled: 0, hxparse: 0, polygonal: 0, away3d: 0, munit: 0, smartfox: 0, msignal: 0, minject: 0, jsprop: 0, advancedlayout: 0, priori: 0, ash: 0, systools: 0, hxmake: 0, dbadmin: 0, htmlparser: 0, profiler: 0, monsoon: 0, sugoi: 0, creates: 0, hamcrest: 0, buddy: 0, mockatoo: 0, mcover: 0, howlerjs: 0, crashdumper: 0, firetongue: 0, castle: 0, coconut: 0, checkstyle: 0, doom: 0, framework7: 0, haxejskit: 0, hexmachina: 0, hxbolts: 0, hxstring: 0, ufront: 0, haxemodular: 0, haxewebpack: 0, as3hx: 0, asynctools: 0, asys: 0, box2d: 0, cleversort: 0, compiletime: 0, detox: 0, erazor: 0, express: 0, extensionlocale: 0, feffects: 0, glory: 0, gsap: 0, haxega: 0, haxewebsocketremoting: 0, haxews: 0, hxlibc: 0, hxtools: 0, jsonrpc: 0, jstack: 0, keybinding: 0, layout: 0, linc: 0, logshim: 0, markdown: 0, mcli: 0, mconsole: 0, mime: 0, modular: 0, monsterdebugger: 0, mtwin: 0, nodewebkit: 0, nodejs: 0, objectinit: 0, promhx: 0, puremvc: 0, pushstate: 0, random: 0, redux: 0, refactor: 0, selecthxml: 0, shaderblox: 0, skylarkui: 0, smtpmailer: 0, sourcemap: 0, svg: 0, swf: 0, threejs: 0, unknown: 0, websocket: 0, pony: 0, hxbit: 0, hxtelemetry: 0, luxe: 0, vuehx: 0, bindings: 0, phaser: 0, dconsole: 0, arguable: 0, flambe: 0, nape: 0, kit2d: 0, starling: 0, tweenx: 0, mmvc: 0, byteconvert: 0, docopt: 0, slambda: 0, stablexui: 0, react: 0, cannonml: 0, haxekiwi: 0, robotlegs: 0, spriterhaxeengine: 0, json2object: 0, mphx: 0, task: 0, mlib: 0, hxcppdebugger: 0, hxyaml: 0, hml: 0, bindx2: 0, dragonbones: 0, feathers: 0, mloader: 0, androidsupportv4: 0, googleplaygames: 0, datetime: 0, easylog: 0, mohxa: 0, msgpackhaxe: 0, headbutt: 0, glm: 0, math: 0, unifill: 0, ceramic: 0, hxassert: 0, haxegon: 0, hxmustache: 0, nme: 0, exception: 0, pako: 0, screenmanager: 0, steamwrap: 0, hxinflate: 0, bitmapfont: 0, zameparticles: 0, mtprng: 0, hxsignal: 0, xt3d: 0, farcek: 0, hmm: 0, greensock: 0, datgui: 0, air3: 0, ansi: 0, canvasmarkdown: 0, fracs: 0, gm2d: 0, hashlink: 0, haxelow: 0, htmlhelper: 0, hxargs: 0, hxdaedalus: 0, hxjava: 0, hxpixel: 0, hxpolyk: 0, hxsl: 0, hxspiro: 0, jasper: 0, triangulation: 0, just: 0, kscenes: 0, lsystem: 0, nodule: 0, poly2trihx: 0, stboggsound: 0, tjson: 0, trilateral: 0, unity3d: 0, waxe: 0, yagp: 0, rxjs: 0, dataclass: 0, niik: 0, armory3d: 0, nice: 0, elixir: 0, rebar3: 0, jsx: 0, zui: 0, haxeloader: 0, sdl: 0, unicode: 0, codegen: 0, perfjs: 0, formula: 0, whatformat: 0, opengl: 0, hxini: 0, continuation: 0, babylonhx: 0, b2d: 0, socket: 0, mysql: 0, sqlite: 0 };

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.libraries.length;

			if (!histogramCount.exists(c))
			{
				histogramCount[c] = 1;
			}
			else
			{
				histogramCount[c]++;
			}

			for (library in answer.libraries)
			{
				switch (library)
				{
					case Hxcpp: count.hxcpp++;
					case Hxcs: count.hxcs++;
					case Openfl: count.openfl++;
					case Lime: count.lime++;
					case Actuate: count.actuate++;
					case Haxeui: count.haxeui++;
					case HaxePunk: count.haxepunk++;
					case HaxeFlixel: count.haxeflixel++;
					case Kha: count.kha++;
					case Heaps: count.heaps++;
					case Tink: count.tink++;
					case PixiJS: count.pixijs++;
					case Thx: count.thx++;
					case Utest: count.utest++;
					case Hxnodejs: count.hxnodejs++;
					case Electron: count.electron++;
					case Dox: count.dox++;
					case RecordMacros: count.recordmacros++;
					case JQuery: count.jquery++;
					case HScript: count.hscript++;
					case Format: count.format++;
					case FormatTiled: count.formattiled++;
					case Hxparse: count.hxparse++;
					case Polygonal: count.polygonal++;
					case Away3D: count.away3d++;
					case Munit: count.munit++;
					case SmartFox: count.smartfox++;
					case MSignal: count.msignal++;
					case Minject: count.minject++;
					case Jsprop: count.jsprop++;
					case AdvancedLayout: count.advancedlayout++;
					case Priori: count.priori++;
					case Ash: count.ash++;
					case Systools: count.systools++;
					case HxMake: count.hxmake++;
					case DBAdmin: count.dbadmin++;
					case HtmlParser: count.htmlparser++;
					case Profiler: count.profiler++;
					case Monsoon: count.monsoon++;
					case Sugoi: count.sugoi++;
					case Creates: count.creates++;
					case Hamcrest: count.hamcrest++;
					case Buddy: count.buddy++;
					case Mockatoo: count.mockatoo++;
					case MCover: count.mcover++;
					case HowlerJS: count.howlerjs++;
					case Crashdumper: count.crashdumper++;
					case Firetongue: count.firetongue++;
					case Castle: count.castle++;
					case Coconut: count.coconut++;
					case Checkstyle: count.checkstyle++;
					case Doom: count.doom++;
					case Framework7: count.framework7++;
					case HaxeJSKit: count.haxejskit++;
					case Hexmachina: count.hexmachina++;
					case HxBolts: count.hxbolts++;
					case HxString: count.hxstring++;
					case UFront: count.ufront++;
					case HaxeModular: count.haxemodular++;
					case HaxeWebpack: count.haxewebpack++;
					case As3hx: count.as3hx++;
					case AsyncTools: count.asynctools++;
					case Asys: count.asys++;
					case Box2D: count.box2d++;
					case CleverSort: count.cleversort++;
					case CompileTime: count.compiletime++;
					case Detox: count.detox++;
					case Erazor: count.erazor++;
					case Express: count.express++;
					case ExtensionLocale: count.extensionlocale++;
					case Feffects: count.feffects++;
					case Glory: count.glory++;
					case Gsap: count.gsap++;
					case HaxeGA: count.haxega++;
					case HaxeWebsocketRemoting: count.haxewebsocketremoting++;
					case HaxeWS: count.haxews++;
					case HxLibc: count.hxlibc++;
					case HxTools: count.hxtools++;
					case JsonRpc: count.jsonrpc++;
					case JStack: count.jstack++;
					case Keybinding: count.keybinding++;
					case Layout: count.layout++;
					case Linc: count.linc++;
					case LogShim: count.logshim++;
					case Markdown: count.markdown++;
					case MCli: count.mcli++;
					case MConsole: count.mconsole++;
					case Mime: count.mime++;
					case Modular: count.modular++;
					case MonsterDebugger: count.monsterdebugger++;
					case MTwin: count.mtwin++;
					case NodeWebkit: count.nodewebkit++;
					case NodeJS: count.nodejs++;
					case ObjectInit: count.objectinit++;
					case PromHx: count.promhx++;
					case PureMvc: count.puremvc++;
					case PushState: count.pushstate++;
					case Random: count.random++;
					case Redux: count.redux++;
					case Refactor: count.refactor++;
					case SelectHxml: count.selecthxml++;
					case ShaderBlox: count.shaderblox++;
					case SkylarkUI: count.skylarkui++;
					case SmtpMailer: count.smtpmailer++;
					case SourceMap: count.sourcemap++;
					case Svg: count.svg++;
					case Swf: count.swf++;
					case ThreeJS: count.threejs++;
					case Unknown: count.unknown++;
					case Websocket: count.websocket++;
					case Pony: count.pony++;
					case HxBit: count.hxbit++;
					case HxTelemetry: count.hxtelemetry++;
					case Luxe: count.luxe++;
					case Vuehx: count.vuehx++;
					case Bindings: count.bindings++;
					case Phaser: count.phaser++;
					case DConsole: count.dconsole++;
					case Arguable: count.arguable++;
					case Flambe: count.flambe++;
					case Nape: count.nape++;
					case Kit2D: count.kit2d++;
					case Starling: count.starling++;
					case Tweenx: count.tweenx++;
					case Mmvc: count.mmvc++;
					case ByteConvert: count.byteconvert++;
					case Docopt: count.docopt++;
					case Slambda: count.slambda++;
					case StablexUI: count.stablexui++;
					case React: count.react++;
					case Cannonml: count.cannonml++;
					case HaxeKiwi: count.haxekiwi++;
					case Robotlegs: count.robotlegs++;
					case SpriterHaxeEngine: count.spriterhaxeengine++;
					case Json2Object: count.json2object++;
					case Mphx: count.mphx++;
					case Task: count.task++;
					case Mlib: count.mlib++;
					case HxcppDebugger: count.hxcppdebugger++;
					case HxYaml: count.hxyaml++;
					case Hml: count.hml++;
					case Bindx2: count.bindx2++;
					case Dragonbones: count.dragonbones++;
					case Feathers: count.feathers++;
					case Mloader: count.mloader++;
					case AndroidSupportV4: count.androidsupportv4++;
					case GooglePlayGames: count.googleplaygames++;
					case Datetime: count.datetime++;
					case Easylog: count.easylog++;
					case Mohxa: count.mohxa++;
					case MsgPackHaxe: count.msgpackhaxe++;
					case HeadButt: count.headbutt++;
					case Glm: count.glm++;
					case Math: count.math++;
					case Unifill: count.unifill++;
					case Ceramic: count.ceramic++;
					case HxAssert: count.hxassert++;
					case Haxegon: count.haxegon++;
					case HxMustache: count.hxmustache++;
					case Nme: count.nme++;
					case Exception: count.exception++;
					case Pako: count.pako++;
					case ScreenManager: count.screenmanager++;
					case Steamwrap: count.steamwrap++;
					case HxInflate: count.hxinflate++;
					case BitmapFont: count.bitmapfont++;
					case ZameParticles: count.zameparticles++;
					case Mtprng: count.mtprng++;
					case HxSignal: count.hxsignal++;
					case Xt3d: count.xt3d++;
					case Farcek: count.farcek++;
					case Hmm: count.hmm++;
					case Greensock: count.greensock++;
					case DatGui: count.datgui++;
					case Air3: count.air3++;
					case Ansi: count.ansi++;
					case CanvasMarkdown: count.canvasmarkdown++;
					case Fracs: count.fracs++;
					case Gm2D: count.gm2d++;
					case HashLink: count.hashlink++;
					case Haxelow: count.haxelow++;
					case HtmlHelper: count.htmlhelper++;
					case HxArgs: count.hxargs++;
					case HxDaedalus: count.hxdaedalus++;
					case HxJava: count.hxjava++;
					case HxPixel: count.hxpixel++;
					case HxPolyK: count.hxpolyk++;
					case Hxsl: count.hxsl++;
					case HxSpiro: count.hxspiro++;
					case Jasper: count.jasper++;
					case Triangulation: count.triangulation++;
					case Just: count.just++;
					case KScenes: count.kscenes++;
					case LSystem: count.lsystem++;
					case Nodule: count.nodule++;
					case Poly2Trihx: count.poly2trihx++;
					case StbOggSound: count.stboggsound++;
					case TJson: count.tjson++;
					case Trilateral: count.trilateral++;
					case Unity3D: count.unity3d++;
					case Waxe: count.waxe++;
					case Yagp: count.yagp++;
					case Rxjs: count.rxjs++;
					case DataClass: count.dataclass++;
					case Niik: count.niik++;
					case Armory3D: count.armory3d++;
					case Nice: count.nice++;
					case Elixir: count.elixir++;
					case Rebar3: count.rebar3++;
					case Jsx: count.jsx++;
					case Zui: count.zui++;
					case HaxeLoader: count.haxeloader++;
					case Sdl: count.sdl++;
					case Unicode: count.unicode++;
					case CodeGen: count.codegen++;
					case PerfJS: count.perfjs++;
					case Formula: count.formula++;
					case WhatFormat: count.whatformat++;
					case OpenGL: count.opengl++;
					case HxIni: count.hxini++;
					case Continuation: count.continuation++;
					case Babylonhx: count.babylonhx++;
					case B2d: count.b2d++;
					case Socket: count.socket++;
					case Mysql: count.mysql++;
					case Sqlite: count.sqlite++;
				}
			}
		}

		// Data
		var baseData = [
			["Hxcpp", "Hxcpp", '${count.hxcpp}'],
			["Hxcs", "Hxcs", '${count.hxcs}'],
			["Openfl", "Openfl", '${count.openfl}'],
			["Lime", "Lime", '${count.lime}'],
			["Actuate", "Actuate", '${count.actuate}'],
			["Haxeui", "Haxeui", '${count.haxeui}'],
			["HaxePunk", "HaxePunk", '${count.haxepunk}'],
			["HaxeFlixel", "HaxeFlixel", '${count.haxeflixel}'],
			["Kha", "Kha", '${count.kha}'],
			["Heaps", "Heaps", '${count.heaps}'],
			["Tink", "Tink", '${count.tink}'],
			["PixiJS", "PixiJS", '${count.pixijs}'],
			["Thx", "Thx", '${count.thx}'],
			["Utest", "Utest", '${count.utest}'],
			["Hxnodejs", "Hxnodejs", '${count.hxnodejs}'],
			["Electron", "Electron", '${count.electron}'],
			["Dox", "Dox", '${count.dox}'],
			["RecordMacros", "RecordMacros", '${count.recordmacros}'],
			["JQuery", "JQuery", '${count.jquery}'],
			["HScript", "HScript", '${count.hscript}'],
			["Format", "Format", '${count.format}'],
			["FormatTiled", "FormatTiled", '${count.formattiled}'],
			["Hxparse", "Hxparse", '${count.hxparse}'],
			["Polygonal", "Polygonal", '${count.polygonal}'],
			["Away3D", "Away3D", '${count.away3d}'],
			["Munit", "Munit", '${count.munit}'],
			["SmartFox", "SmartFox", '${count.smartfox}'],
			["MSignal", "MSignal", '${count.msignal}'],
			["Minject", "Minject", '${count.minject}'],
			["Jsprop", "Jsprop", '${count.jsprop}'],
			["AdvancedLayout", "AdvancedLayout", '${count.advancedlayout}'],
			["Priori", "Priori", '${count.priori}'],
			["Ash", "Ash", '${count.ash}'],
			["Systools", "Systools", '${count.systools}'],
			["HxMake", "HxMake", '${count.hxmake}'],
			["DBAdmin", "DBAdmin", '${count.dbadmin}'],
			["HtmlParser", "HtmlParser", '${count.htmlparser}'],
			["Profiler", "Profiler", '${count.profiler}'],
			["Monsoon", "Monsoon", '${count.monsoon}'],
			["Sugoi", "Sugoi", '${count.sugoi}'],
			["Creates", "Creates", '${count.creates}'],
			["Hamcrest", "Hamcrest", '${count.hamcrest}'],
			["Buddy", "Buddy", '${count.buddy}'],
			["Mockatoo", "Mockatoo", '${count.mockatoo}'],
			["MCover", "MCover", '${count.mcover}'],
			["HowlerJS", "HowlerJS", '${count.howlerjs}'],
			["Crashdumper", "Crashdumper", '${count.crashdumper}'],
			["Firetongue", "Firetongue", '${count.firetongue}'],
			["Castle", "Castle", '${count.castle}'],
			["Coconut", "Coconut", '${count.coconut}'],
			["Checkstyle", "Checkstyle", '${count.checkstyle}'],
			["Doom", "Doom", '${count.doom}'],
			["Framework7", "Framework7", '${count.framework7}'],
			["HaxeJSKit", "HaxeJSKit", '${count.haxejskit}'],
			["Hexmachina", "Hexmachina", '${count.hexmachina}'],
			["HxBolts", "HxBolts", '${count.hxbolts}'],
			["HxString", "HxString", '${count.hxstring}'],
			["UFront", "UFront", '${count.ufront}'],
			["HaxeModular", "HaxeModular", '${count.haxemodular}'],
			["HaxeWebpack", "HaxeWebpack", '${count.haxewebpack}'],
			["As3hx", "As3hx", '${count.as3hx}'],
			["AsyncTools", "AsyncTools", '${count.asynctools}'],
			["Asys", "Asys", '${count.asys}'],
			["Box2D", "Box2D", '${count.box2d}'],
			["CleverSort", "CleverSort", '${count.cleversort}'],
			["CompileTime", "CompileTime", '${count.compiletime}'],
			["Detox", "Detox", '${count.detox}'],
			["Erazor", "Erazor", '${count.erazor}'],
			["Express", "Express", '${count.express}'],
			["ExtensionLocale", "ExtensionLocale", '${count.extensionlocale}'],
			["Feffects", "Feffects", '${count.feffects}'],
			["Glory", "Glory", '${count.glory}'],
			["Gsap", "Gsap", '${count.gsap}'],
			["HaxeGA", "HaxeGA", '${count.haxega}'],
			["HaxeWebsocketRemoting", "HaxeWebsocketRemoting", '${count.haxewebsocketremoting}'],
			["HaxeWS", "HaxeWS", '${count.haxews}'],
			["HxLibc", "HxLibc", '${count.hxlibc}'],
			["HxTools", "HxTools", '${count.hxtools}'],
			["JsonRpc", "JsonRpc", '${count.jsonrpc}'],
			["JStack", "JStack", '${count.jstack}'],
			["Keybinding", "Keybinding", '${count.keybinding}'],
			["Layout", "Layout", '${count.layout}'],
			["Linc", "Linc", '${count.linc}'],
			["LogShim", "LogShim", '${count.logshim}'],
			["Markdown", "Markdown", '${count.markdown}'],
			["MCli", "MCli", '${count.mcli}'],
			["MConsole", "MConsole", '${count.mconsole}'],
			["Mime", "Mime", '${count.mime}'],
			["Modular", "Modular", '${count.modular}'],
			["MonsterDebugger", "MonsterDebugger", '${count.monsterdebugger}'],
			["MTwin", "MTwin", '${count.mtwin}'],
			["NodeWebkit", "NodeWebkit", '${count.nodewebkit}'],
			["NodeJS", "NodeJS", '${count.nodejs}'],
			["ObjectInit", "ObjectInit", '${count.objectinit}'],
			["PromHx", "PromHx", '${count.promhx}'],
			["PureMvc", "PureMvc", '${count.puremvc}'],
			["PushState", "PushState", '${count.pushstate}'],
			["Random", "Random", '${count.random}'],
			["Redux", "Redux", '${count.redux}'],
			["Refactor", "Refactor", '${count.refactor}'],
			["SelectHxml", "SelectHxml", '${count.selecthxml}'],
			["ShaderBlox", "ShaderBlox", '${count.shaderblox}'],
			["SkylarkUI", "SkylarkUI", '${count.skylarkui}'],
			["SmtpMailer", "SmtpMailer", '${count.smtpmailer}'],
			["SourceMap", "SourceMap", '${count.sourcemap}'],
			["Svg", "Svg", '${count.svg}'],
			["Swf", "Swf", '${count.swf}'],
			["ThreeJS", "ThreeJS", '${count.threejs}'],
			["Unknown", "Unknown", '${count.unknown}'],
			["Websocket", "Websocket", '${count.websocket}'],
			["Pony", "Pony", '${count.pony}'],
			["HxBit", "HxBit", '${count.hxbit}'],
			["HxTelemetry", "HxTelemetry", '${count.hxtelemetry}'],
			["Luxe", "Luxe", '${count.luxe}'],
			["Vuehx", "Vuehx", '${count.vuehx}'],
			["Bindings", "Bindings", '${count.bindings}'],
			["Phaser", "Phaser", '${count.phaser}'],
			["DConsole", "DConsole", '${count.dconsole}'],
			["Arguable", "Arguable", '${count.arguable}'],
			["Flambe", "Flambe", '${count.flambe}'],
			["Nape", "Nape", '${count.nape}'],
			["Kit2D", "Kit2D", '${count.kit2d}'],
			["Starling", "Starling", '${count.starling}'],
			["Tweenx", "Tweenx", '${count.tweenx}'],
			["Mmvc", "Mmvc", '${count.mmvc}'],
			["ByteConvert", "ByteConvert", '${count.byteconvert}'],
			["Docopt", "Docopt", '${count.docopt}'],
			["Slambda", "Slambda", '${count.slambda}'],
			["StablexUI", "StablexUI", '${count.stablexui}'],
			["React", "React", '${count.react}'],
			["Cannonml", "Cannonml", '${count.cannonml}'],
			["HaxeKiwi", "HaxeKiwi", '${count.haxekiwi}'],
			["Robotlegs", "Robotlegs", '${count.robotlegs}'],
			["SpriterHaxeEngine", "SpriterHaxeEngine", '${count.spriterhaxeengine}'],
			["Json2Object", "Json2Object", '${count.json2object}'],
			["Mphx", "Mphx", '${count.mphx}'],
			["Task", "Task", '${count.task}'],
			["Mlib", "Mlib", '${count.mlib}'],
			["HxcppDebugger", "HxcppDebugger", '${count.hxcppdebugger}'],
			["HxYaml", "HxYaml", '${count.hxyaml}'],
			["Hml", "Hml", '${count.hml}'],
			["Bindx2", "Bindx2", '${count.bindx2}'],
			["Dragonbones", "Dragonbones", '${count.dragonbones}'],
			["Feathers", "Feathers", '${count.feathers}'],
			["Mloader", "Mloader", '${count.mloader}'],
			["AndroidSupportV4", "AndroidSupportV4", '${count.androidsupportv4}'],
			["GooglePlayGames", "GooglePlayGames", '${count.googleplaygames}'],
			["Datetime", "Datetime", '${count.datetime}'],
			["Easylog", "Easylog", '${count.easylog}'],
			["Mohxa", "Mohxa", '${count.mohxa}'],
			["MsgPackHaxe", "MsgPackHaxe", '${count.msgpackhaxe}'],
			["HeadButt", "HeadButt", '${count.headbutt}'],
			["Glm", "Glm", '${count.glm}'],
			["Math", "Math", '${count.math}'],
			["Unifill", "Unifill", '${count.unifill}'],
			["Ceramic", "Ceramic", '${count.ceramic}'],
			["HxAssert", "HxAssert", '${count.hxassert}'],
			["Haxegon", "Haxegon", '${count.haxegon}'],
			["HxMustache", "HxMustache", '${count.hxmustache}'],
			["Nme", "Nme", '${count.nme}'],
			["Exception", "Exception", '${count.exception}'],
			["Pako", "Pako", '${count.pako}'],
			["ScreenManager", "ScreenManager", '${count.screenmanager}'],
			["Steamwrap", "Steamwrap", '${count.steamwrap}'],
			["HxInflate", "HxInflate", '${count.hxinflate}'],
			["BitmapFont", "BitmapFont", '${count.bitmapfont}'],
			["ZameParticles", "ZameParticles", '${count.zameparticles}'],
			["Mtprng", "Mtprng", '${count.mtprng}'],
			["HxSignal", "HxSignal", '${count.hxsignal}'],
			["Xt3d", "Xt3d", '${count.xt3d}'],
			["Farcek", "Farcek", '${count.farcek}'],
			["Hmm", "Hmm", '${count.hmm}'],
			["Greensock", "Greensock", '${count.greensock}'],
			["DatGui", "DatGui", '${count.datgui}'],
			["Air3", "Air3", '${count.air3}'],
			["Ansi", "Ansi", '${count.ansi}'],
			["CanvasMarkdown", "CanvasMarkdown", '${count.canvasmarkdown}'],
			["Fracs", "Fracs", '${count.fracs}'],
			["Gm2D", "Gm2D", '${count.gm2d}'],
			["HashLink", "HashLink", '${count.hashlink}'],
			["Haxelow", "Haxelow", '${count.haxelow}'],
			["HtmlHelper", "HtmlHelper", '${count.htmlhelper}'],
			["HxArgs", "HxArgs", '${count.hxargs}'],
			["HxDaedalus", "HxDaedalus", '${count.hxdaedalus}'],
			["HxJava", "HxJava", '${count.hxjava}'],
			["HxPixel", "HxPixel", '${count.hxpixel}'],
			["HxPolyK", "HxPolyK", '${count.hxpolyk}'],
			["Hxsl", "Hxsl", '${count.hxsl}'],
			["HxSpiro", "HxSpiro", '${count.hxspiro}'],
			["Jasper", "Jasper", '${count.jasper}'],
			["Triangulation", "Triangulation", '${count.triangulation}'],
			["Just", "Just", '${count.just}'],
			["KScenes", "KScenes", '${count.kscenes}'],
			["LSystem", "LSystem", '${count.lsystem}'],
			["Nodule", "Nodule", '${count.nodule}'],
			["Poly2Trihx", "Poly2Trihx", '${count.poly2trihx}'],
			["StbOggSound", "StbOggSound", '${count.stboggsound}'],
			["TJson", "TJson", '${count.tjson}'],
			["Trilateral", "Trilateral", '${count.trilateral}'],
			["Unity3D", "Unity3D", '${count.unity3d}'],
			["Waxe", "Waxe", '${count.waxe}'],
			["Yagp", "Yagp", '${count.yagp}'],
			["Rxjs", "Rxjs", '${count.rxjs}'],
			["DataClass", "DataClass", '${count.dataclass}'],
			["Niik", "Niik", '${count.niik}'],
			["Armory3D", "Armory3D", '${count.armory3d}'],
			["Nice", "Nice", '${count.nice}'],
			["Elixir", "Elixir", '${count.elixir}'],
			["Rebar3", "Rebar3", '${count.rebar3}'],
			["Jsx", "Jsx", '${count.jsx}'],
			["Zui", "Zui", '${count.zui}'],
			["HaxeLoader", "HaxeLoader", '${count.haxeloader}'],
			["Sdl", "Sdl", '${count.sdl}'],
			["Unicode", "Unicode", '${count.unicode}'],
			["CodeGen", "CodeGen", '${count.codegen}'],
			["PerfJS", "PerfJS", '${count.perfjs}'],
			["Formula", "Formula", '${count.formula}'],
			["WhatFormat", "WhatFormat", '${count.whatformat}'],
			["OpenGL", "OpenGL", '${count.opengl}'],
			["HxIni", "HxIni", '${count.hxini}'],
			["Continuation", "Continuation", '${count.continuation}'],
			["Babylonhx", "Babylonhx", '${count.babylonhx}'],
			["B2d", "B2d", '${count.b2d}'],
			["Socket", "Socket", '${count.socket}'],
			["Mysql", "Mysql", '${count.mysql}'],
			["Sqlite", "Sqlite", '${count.sqlite}'],
		];

		// Export
		Data.export({ title: "Libraries", prettyTitle: "What are the Haxe libraries you use?", baseData: baseData, histogram: histogramCount });
	}
}
