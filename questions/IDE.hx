package questions;

enum TIDE
{
	FHDevelop;
	IntelliJ;
	VSCode;
	Vim;
	Sublime;
	Other(value:String);
	NoAnswer;
	// Added
	NotepadPlusPlus;
	Kode;
	Multiple;
	Atom;
	WebBased;
	Emacs;
	Geany;
	TextMate;
	None;
}

class IDE
{
	public static function parse(value:String) : TIDE
	{
		return switch (value)
		{
			case "FlashDevelop/HaxeDevelop", "FHDevelop": FHDevelop;
			case "IntelliJ": IntelliJ;
			case "Visual Studio Code", "vs code", "VSCode": VSCode;
			case "VIM", "Vim": Vim;
			case "Sublime Text", "Sublime": Sublime;
			case "mooedit", "Context", "Notepad2-mod", "Notepadqq", "I left haxe because of lack of good idea for Mac.", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "Notepad++", "Notepas++", "NotepadPlusPlus": NotepadPlusPlus;
			case "Kode studio", "Kode Studio", "krom", "Krom studio", "Kode": Kode;
			case "You should have this as checkboxes. Sublime, Visual Studio, FlashDevelop (a combination).", "Textmate, Kode, VisualStudioCode.", "Multiple": Multiple;
			case "Atom", "atom": Atom;
			case "a tiny editor running in Firefox with Haxe-completion & Neko-server", "WebBased": WebBased;
			case "emacs", "Emacs custom", "Emacs", "GNU Emacs": Emacs;
			case "Geany": Geany;
			case "TextMate": TextMate;
			case "None", "plain old unix shell commandsp", "I don't use an IDE", "dont know yet": None;
			default: throw 'Unknown IDE value "${value}"';
		}
	}

	public static function toString(value:TIDE) : String
	{
		return switch (value)
		{
			case FHDevelop: "FHDevelop";
			case IntelliJ: "IntelliJ";
			case VSCode: "VSCode";
			case Vim: "Vim";
			case Sublime: "Sublime";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case NotepadPlusPlus: "NotepadPlusPlus";
			case Kode: "Kode";
			case Multiple: "Multiple";
			case Atom: "Atom";
			case WebBased: "WebBased";
			case Emacs: "Emacs";
			case Geany: "Geany";
			case TextMate: "TextMate";
			case None: "None";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		// Count
		var count = { fhdevelop: 0, intellij: 0, vscode: 0, vim: 0, sublime: 0, other: 0, notepadplusplus: 0, kode: 0, multiple: 0, atom: 0, webbased: 0, emacs: 0, geany: 0, textmate: 0, none: 0 };

		for (answer in data)
		{
			switch (answer.ide)
			{
				case FHDevelop: count.fhdevelop++;
				case IntelliJ: count.intellij++;
				case VSCode: count.vscode++;
				case Vim: count.vim++;
				case Sublime: count.sublime++;
				case Other(_): count.other++;
				case NoAnswer:
				// Added
				case NotepadPlusPlus: count.notepadplusplus++;
				case Kode: count.kode++;
				case Multiple: count.multiple++;
				case Atom: count.atom++;
				case WebBased: count.webbased++;
				case Emacs: count.emacs++;
				case Geany: count.geany++;
				case TextMate: count.textmate++;
				case None: count.none++;
			}
		}

		var baseOther = count.other + count.notepadplusplus + count.kode + count.multiple + count.atom + count.webbased + count.emacs + count.geany + count.textmate + count.none;

		var baseData = [
			["FHDevelop", "FlashDevelop/HaxeDevelop", '${count.fhdevelop}'],
			["IntelliJ", "IntelliJ", '${count.intellij}'],
			["VSCode", "Visual Studio Code", '${count.vscode}'],
			["Vim", "VIM", '${count.vim}'],
			["Sublime", "Sublime Text", '${count.sublime}'],
		];

		var extendedData = baseData.concat([
			["NotepadPlusPlus", "Notepad++", '${count.notepadplusplus}'],
			["Kode", "Kode Studio", '${count.kode}'],
			["Multiple", "Multiple", '${count.multiple}'],
			["Atom", "Atom", '${count.atom}'],
			["WebBased", "Web Based", '${count.webbased}'],
			["Emacs", "Emacs", '${count.emacs}'],
			["Geany", "Geany", '${count.geany}'],
			["TextMate", "TextMate", '${count.textmate}'],
			["None", "None", '${count.none}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "IDE", prettyTitle: "What is your preferred Haxe IDE?", baseData: baseData, extendedData: extendedData });
	}
}
