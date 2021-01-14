package sample;

import javafx.fxml.FXML;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.scene.layout.Pane;
import javafx.stage.FileChooser;
import sample.model.BitArray;
import sample.model.DSA;
import java.io.File;
import java.io.IOException;
import java.math.BigInteger;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.security.NoSuchAlgorithmException;


public class ControllerTrzy {
    @FXML
    TextField signatureVerifyField = new TextField();
    @FXML
    TextArea dataField = new TextArea();
    @FXML
    TextField keyField1 = new TextField();
    @FXML
    TextField pathField = new TextField();
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
    @FXML
    TextField qField = new TextField();
    @FXML
    TextField pField = new TextField();
    @FXML
    TextField gField = new TextField();
    @FXML
    TextField bField = new TextField();
    @FXML
    TextField rField = new TextField();
    @FXML
    TextField sField = new TextField();

    byte[] bytes;

    public void signText() throws NoSuchAlgorithmException {
        BitArray data = convertData();
        BigInteger key = new BigInteger(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        setResult(DSA.generateSignature(key, data));
        keyField1.setText("");
    }

    public void checkSignedText() throws NoSuchAlgorithmException {
        BitArray data = convertData();
        if(DSA.verifySignature(getResult(), data)){
            signatureVerifyField.setText("Weryfikacja podpisu przebiegła poprawnie");
        } else {
            signatureVerifyField.setText("Weryfikacja podpisu przebiegła niepoprawnie");
        }
    }

    public void signFile() throws NoSuchAlgorithmException {
        BigInteger key = new BigInteger(BitArray.stringToBitArray(keyField1.getText()).getBytes());
        BitArray data = new BitArray(bytes);
        setResult(DSA.generateSignature(key, data));
        keyField1.setText("");
    }

    public void checkSignedFile() throws NoSuchAlgorithmException {
        BitArray data = new BitArray(bytes);
        if(DSA.verifySignature(getResult(), data)){
            signatureVerifyField.setText("Weryfikacja podpisu przebiegła poprawnie");
        } else {
            signatureVerifyField.setText("Weryfikacja podpisu przebiegła niepoprawnie");
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

    public void saveFile() throws NoSuchAlgorithmException {
//        BigInteger kluczPrywatny = new BigInteger("1253");
//        BitArray dane = BitArray.stringToBitArray("kupsko");
//        int counter = 1;
//        int counterAll = 1;
//        while(true){
//
//            if(DSA.verifySignature(DSA.generateSignature(kluczPrywatny, dane), dane)){
//                System.out.println("trafiono " + counter + " na " + counterAll);
//                counter++;
//            }
//            counterAll++;
//        }
        System.out.println("Tajemniczy rozmówca: BAJO JAJO BAJO JAJO");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("");
        System.out.println("Marcin Najman: SŁUCHAJ FRAJERZYNO WYPIERDALAJ MI Z TEJ LINII KURWA BO JAK CIE ZARAZ JAK CIE KURWO ZŁAPIE TO ZOBACZYSZ");
    }
    private void setResult(BigInteger[] result){
        rField.setText(result[0].toString());
        sField.setText(result[1].toString());
        pField.setText(result[2].toString());
        qField.setText(result[3].toString());
        gField.setText(result[4].toString());
        bField.setText(result[5].toString());
    }
    
    private BigInteger[] getResult(){
        BigInteger[] result = new BigInteger[6];
        result[0] = new BigInteger(rField.getText());
        result[1] = new BigInteger(sField.getText());
        result[2] = new BigInteger(pField.getText());
        result[3] = new BigInteger(qField.getText());
        result[4] = new BigInteger(gField.getText());
        result[5] = new BigInteger(bField.getText());
        return result;
    }
    
    private BitArray convertData() {
        String Najmanito = dataField.getText()
                .replace("\n", "|").replace("ą", "a")
                .replace("ń", "n").replace("ó", "o")
                .replace("ć", "c").replace("ł", "l")
                .replace("ź", "z").replace("ż", "z")
                .replace("ś", "s").replace("ę", "e");
        return BitArray.stringToBitArray(Najmanito);
    }

}
