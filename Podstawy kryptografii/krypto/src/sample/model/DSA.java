package sample.model;

import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Random;

public class DSA {

    private static final BigInteger ZERO = BigInteger.valueOf(0);
    private static final BigInteger ONE = BigInteger.valueOf(1);
    private static final BigInteger TWO = BigInteger.valueOf(2);
    private static final BigInteger THREE = BigInteger.valueOf(3);

    public static BigInteger[] generateSignature(BigInteger a, BitArray dane) throws  NoSuchAlgorithmException{

        MessageDigest sha_256 = MessageDigest.getInstance("SHA-256");
        sha_256.update(dane.getBytes());
        BigInteger H = new BigInteger(sha_256.digest());

        BigInteger q = generateQNumber();
        BigInteger p = generatePNumber(q);
        BigInteger g = generateGNumber(p, q);
        BigInteger b = generateBNumber(a, g, p);

        BigInteger kPrim, X, r, s;
        do {
            BigInteger k = new BigInteger(160, new Random()).mod(q.subtract(ONE)).add(ONE);
            X = g.modPow(k, p);
            r = X.mod(q);

            kPrim = k.modInverse(q);
            s = (kPrim.multiply(H.add(a.multiply(r)))).mod(q);

        }
        while(s.equals(ZERO) || r.equals(ZERO));

        return new BigInteger[] {r, s, q, p, g, b};
    }

    public static boolean verifySignature(BigInteger[] publicParameters, BitArray dane) throws NoSuchAlgorithmException {

        MessageDigest sha_256 = MessageDigest.getInstance("SHA-256");
        sha_256.update(dane.getBytes());
        BigInteger H = new BigInteger(sha_256.digest());

        BigInteger r = publicParameters[0];
        BigInteger s = publicParameters[1];
        BigInteger q = publicParameters[2];
        BigInteger p = publicParameters[3];
        BigInteger g = publicParameters[4];
        BigInteger b = publicParameters[5];

        BigInteger sPrim = s.modInverse(q);
        BigInteger uOne = (H.multiply(sPrim)).mod(q);
        BigInteger uTwo = (r.multiply(sPrim)).mod(q);
        BigInteger t = g.mod(p).modPow(uOne, p).multiply(b.mod(p).modPow(uTwo, p)).mod(p).mod(q);
        return t.equals(r);
    }

    private static BigInteger generateQNumber() {
        return BigInteger.probablePrime(160, new Random());
    }

    private static BigInteger generatePNumber(BigInteger q) {
        Random random = new Random();
        BigInteger p;
        int pBitLength = 64 * (7 + random.nextInt(9));
        do {
            p = BigInteger.probablePrime(pBitLength, random);
            p = p.subtract(p.subtract(ONE).remainder(q));
        }
        while (!(p.isProbablePrime(4)));
        return p;
    }

    private static BigInteger generateGNumber(BigInteger p, BigInteger q) {
        BigInteger g;
        do {
            BigInteger h = new BigInteger(p.bitLength(), new Random()).mod(p.subtract(THREE)).add(TWO);
            g = h.mod(p).modPow(p.subtract(ONE).divide(q), p);
        }
        while (!(g.compareTo(ONE) > 0 && g.compareTo(p) < 0 && g.mod(p).modPow(q, p).compareTo(ONE) == 0));
        return g;
    }

    private static BigInteger generateBNumber(BigInteger a, BigInteger g, BigInteger p) {
        BigInteger b;
        return b = g.modPow(a, p);
    }
}
