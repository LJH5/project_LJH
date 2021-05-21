package day18;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Set;

public class MapTest {

	public static void main(String[] args) {
		// Map 예제
		HashMap<String, String> map = new HashMap<String, String>();
		//put(key, value): key와 value에 값을 저장
		//key값이 중복되지 않으면 null을 리턴하고, 중복되면 이전에 저장된 값을 리턴
		System.out.println(map.put("과일", "사과"));
		System.out.println(map.put("과일", "포도"));
		System.out.println("Key에 과일이 있습니까?"+map.containsKey("과일"));
		System.out.println("Key에 포도가 있습니까?"+map.containsKey("포도"));
		System.out.println("Value에 과일이 있습니까?"+map.containsValue("과일"));
		System.out.println("Value에 포도가 있습니까?"+map.containsValue("포도"));
		System.out.println("Key값이 과일인 객체의 Value값은? "+map.get("과일"));
		System.out.println("---------------------");
		
		map.put("학용품", "연필");
		map.put("탈것", "자전거");
		map.put("전자기기", "스마트폰");
		//방법1: set을 이용하여 Iterator를 사용 
		//key값들을 set으로 만든 후 만들어진 set을 이용하여 반복문을 사용하는 경우
		//keySet(): map의 key값들을 하나의 Set으로 만들어주는 메소드 
		Set<String> keySet = map.keySet();
		Iterator<String> it = keySet.iterator();
		while(it.hasNext()) {
			String key = it.next();
			String value = map.get(key);
			System.out.println(key+": "+value);
		}
		System.out.println("---------------------");
		//방법2:set을 이용하여 Iterator를 사용 
		//Key값과 value값을 가지는 하나의 클래스인 Entry클래스를 이용하는 방법
		//entrySet(): Entry 클래스를 이용한 Set을 반환
		Set<Map.Entry<String, String>> entrySet = map.entrySet();
		Iterator<Map.Entry<String, String>> it2 = entrySet.iterator();
		while(it2.hasNext()) {
			Map.Entry<String, String> tmp = it2.next();
			String key = tmp.getKey();
			String value = tmp.getValue();
			System.out.println(key+": "+value);
		}
	}

}
class Entry{
	String key;
	String value;
}
