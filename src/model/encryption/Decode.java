package model.encryption;

import com.KR;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.math.BigInteger;

/**
 * 解密方法
 */
public class Decode {

    public static String decode(String str){
        str = str.toLowerCase();
        String keyword = "";
        String []key = new String[(int)(str.length()/16)];
        for(int index = 0; index < key.length; index++){
            key[index] = "";
        }
        // 拆分字符串
        for(int index = 0; index < key.length; index++){
            key[index] = str.substring(index*16,(index+1)*16);
        }
//        System.out.println("decode " + str);
        for(int index = key.length-1; index >=0 ; index--){
            keyword += (char)Integer.parseInt(shift(hexTdec(key[index])));
        }
        return keyword;
    }

    // 16进制转10进制
    private static BigInteger hexTdec(String str){
        BigInteger value = new BigInteger("0");
        for(int index = 0; index < str.length(); index++){
            if(str.charAt(index) >= '0' && str.charAt(index) <= '9'){
                value = value.multiply(new BigInteger("16")).
                        add(new BigInteger(String.valueOf((int)(str.charAt(index) - '0'))));
            }else if(str.charAt(index) >= 'a' && str.charAt(index) <= 'f'){
                value = value.multiply(new BigInteger("16")).
                        add(new BigInteger(String.valueOf((int)(str.charAt(index) - 'a' + 10))));
            }
        }
        return value;
    }

    // 将数字变为原本的字符
    private static String shift(BigInteger value){
        BigInteger M = value.modPow(EncryKey.getKr().getD(),EncryKey.getKr().getN());
        return(M.toString());
    }

//    public static void main(String[] args){
//        Decode.decode("000000b5e620f4800000009de93ece5100001177422c652f0000224fa5cdc9270000283a69011fa90000618298ae6ccd00000c23e9f71183");
//    }
}
