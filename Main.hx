import sys.io.File;

class Main
{
	static function main()
	{
		Data.makeExportFolder();

		// Parse data
		var data = CSV.getFromFile("data.csv");

		// Generate clean version
		var clean = CSV.export(data);

		if (CSV.export(CSV.get(clean)) != clean)
		{
			throw "clean doesn't pass roundtrip";
		}

		File.saveContent("generated/clean.csv", clean);

		// Generate tables and graphs
		questions.Browser.generate(data);
		questions.Communication.generate(data);
		questions.Country.generate(data);
		questions.DesktopOS.generate(data);
		questions.HaxeLength.generate(data);
		questions.IDE.generate(data);
		questions.Install.generate(data);
		questions.KnowPaid.generate(data);
		questions.Libraries.generate(data);
		questions.Macros.generate(data);
		questions.MobileOS.generate(data);
		questions.OrgSize.generate(data);
		questions.Partner.generate(data);
		questions.PlanInterest.generate(data);
		questions.ProgLength.generate(data);
		questions.Publish.generate(data);
		questions.Salary.generate(data);
		questions.Support.generate(data);
		questions.Targets.generate(data);
		questions.Usages.generate(data);
		questions.UseType.generate(data);
	}
}
