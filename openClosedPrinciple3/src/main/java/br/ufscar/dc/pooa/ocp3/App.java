package br.ufscar.dc.pooa.ocp3;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import br.ufscar.dc.pooa.ocp3.Transformation.TransformationType;

public class App {
    public static void main(String[] args) throws IOException {

        if (args.length < 3) {
            System.out.println("Usage:");
            System.out.println(
                    "java -jar openClosedPrinciple3-1.0-SNAPSHOT-jar-with-dependencies.jar <inputFile> <outputFile> <transformation>");
            System.out.println("Available transformations:");
            List<String> transformations = Transformation.getAvailableTransformations();
            for (String t : transformations) {
                System.out.println("- " + t);
            }
        } else {
            File inputFile = new File(args[0]);
            File outputFile = new File(args[1]);
            String transformation = args[2];

            List<String[]> inputData = new ArrayList<>();
            List<String[]> outputData = new ArrayList<>();

            try (BufferedReader br = new BufferedReader(new FileReader(inputFile))) {
                String line = br.readLine(); // headers
                while ((line = br.readLine()) != null) {
                    inputData.add(line.split(";"));
                }
            }

            Transformation t = new Transformation(TransformationType.valueOf(transformation));

            outputData.add(t.getTitles());
            for (String[] dataRow : inputData) {
                outputData.add(t.applyTransformation(dataRow));
            }

            try (PrintWriter pw = new PrintWriter(new FileWriter(outputFile))) {
                for(String[] outputDataRow : outputData) {
                    pw.println(String.join(";", outputDataRow));
                }
            }
        }
    }
}
