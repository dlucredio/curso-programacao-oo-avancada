package br.ufscar.dc.pooa.ocp3;

import java.util.ArrayList;
import java.util.List;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.CommandContext;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.ExpressionContext;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.FactorContext;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.ProgramContext;
import br.ufscar.dc.pooa.ocp3.CsvProcessingParser.TermContext;

public class TransformationVisitor extends CsvProcessingBaseVisitor<Double> {
    String[] data;
    List<String> ret;

    public String[] getTitles(ProgramContext ctx) {
        List<String> ret = new ArrayList<>();
        for (CommandContext cc : ctx.command()) {
            ret.add(cc.STRING().getSymbol().getText());
        }
        return ret.stream().toArray(String[]::new);
    }

    public String[] visit(String[] data, ProgramContext ctx) {
        this.data = data;
        ret = new ArrayList<>();

        visitProgram(ctx);
        return ret.stream().toArray(String[]::new);
    }

    @Override
    public Double visitCommand(CommandContext ctx) {
        if (ctx.INT() != null) {
            int columnIndex = Integer.parseInt(ctx.INT().getSymbol().getText());
            ret.add(data[columnIndex]);
        }
        if (ctx.expression() != null) {
            ret.add(Double.toString(visitExpression(ctx.expression())));
        }

        return null;
    }

    @Override
    public Double visitExpression(ExpressionContext ctx) {
        Double val = null;
        int i = 0;
        for (TermContext tc : ctx.term()) {
            Double aux = visitTerm(tc);
            if (val == null) {
                val = aux;
            } else {
                String operator = ctx.OP1(i - 1).getSymbol().getText();
                if (operator.equals("+")) {
                    val += aux;
                } else {
                    val -= aux;
                }
            }
            i++;
        }
        return val;
    }

    @Override
    public Double visitTerm(TermContext ctx) {
        Double val = null;
        int i = 0;
        for (FactorContext fc : ctx.factor()) {
            Double aux = visitFactor(fc);
            if (val == null) {
                val = aux;
            } else {
                String operator = ctx.OP2(i - 1).getSymbol().getText();
                if (operator.equals("*")) {
                    val *= aux;
                } else {
                    val /= aux;
                }
            }
            i++;
        }
        return val;
    }

    @Override
    public Double visitFactor(FactorContext ctx) {
        if (ctx.input != null) {
            int columnIndex = Integer.parseInt(ctx.input.getText());
            return Double.parseDouble(data[columnIndex]);
        } else if (ctx.output != null) {
            int columnIndex = Integer.parseInt(ctx.output.getText());
            return Double.parseDouble(ret.get(columnIndex));
        } else if (ctx.DOUBLE() != null) {
            return Double.parseDouble(ctx.DOUBLE().getSymbol().getText());
        } else {
            return visitExpression(ctx.expression());
        }
    }
}
