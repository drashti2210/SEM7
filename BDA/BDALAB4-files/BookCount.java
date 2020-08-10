import java.io.IOException;
import java.util.StringTokenizer;
import org.apache.hadoop.conf.Configuration;
import org.apache.hadoop.fs.Path;
import org.apache.hadoop.io.*;
import org.apache.hadoop.io.Text;
import org.apache.hadoop.mapreduce.Job;
import org.apache.hadoop.mapreduce.Mapper;
import org.apache.hadoop.mapreduce.Reducer;
import org.apache.hadoop.mapreduce.lib.input.FileInputFormat;
import org.apache.hadoop.mapreduce.lib.output.FileOutputFormat;

public class BookCount
{
	public static class BookMapper extends Mapper < LongWritable,
	Text, Text, IntWritable >
	{
		private final static IntWritable one = new IntWritable(1);
		private Text book = new Text();
		public void map (LongWritable key, Text value, Context context) throws IOException, InterruptedException
		{
			int x = Integer.parseInt(value.toString());
			if(x>300)
			{
				book.set("Big Books");
				context.write(book, one);
			}
			else
			{
				book.set("Small Books");
				context.write(book, one);
			}
		}
	}
	
	public static class SumReducer extends Reducer < Text, IntWritable,
	Text, IntWritable >
	{
		private IntWritable result = new IntWritable();
		public void reduce(Text key, Iterable < IntWritable > values, Context context) throws
		IOException, InterruptedException
		{
			int total = 0;
			for (IntWritable val: values)
			{
				total += val.get();
			}
			result. set (total);
			context. write(key, result);
		}
	}
	public static void main(String[] args) throws Exception
	{
		Configuration conf = new Configuration();
		Job job = Job.getInstance(conf, "Book count");
		job. setJarByClass(BookCount.class);
		job. setMapperClass(BookMapper.class);
		job. setCombinerClass(SumReducer.class);
		job. setReducerClass(SumReducer.class);
		job. setOutputKeyClass(Text.class);
		job. setOutputValueClass(IntWritable.class);
		FileInputFormat.addInputPath(job, new Path(args[0]));
		FileOutputFormat.setOutputPath(job, new Path(args[1]));
		System. exit (job.waitForCompletion(true) ? 0 : 1);
	}
}