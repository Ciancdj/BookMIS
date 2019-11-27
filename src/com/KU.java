package com;

import java.io.Serializable;
import java.math.BigInteger;

// 公钥
public class KU implements Serializable {
    private static final long serialVersionUID = 1L;
    private BigInteger e;
    private BigInteger n;

    public KU(BigInteger e, BigInteger n){
        this.e = e;
        this.n = n;
    }

    public void setN(BigInteger n) {
        this.n = n;
    }

    public BigInteger getN() {
        return n;
    }

    public void setE(BigInteger e) {
        this.e = e;
    }

    public BigInteger getE() {
        return e;
    }
}
