package sample.model;

public class StreamCypher {
    public static BitArray cypher(BitArray data, BitArray key){
        BitArray SCKey = new BitArray(BlumMicali.generateArray(key, data.getLength()).getBytes());
        return data.XOR(SCKey);
    }
}
