package questions;

enum TTargets
{
	Js;
	Cpp;
	Hl;
	Lua;
	Php;
	Java;
	Cs;
	Neko;
	Flash;
	As3;
	Python;
	Interp;
}

class Targets
{
	public static function parse(value:String) : Array<TTargets>
	{
		return value.split(";").map(parseSingleValue).filter(f->f != null);
	}

	static function parseSingleValue(value:String) : TTargets
	{
		return switch (value)
		{
			case "JavaScript", "Js": Js;
			case "C++", "Cpp": Cpp;
			case "HashLink", "Hl": Hl;
			case "Lua": Lua;
			case "PHP", "Php": Php;
			case "Java": Java;
			case "C#", "Cs": Cs;
			case "Neko": Neko;
			case "Flash (SWF)", "Flash": Flash;
			case "AS3 Source", "As3": As3;
			case "Python": Python;
			case "--interp", "Interp": Interp;
			case "": null;
			default: throw 'Unknown Targets value "${value}"';
		}
	}

	public static function toString(value:Array<TTargets>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TTargets) : String
	{
		return switch (value)
		{
			case Js: "Js";
			case Cpp: "Cpp";
			case Hl: "Hl";
			case Lua: "Lua";
			case Php: "Php";
			case Java: "Java";
			case Cs: "Cs";
			case Neko: "Neko";
			case Flash: "Flash";
			case As3: "As3";
			case Python: "Python";
			case Interp: "Interp";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { js: 0, cpp: 0, hl: 0, lua: 0, php: 0, java: 0, cs: 0, neko: 0, flash: 0, as3: 0, python: 0, interp: 0 }

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.targets.length;

			if (!histogramCount.exists(c))
			{
				histogramCount[c] = 1;
			}
			else
			{
				histogramCount[c]++;
			}

			for (target in answer.targets)
			{
				switch (target)
				{
					case Js: count.js++;
					case Cpp: count.cpp++;
					case Hl: count.hl++;
					case Lua: count.lua++;
					case Php: count.php++;
					case Java: count.java++;
					case Cs: count.cs++;
					case Neko: count.neko++;
					case Flash: count.flash++;
					case As3: count.as3++;
					case Python: count.python++;
					case Interp: count.interp++;
				}
			}
		}

		// Data
		var baseData = [
			["Js", "JavaScript", '${count.js}'],
			["Cpp", "C++", '${count.cpp}'],
			["Hl", "HashLink", '${count.hl}'],
			["Lua", "Lua", '${count.lua}'],
			["Php", "PHP", '${count.php}'],
			["Java", "Java", '${count.java}'],
			["Cs", "C#", '${count.cs}'],
			["Neko", "Neko", '${count.neko}'],
			["Flash", "Flash", '${count.flash}'],
			["As3", "AS3", '${count.as3}'],
			["Python", "Python", '${count.python}'],
			["Interp", "--interp", '${count.interp}'],
		];

		// Export
		Data.export({ title: "Targets", prettyTitle: "Which Haxe targets do you use?", baseData: baseData, histogram: histogramCount, histogramPrettyTitle: "How many targets do you use?" });
	}
}
