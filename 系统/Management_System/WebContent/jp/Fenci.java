package jp;
import edu.fudan.nlp.tag.CWSTagger;
public class Fenci {
	
	public static String ope(String s) {
		CWSTagger tag;
		String res="";
		try {
			System.out.println();
			tag = new CWSTagger("D:\\eclipseEE\\workplace\\Management_System4.83\\Management_System\\WebContent\\models\\seg.c7.110918.gz", "D:\\eclipseEE\\workplace\\Management_System4.83\\Management_System\\WebContent\\models\\dict.txt");
			res=tag.tag(s);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(!res.equals(""))
		return res;
		else
			return "error";
	}
	public static void main(String[] args) {
		System.out.println(ope("2017-07-01"));
	}
}
