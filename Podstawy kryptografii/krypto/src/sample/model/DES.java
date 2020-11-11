package sample.model;

public class DES {
    PermuteTable initialPermute = new PermuteTable(new byte[]{58, 50, 42, 34, 26, 18, 10, 2, 60, 52, 44, 36, 28, 20, 12, 4,
                                                            62, 54, 46, 38, 30, 22, 14, 6,	64,	56,	48,	40,	32,	24,	16,	8,
                                                            57, 49, 41, 33, 25, 17, 9, 1, 59, 51, 43, 35, 27, 19, 11, 3,
                                                            61, 53, 45, 37, 29, 21, 13, 5,	63,	55,	47,	39,	31,	23,	15,	7});

    PermuteTable finalPermute = new PermuteTable(new byte[]{40, 8, 48, 16, 56, 24, 64, 32, 39, 7, 47, 15, 55,23, 63, 31,
                                                            38, 6,	46,	14,	54,	22,	62,	30,	37,	5, 45, 13, 53, 21, 61, 29,
                                                            36, 4,	44,	12,	52,	20,	60,	28,	35,	3, 43, 11, 51, 19, 59, 27,
                                                            34, 2,	42,	10,	50,	18,	58,	26,	33,	1, 41, 9, 49, 17, 57, 25});

    PermuteTable extendingPermute = new PermuteTable(new byte[]{32, 1, 2, 3, 4, 5, 4, 5, 6, 7, 8, 9,
                                                                8, 9, 10, 11, 12, 13, 12, 13, 14, 15, 16, 17,
                                                                16, 17, 18, 19, 20, 21, 20, 21, 22, 23, 24, 25,
                                                                24, 25, 26, 27, 28, 29, 28, 29, 30, 31, 32, 1});

    PermuteTable pBlockPermute = new PermuteTable(new byte[]{16, 7, 20, 21, 29, 12, 28, 17,
                                                                1, 15, 23, 26, 5, 18, 31, 10,
                                                                2, 8, 24, 14, 32, 27, 3, 9,
                                                                19, 13, 30, 6, 22, 11, 4, 25});

/*
    public String tripleDES(String dataString, String keyStringOne, String keyStringTwo, boolean notEncoded){
        BitArray data;

        if(notEncoded){
            data = BitArray.stringToBitArray(dataString);
        }else{
            data = BitArray.hexStringToBitArray(dataString);
        }

        data = singleDES(data, keyStringOne, notEncoded);
        data = singleDES(data, keyStringTwo, !notEncoded);
        if(notEncoded){
            return singleDES(data, keyStringOne, notEncoded).bitArrayToHexString();
        }else{
            return singleDES(data, keyStringOne, notEncoded).bitArrayToString();
        }
    }

    public BitArray singleDES(BitArray data, String keyString, boolean mode) {
        Key key = new Key(BitArray.stringToBitArray(keyString).getBits());
        Sbox sbox = new Sbox();

        data = data.permute(initialPermute);
        BitArray[] keys = key.generateIterableKeys();

        BitArray dataR = data.divide(32, 32);
        BitArray dataL = data;

        for(int i = 0; i < 16; i++) {
            BitArray pom = new BitArray(dataR.getBits());

            //początek funkcji f
            dataR = dataR.permute(extendingPermute);
            if(mode){
                dataR = dataR.XOR(keys[i]);
            } else {
                dataR = dataR.XOR(keys[15-i]);
            }
            dataR = sbox.transformArray(dataR);
            dataR = dataR.permute(pBlockPermute);
            //koniec funkcji f

            dataR = dataR.XOR(dataL);
            dataL= pom;
        }
        return dataR.connect(dataL).permute(finalPermute);
    }

 */
}
