package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextArea;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sample.model.BitArray;
import sample.model.Key;
import sample.model.PermuteTable;
import sample.model.Sbox;

public class Main extends Application {

    PermuteTable initialPermute = new PermuteTable(new byte[]{58, 50, 42, 34, 26, 18, 10, 2,	60,	52,	44,	36,	28,	20,	12,	4,
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

    PermuteTable volodymirPermute = new PermuteTable(new byte[]{16, 7, 20, 21, 29, 12, 28, 17,
                                                                1, 15, 23, 26, 5, 18, 31, 10,
                                                                2, 8, 24, 14, 32, 27, 3, 9,
                                                                19, 13, 30, 6, 22, 11, 4, 25});

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("Hello World");
        primaryStage.setScene(new Scene(root, 1168, 827));

        Scene scene = primaryStage.getScene();

        TextField dataField = (TextField ) scene.lookup("#dataField");
        TextField keyField = (TextField ) scene.lookup("#keyField");
        TextArea resultField = (TextArea ) scene.lookup("#resultField");
        Button button = (Button) scene.lookup("#button");



        button.setOnAction(actionEvent ->  {
            resultField.setText(krypto(dataField.getCharacters().toString(), keyField.getCharacters().toString()));
        });



        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

    private String krypto(String dataString, String keyString) {
        BitArray data = new BitArray(dataString);
        Key key = new Key(keyString);
        Sbox volodymir = new Sbox();

        data = data.permute(initialPermute);
        BitArray[] keys = key.generateIterableKeys();

        BitArray dataR = data.divide(32, 32);
        BitArray dataL = data;


        for(int i = 0; i < 16; i++){
            BitArray pom = new BitArray(dataR.getBits());

            dataR = dataR.permute(extendingPermute);
            dataR = dataR.XOR(keys[i]);
            dataR = volodymir.transformArray(dataR);
            dataR = dataR.permute(volodymirPermute);

            dataR = dataR.XOR(dataL);
            dataL= pom;
        }


        data = dataL.connect(dataR).permute(finalPermute);

        String result = data.toString();
        return result;
    }
}
