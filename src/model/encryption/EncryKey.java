package model.encryption;

import Control.controller.PathReader;
import com.KR;
import com.KU;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.math.BigInteger;
import java.util.Random;

public class EncryKey {
    private static KR kr;
    private static KU ku;

    private static int prime(BigInteger a, BigInteger b){
        BigInteger c;
        while(!(c = a.mod(b)).toString().equals("0")){
            a = b;
            b = c;
        }
        return b.intValue();
    }

    private static void createKey(){
        BigInteger p = BigInteger.probablePrime(500, new Random());  // p
        BigInteger q = BigInteger.probablePrime(500, new Random());  // q
        BigInteger n = p.multiply(q);
        BigInteger temp = (p.subtract(new BigInteger("1"))).multiply(q.subtract(new BigInteger("1")));
        BigInteger e = new BigInteger("2");
        while(prime(temp,e) != 1){
            e = e.add(new BigInteger("1"));
        }
        BigInteger d = e.modPow(new BigInteger("-1"),temp);
        kr = new KR(d,n);
        ku = new KU(e,n);
    }

    private EncryKey(){
        if(kr == null || ku == null){
            createKey();
        }
    }

    public static KR getKr() {
        if(kr == null){
            createKey();
        }
        return kr;
    }

    public static KU getKu() {
        if(ku == null){
            createKey();
        }
        return ku;
    }

}
