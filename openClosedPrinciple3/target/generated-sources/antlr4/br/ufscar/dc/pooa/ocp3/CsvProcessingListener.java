// Generated from br/ufscar/dc/pooa/ocp3/CsvProcessing.g4 by ANTLR 4.8
package br.ufscar.dc.pooa.ocp3;
import org.antlr.v4.runtime.tree.ParseTreeListener;

/**
 * This interface defines a complete listener for a parse tree produced by
 * {@link CsvProcessingParser}.
 */
public interface CsvProcessingListener extends ParseTreeListener {
	/**
	 * Enter a parse tree produced by {@link CsvProcessingParser#program}.
	 * @param ctx the parse tree
	 */
	void enterProgram(CsvProcessingParser.ProgramContext ctx);
	/**
	 * Exit a parse tree produced by {@link CsvProcessingParser#program}.
	 * @param ctx the parse tree
	 */
	void exitProgram(CsvProcessingParser.ProgramContext ctx);
	/**
	 * Enter a parse tree produced by {@link CsvProcessingParser#command}.
	 * @param ctx the parse tree
	 */
	void enterCommand(CsvProcessingParser.CommandContext ctx);
	/**
	 * Exit a parse tree produced by {@link CsvProcessingParser#command}.
	 * @param ctx the parse tree
	 */
	void exitCommand(CsvProcessingParser.CommandContext ctx);
	/**
	 * Enter a parse tree produced by {@link CsvProcessingParser#expression}.
	 * @param ctx the parse tree
	 */
	void enterExpression(CsvProcessingParser.ExpressionContext ctx);
	/**
	 * Exit a parse tree produced by {@link CsvProcessingParser#expression}.
	 * @param ctx the parse tree
	 */
	void exitExpression(CsvProcessingParser.ExpressionContext ctx);
	/**
	 * Enter a parse tree produced by {@link CsvProcessingParser#term}.
	 * @param ctx the parse tree
	 */
	void enterTerm(CsvProcessingParser.TermContext ctx);
	/**
	 * Exit a parse tree produced by {@link CsvProcessingParser#term}.
	 * @param ctx the parse tree
	 */
	void exitTerm(CsvProcessingParser.TermContext ctx);
	/**
	 * Enter a parse tree produced by {@link CsvProcessingParser#factor}.
	 * @param ctx the parse tree
	 */
	void enterFactor(CsvProcessingParser.FactorContext ctx);
	/**
	 * Exit a parse tree produced by {@link CsvProcessingParser#factor}.
	 * @param ctx the parse tree
	 */
	void exitFactor(CsvProcessingParser.FactorContext ctx);
}