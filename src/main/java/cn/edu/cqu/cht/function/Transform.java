package cn.edu.cqu.cht.function;

/**
 * @author chenhantao
 * @since 2018/10/17
 */
public class Transform {
    /**
     * 根据 - 分割字符串，用于分割地区
     * @param address 储存的地区字符串
     * @param areas 返回的分段
     */
    public static void transformArea(String address, String[] areas){
        int num = 0;
        StringBuilder addr = new StringBuilder(address);
        StringBuilder temp = new StringBuilder();
        for (int i = 0; i < addr.length(); i++){
            if (addr.charAt(i) != '-'){
                temp.append(addr.charAt(i));
            }else {
                areas[num] = temp.toString();
                num++;
                temp.delete(0,temp.length());
            }
        }
    }
}
