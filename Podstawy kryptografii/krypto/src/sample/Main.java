package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.TextField;
import javafx.stage.Stage;
import sample.model.BitArray;

public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{
        Parent root = FXMLLoader.load(getClass().getResource("sample.fxml"));
        primaryStage.setTitle("Hello World");
        primaryStage.setScene(new Scene(root, 600, 400));




        Scene scene = primaryStage.getScene();

        TextField dataField = (TextField ) scene.lookup("#dataField");
        TextField keyField = (TextField ) scene.lookup("#keyField");
        TextField resultField = (TextField ) scene.lookup("#resultField");
        Button button = (Button) scene.lookup("#button");



        button.setOnAction(actionEvent ->  {
            resultField.setText(krypto(dataField.getCharacters().toString(), keyField.getCharacters().toString()));
        });



        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }

    private String krypto(String data, String key){
        boolean[] bits = {true, true, false};
        BitArray test = new BitArray(data);
        return test.toString();
    }
}
