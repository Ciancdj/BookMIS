package com;

import java.io.Serializable;
import java.math.BigInteger;

// 私钥
public class KR implements Serializable {
    private static final long serialVersionUID = 1L;
    private BigInteger d;
    private BigInteger n;

    public KR(BigInteger d, BigInteger n){
        this.d = d;
        this.n = n;
    }

    public void setD(BigInteger d){
        this.d = d;
    }

    public BigInteger getD() {
        return d;
    }

    public void setN(BigInteger n) {
        this.n = n;
    }

    public BigInteger getN() {
        return n;
    }
}
