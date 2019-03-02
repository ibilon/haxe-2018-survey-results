import sys.FileSystem;
import sys.io.File;

class Data
{
	public static function makeExportFolder()
	{
		createIfNotExist("generated");
		createIfNotExist("generated/graphs");
		createIfNotExist("generated/r");
		createIfNotExist("generated/tables");
	}

	static function createIfNotExist(path:String)
	{
		if (!FileSystem.exists(path))
		{
			FileSystem.createDirectory(path);
		}
	}

	public static function export(args:{ title:String, prettyTitle:String, baseData:Array<Array<String>>, ?extendedData:Array<Array<String>>, ?extendedDataPrettyTitle:String, ?groupData:Array<Array<String>>, ?groupDataPrettyTitle:String, ?histogram:Map<Int, Int>, ?histogramPrettyTitle:String })
	{
		var name = args.title.toLowerCase();

		exportType(args.baseData, "base", name, args.title, args.prettyTitle);

		if (args.extendedData != null)
		{
			exportType(args.extendedData, "extended", name, args.title, args.extendedDataPrettyTitle != null ? args.extendedDataPrettyTitle : args.prettyTitle);
		}

		if (args.groupData != null)
		{
			exportType(args.groupData, "group", name, args.title, args.groupDataPrettyTitle != null ? args.groupDataPrettyTitle : args.prettyTitle);
		}

		if (args.histogram != null)
		{
			exportHistogram(args.histogram, name, args.histogramPrettyTitle != null ? args.histogramPrettyTitle : args.prettyTitle);
		}
	}

	static function exportType(data:Array<Array<String>>, type:String, name:String, title:String, prettyTitle:String)
	{
		// Table
		var total = 0;
		var table = new StringBuf();
		table.add('$title Count\n');

		var sortedData = data.copy();
		sortedData.sort((a, b) -> -1 * Reflect.compare(Std.parseInt(a[2]), Std.parseInt(b[2])));

		for (line in sortedData)
		{
			table.add('${line[0]} ${line[2]}\n');
			total += Std.parseInt(line[2]);
		}

		table.add('Total $total\n');

		File.saveContent('generated/tables/$type-$name.txt', table.toString());

		// R - pie
		var output = 'generated/graphs/pie-$type-$name.png';
		var script = 'generated/r/pie-$type-$name.r';

		var r = new StringBuf();
		r.add('library(Cairo)\nCairo(file="${output}", type="png", units="px", width=800, height=480, dpi=72)\nslices <- c(');
		r.add(sortedData.map(f -> f[2]).join(", "));
		r.add(")\nlbls <- c(");
		r.add(sortedData.map(f -> '"${f[1]}"').join(", "));
		r.add(')\npct <- round(slices/sum(slices)*100)\nlbls <- paste(lbls, " (", sep="")\nlbls <- paste(lbls, pct)\nlbls <- paste(lbls, "% )", sep="")\npie(slices, labels=lbls, col=rainbow(length(lbls)), main="${prettyTitle}")\ninvisible(dev.off())\n');

		File.saveContent(script, r.toString());
		Sys.command("R", ["--no-save", "--slave", "-f", script]);

		// R - bar
		var output = 'generated/graphs/bar-$type-$name.png';
		var script = 'generated/r/bar-$type-$name.r';

		var r = new StringBuf();
		r.add('library(Cairo)\nCairo(file="${output}", type="png", units="px", width=800, height=480, dpi=72)\nslices <- c(');
		r.add(sortedData.map(f -> f[2]).join(", "));
		r.add(")\nlbls <- c(");
		r.add(sortedData.map(f -> '"${f[1]}"').join(", "));
		r.add(')\nlbls <- paste(lbls, "\n", sep="")\nlbls <- paste(lbls, slices)\nbarplot(slices, names.arg=lbls, main="${prettyTitle}", yaxt="n", col=rainbow(length(lbls)), las=2)\ninvisible(dev.off())\n');

		File.saveContent(script, r.toString());
		Sys.command("R", ["--no-save", "--slave", "-f", script]);
	}

	static function exportHistogram(histogram:Map<Int, Int>, name:String, prettyTitle:String)
	{
		// Preparse
		var maxHistogram = 0;

		for (k in histogram.keys())
		{
			if (k > maxHistogram)
			{
				maxHistogram = k;
			}
		}

		var table = [];

		for (i in 0...maxHistogram)
		{
			if (histogram.exists(i))
			{
				table.push(['${i}', '${histogram[i]}']);
			}
			else
			{
				table.push(['${i}', "0"]);
			}
		}

		// Table
		var total = 0;
		var buf = new StringBuf();
		buf.add("Number Count\n");

		for (line in table)
		{
			buf.add('${line[0]} ${line[1]}\n');
			total += Std.parseInt(line[1]);
		}

		buf.add('Total $total\n');

		File.saveContent('generated/tables/histogram-${name}.txt', buf.toString());

		// R
		var output = 'generated/graphs/histogram-$name.png';
		var script = 'generated/r/histogram-$name.r';

		var r = new StringBuf();
		r.add('library(Cairo)\nCairo(file="${output}", type="png", units="px", width=800, height=480, dpi=72)\nslices <- c(');
		r.add(table.map(f -> f[1]).join(", "));
		r.add(")\nlbls <- c(");
		r.add(table.map(f -> '"${f[0]}"').join(", "));
		r.add(')\nlbls <- paste(lbls, "\n", sep="")\nlbls <- paste(lbls, slices)\nbarplot(slices, names.arg=lbls, main="${prettyTitle}", yaxt="n", col=rainbow(length(lbls)))\ninvisible(dev.off())\n');

		File.saveContent(script, r.toString());
		Sys.command("R", ["--no-save", "--slave", "-f", script]);
	}
}
