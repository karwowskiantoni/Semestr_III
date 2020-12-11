package sample.model;

public class StreamCypher {
    public static BitArray cypher(BitArray data, BitArray key){
        BitArray SCKey = new BitArray(BlumMicali.generateArray(key, data.getLength()).getBytes());
        System.out.println(data.bitArrayToBitString());
        System.out.println(SCKey.bitArrayToBitString());
        return data.XOR(SCKey);
    }
}
