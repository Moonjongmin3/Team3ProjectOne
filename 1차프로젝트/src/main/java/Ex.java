

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.safety.Whitelist;
import org.jsoup.select.Elements;

public class Ex {
	public static void main(String[] args) {
		String str = "감정 별로 분리되어있던 도깨비 한텐구의 본체를 제외하고 다른 것들이 합체하며 탄지로를 공격한다! 한텐구한테서 「약자」를 괴롭힌다는 소리를 듣고 고전 중이던 탄지로는 분개하는데?! 한편, 하주 토키토는 과거 기억을 되찾고, 굣코와 대치한다. 그러자, 토키토에게 변화가?";
		Document doc = Jsoup.parse(str);		
		
		Elements elements = doc.select("iframe");
		for (Element element : elements) {
			element.remove();
		}
		
		str = doc.html().replace("<br>", "$$");
		Document doc1 = Jsoup.parse(str);
        String text = doc1.body().text().replace("$$", "\n").toString();
        System.out.println(text);
				
	}
}
