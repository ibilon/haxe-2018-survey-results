package questions;

enum TInstall
{
	Official;
	LinuxPM;
	Npm;
	Chocolatey;
	Source;
	Homebrew;
	Other(value:String);
	NoAnswer;
	// Added
	Lix;
	DevSnapshot;
	Manual;
	Bundled;
	Docker;
	Hvm;
}

class Install
{
	public static function parse(value:String) : Array<TInstall>
	{
		return value.split(";").map(parseSingleValue);
	}

	static function parseSingleValue(value:String) : TInstall
	{
		return switch (value)
		{
			case "Official installer", "from GitHub Releases", "download binaries", "Official": Official;
			case "Linux Package Manager", "ppa", "nixos package", "LinuxPM": LinuxPM;
			case "NPM", "Npm": Npm;
			case "Chocolatey": Chocolatey;
			case "Build from source", "manual build", "Source": Source;
			case "Homebrew": Homebrew;
			case "Custom CLI haxe version controller", "Ideally, I would use one specific haxe version for each project", "Portable installation (single folder)", "Vs Code", "haxe fore you", "Windows", "Other": Other(value);
			case "": NoAnswer;
			// Added
			case "lix", "Lix", "npm->lix", "Using haxeshim (from lix)", "switchx", "Switchx": Lix;
			case "Releases from github / build.haxe.org", "DevSnapshot": DevSnapshot;
			case "zip file", "official Linux .tgz files (but not any installer / package mgmt)", "latest zipped binaries", "Download binaries and use a tool to manage alias in usr local. This is because I often need to switch haxe version", "Manual": Manual;
			case "With Kha", "Armory 3d", "Flashdevelop5", "Flashdevelop package manager", "KodeStudio(kha)", "Kode studio", "Bundled": Bundled;
			case "Official Docker image", "trough docker container", "Docker": Docker;
			case "hvm bash utility on Debian linux", "HVM (haxe version manager) for linux", "Hvm": Hvm;
			default: throw 'Unknown Install value "${value}"';
		}
	}

	public static function toString(value:Array<TInstall>) : String
	{
		return value.map(valueToString).join(";");
	}

	static function valueToString(value:TInstall) : String
	{
		return switch (value)
		{
			case Official: "Official";
			case LinuxPM: "LinuxPM";
			case Npm: "Npm";
			case Chocolatey: "Chocolatey";
			case Source: "Source";
			case Homebrew: "Homebrew";
			case Other(_): "Other";
			case NoAnswer: "";
			// Added
			case Lix: "Lix";
			case DevSnapshot: "DevSnapshot";
			case Manual: "Manual";
			case Bundled: "Bundled";
			case Docker: "Docker";
			case Hvm: "Hvm";
		}
	}

	public static function generate(data:Array<Answer>) : Void
	{
		var count = { official: 0, linuxpm: 0, npm: 0, chocolatey: 0, source: 0, homebrew: 0, other: 0, lix: 0, devsnapshot: 0, manual: 0, bundled: 0, docker: 0, hvm: 0 };

		var histogramCount = new Map<Int, Int>();

		for (answer in data)
		{
			var c = answer.install.length;

			if (c == 1 && answer.install[0].match(NoAnswer))
			{
				c = 0;
			}

			if (!histogramCount.exists(c))
			{
				histogramCount[c] = 1;
			}
			else
			{
				histogramCount[c]++;
			}

			for (install in answer.install)
			{
				switch (install)
				{
					case Official: count.official++;
					case LinuxPM: count.linuxpm++;
					case Npm: count.npm++;
					case Chocolatey: count.chocolatey++;
					case Source: count.source++;
					case Homebrew: count.homebrew++;
					case Other(_): count.other++;
					case NoAnswer:
					// Added
					case Lix: count.lix++;
					case DevSnapshot: count.devsnapshot++;
					case Manual: count.manual++;
					case Bundled: count.bundled++;
					case Docker: count.docker++;
					case Hvm: count.hvm++;
				}
			}
		}

		var baseOther = count.other + count.lix + count.manual + count.bundled + count.docker + count.hvm;

		// Data
		var baseData = [
			["Official", "Official\nInstaller", '${count.official}'],
			["LinuxPM", "Linux\nPackage", '${count.linuxpm}'],
			["Npm", "NPM", '${count.npm}'],
			["Chocolatey", "Chocolatey", '${count.chocolatey}'],
			["Source", "Source\nBuild", '${count.source}'],
			["Homebrew", "Homebrew", '${count.homebrew}'],
		];

		var extendedData = baseData.concat([
			["Lix", "lix", '${count.lix}'],
			["DevSnapshot", "Development Snapshot", '${count.devsnapshot}'],
			["Manual", "Manually", '${count.manual}'],
			["Bundled", "Bundled", '${count.bundled}'],
			["Docker", "Docker", '${count.docker}'],
			["Hvm", "hvm", '${count.hvm}'],
			["Other", "Other", '${count.other}'],
		]);

		baseData.push(["Other", "Other", '${baseOther}']);

		// Export
		Data.export({ title: "Install", prettyTitle: "How do you install Haxe?", baseData: baseData, extendedData: extendedData, histogram: histogramCount });
	}
}
