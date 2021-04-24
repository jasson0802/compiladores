package analizadores;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Util {
	private static String printWriterPath;
	
	public static void setPrintWriterPath(String path) {
		printWriterPath = path;
	}
	
	public static void WriteToken(String token)
			  throws IOException
			{
				BufferedWriter writer = new BufferedWriter(new FileWriter(printWriterPath, true));
				writer.write(token);
				writer.newLine();
				writer.close();
				System.out.println(token);
			}
	
	
	public static String readFile(String path, Charset encoding)
			throws IOException
			{
		
			String basePath = new File("").getAbsolutePath();
			byte[] encoded = Files.readAllBytes(Paths.get(basePath+"/"+path));
			return new String(encoded, encoding);
			
			}	
}
