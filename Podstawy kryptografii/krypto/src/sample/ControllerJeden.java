package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;
import sample.model.BitArray;
import sample.model.DES;
import sample.model.DESKey;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class ControllerJeden {
    @FXML
    TextArea dataField = new TextArea();
    @FXML
    TextField keyField1 = new TextField();
    @FXML
    TextField keyField2 = new TextField();
    @FXML
    TextField pathField = new TextField();
    @FXML
    TextArea resultField = new TextArea();
    @FXML
    Button encryptButtonText = new Button();
    @FXML
    Button decryptButtonText = new Button();
    @FXML
    Button encryptButtonFile = new Button();
    @FXML
    Button decryptButtonFile = new Button();
    @FXML
    Button directoryButton = new Button();
    @FXML
    Button saveFileButton = new Button();

    byte[] bytes;

    public void encryptText() {
        String result = "";
        String WholeFuckingData = dataField.getText()
                .replace("\n", "|").replace("ą", "a")
                .replace("ń", "n").replace("ó", "o")
                .replace("ć", "c").replace("ł","l")
                .replace("ź", "z").replace("ż", "z")
                .replace("ś", "s").replace("ę", "e");
        String[] data = new String[(int)Math.ceil(WholeFuckingData.length()/8.0)];
        for(int i = 0; i < data.length; i++){
            if(i == data.length-1) {
                data[i] = WholeFuckingData.substring(i*8);
                while(data[i].length()<8){
                    data[i] = data[i] + " ";
                }
            }else {
                data[i] = WholeFuckingData.substring(i*8, i*8+8);
            }
        }

        DESKey keyOne = new DESKey(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        DESKey keyTwo = new DESKey(BitArray.stringToBitArray(keyField2.getText()).getBytes());


        for(String block :data){
            result += DES.tripleDES(
                    BitArray.stringToBitArray(block),
                    keyOne,
                    keyTwo,
                    true).bitArrayToHexString();


        }
        resultField.setText(result);
    }

    public void decryptText() {
        String result = "";
        String[] data =dataField.getText().split("(?<=\\G.{16})");

        DESKey keyOne = new DESKey(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        DESKey keyTwo = new DESKey(BitArray.stringToBitArray(keyField2.getText()).getBytes());

        for(String block :data){
            result += DES.tripleDES(
                    BitArray.hexStringToBitArray(block),
                    keyOne,
                    keyTwo,
                    false).bitArrayToString();

        }
        resultField.setText(result.replace('|', '\n'));
    }

    public void encryptFile() throws IOException {
        byte[][] blocks = new byte[bytes.length/8][];
        for(int i = 0; i < blocks.length; i++){
            blocks[i] = Arrays.copyOfRange(bytes, i*8, i*8+8);
        }

        DESKey keyOne = new DESKey(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        DESKey keyTwo = new DESKey(BitArray.stringToBitArray(keyField2.getText()).getBytes());

        byte[] result = new byte[bytes.length];

        for(int i = 0; i < blocks.length; i++){
            System.arraycopy(DES.tripleDES(new BitArray(blocks[i]), keyOne, keyTwo, true).getBytes(), 0, result, i*8, blocks[i].length);
        }

        try (FileOutputStream stream = new FileOutputStream("encrypted")) {
            stream.write(result);
        }
    }

    public void decryptFile() throws IOException {
        byte[][] blocks = new byte[bytes.length/8][];
        for(int i = 0; i < blocks.length; i++){
            blocks[i] = Arrays.copyOfRange(bytes, i*8, i*8+8);
        }

        DESKey keyOne = new DESKey(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        DESKey keyTwo = new DESKey(BitArray.stringToBitArray(keyField2.getText()).getBytes());

        byte[] result = new byte[bytes.length];

        for(int i = 0; i < blocks.length; i++){
            System.arraycopy(DES.tripleDES(new BitArray(blocks[i]), keyOne, keyTwo, false).getBytes(), 0, result, i*8, blocks[i].length);
        }

        try (FileOutputStream stream = new FileOutputStream("decrypted")) {
            stream.write(result);
        }
    }

    public void chooseFile() throws IOException {
        FileChooser fileChooser = new FileChooser();
        fileChooser.setTitle("Wybierz plik");
            File selectedDirectory = fileChooser.showOpenDialog(pathField.getScene().getWindow());
            pathField.setText(selectedDirectory.getAbsolutePath());

            try {
                bytes = Files.readAllBytes(Paths.get(pathField.getText()));
            } catch (IOException e) {
                e.printStackTrace();
            }
    }

    public void saveFile(){
        BitArray bitArray = BitArray.bitStringToBitArray("010011011000110111");
        BitArray bitArray1 = new BitArray(new byte[]{bitArray.getByte(2)});
        System.out.println("haha taka zmyłka");
    }

}


