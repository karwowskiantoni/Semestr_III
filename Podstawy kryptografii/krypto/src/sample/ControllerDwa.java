package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.FileChooser;
import sample.model.BitArray;
import sample.model.DES;
import sample.model.DESKey;
import sample.model.StreamCypher;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.Arrays;

public class ControllerDwa {
    @FXML
    TextArea dataField = new TextArea();
    @FXML
    TextField keyField1 = new TextField();
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
        String WholeFuckingData = dataField.getText()
                .replace("\n", "|").replace("ą", "a")
                .replace("ń", "n").replace("ó", "o")
                .replace("ć", "c").replace("ł","l")
                .replace("ź", "z").replace("ż", "z")
                .replace("ś", "s").replace("ę", "e");
        BitArray data = BitArray.stringToBitArray(WholeFuckingData);
        BitArray key = BitArray.stringToBitArray(keyField1.getText());
        resultField.setText(StreamCypher.cypher(data, key)
                            .bitArrayToHexString());
    }

    public void decryptText() {
        BitArray data = BitArray.hexStringToBitArray(dataField.getText());
        BitArray key = BitArray.stringToBitArray(keyField1.getText());
        resultField.setText(StreamCypher.cypher(data, key)
                            .bitArrayToString()
                            .replace('|', '\n'));
    }

    public void encryptFile() throws IOException {
        BitArray key = BitArray.stringToBitArray(keyField1.getText());
        BitArray data = new BitArray(bytes);
        BitArray result = StreamCypher.cypher(data, key);
        try (FileOutputStream stream = new FileOutputStream("encrypted")) {
            stream.write(result.getBytes());
        }
    }

    public void decryptFile() throws IOException {
        BitArray key = BitArray.stringToBitArray(keyField1.getText());
        BitArray data= new BitArray(bytes);
        BitArray result = StreamCypher.cypher(data, key);

        try (FileOutputStream stream = new FileOutputStream("decrypted")) {
            stream.write(result.getBytes());
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
        System.out.println("haha taka zmyłka");
    }
}
