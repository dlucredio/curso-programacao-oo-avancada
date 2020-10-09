// Generated from br/ufscar/dc/pooa/ocp3/CsvProcessing.g4 by ANTLR 4.8
package br.ufscar.dc.pooa.ocp3;
import org.antlr.v4.runtime.tree.ParseTreeVisitor;

/**
 * This interface defines a complete generic visitor for a parse tree produced
 * by {@link CsvProcessingParser}.
 *
 * @param <T> The return type of the visit operation. Use {@link Void} for
 * operations with no return type.
 */
public interface CsvProcessingVisitor<T> extends ParseTreeVisitor<T> {
	/**
	 * Visit a parse tree produced by {@link CsvProcessingParser#program}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitProgram(CsvProcessingParser.ProgramContext ctx);
	/**
	 * Visit a parse tree produced by {@link CsvProcessingParser#command}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitCommand(CsvProcessingParser.CommandContext ctx);
	/**
	 * Visit a parse tree produced by {@link CsvProcessingParser#expression}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitExpression(CsvProcessingParser.ExpressionContext ctx);
	/**
	 * Visit a parse tree produced by {@link CsvProcessingParser#term}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitTerm(CsvProcessingParser.TermContext ctx);
	/**
	 * Visit a parse tree produced by {@link CsvProcessingParser#factor}.
	 * @param ctx the parse tree
	 * @return the visitor result
	 */
	T visitFactor(CsvProcessingParser.FactorContext ctx);
}