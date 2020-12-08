package sample;

import javafx.application.Application;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.stage.Stage;


public class Main extends Application {

    @Override
    public void start(Stage primaryStage) throws Exception{

        Parent root = FXMLLoader.load(getClass().getResource("zadanie2.fxml"));
        primaryStage.setTitle("Blum-Micali");
        primaryStage.setScene(new Scene(root, 1168, 827));
        Scene scene = primaryStage.getScene();
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);

    }


}
