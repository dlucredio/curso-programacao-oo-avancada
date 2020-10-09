package br.ufscar.dc.pooa.ocp3;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.ProgramContext;

public class Transformation {
    public enum TransformationType {
        finals
    };

    private ProgramContext transformation;
    private TransformationVisitor visitor;

    public Transformation(TransformationType t) throws IOException {
        CharStream cs = CharStreams
                .fromStream(Transformation.class.getResourceAsStream("/" + t.name() + ".transf"));
        CsvProcessingLexer lexer = new CsvProcessingLexer(cs);
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        CsvProcessingParser parser = new CsvProcessingParser(tokens);
        transformation = parser.program();
        visitor = new TransformationVisitor();
    }

    public static List<String> getAvailableTransformations() {
        List<TransformationType> list = Arrays.asList(TransformationType.values());
        return list.stream().map(t -> t.name()).collect(Collectors.toList());
    }

    public String[] applyTransformation(String[] data) {
        return visitor.visit(data, transformation);
    }

    public String[] getTitles() {
        return visitor.getTitles(transformation);
    }
}
