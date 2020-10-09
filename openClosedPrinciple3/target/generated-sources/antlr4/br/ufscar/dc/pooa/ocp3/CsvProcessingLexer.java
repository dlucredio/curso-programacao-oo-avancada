// Generated from br/ufscar/dc/pooa/ocp3/CsvProcessing.g4 by ANTLR 4.8
package br.ufscar.dc.pooa.ocp3;
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class CsvProcessingLexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.8", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		T__0=1, T__1=2, T__2=3, T__3=4, T__4=5, T__5=6, T__6=7, T__7=8, STRING=9, 
		INT=10, DOUBLE=11, OP1=12, OP2=13, WS=14;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"T__0", "T__1", "T__2", "T__3", "T__4", "T__5", "T__6", "T__7", "STRING", 
			"INT", "DOUBLE", "OP1", "OP2", "WS"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'copy'", "'['", "']'", "'calculate'", "'{'", "'}'", "'('", "')'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, null, null, null, null, null, null, null, null, "STRING", "INT", 
			"DOUBLE", "OP1", "OP2", "WS"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}


	public CsvProcessingLexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "CsvProcessing.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\20[\b\1\4\2\t\2\4"+
		"\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t"+
		"\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3"+
		"\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b"+
		"\3\t\3\t\3\n\3\n\7\n=\n\n\f\n\16\n@\13\n\3\n\3\n\3\13\6\13E\n\13\r\13"+
		"\16\13F\3\f\6\fJ\n\f\r\f\16\fK\3\f\3\f\6\fP\n\f\r\f\16\fQ\3\r\3\r\3\16"+
		"\3\16\3\17\3\17\3\17\3\17\3>\2\20\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21\n\23"+
		"\13\25\f\27\r\31\16\33\17\35\20\3\2\7\3\2$$\3\2\62;\4\2--//\4\2,,\61\61"+
		"\5\2\13\f\17\17\"\"\2^\2\3\3\2\2\2\2\5\3\2\2\2\2\7\3\2\2\2\2\t\3\2\2\2"+
		"\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2\2\2\2\23\3\2\2\2\2\25"+
		"\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2\2\35\3\2\2\2\3\37\3\2"+
		"\2\2\5$\3\2\2\2\7&\3\2\2\2\t(\3\2\2\2\13\62\3\2\2\2\r\64\3\2\2\2\17\66"+
		"\3\2\2\2\218\3\2\2\2\23:\3\2\2\2\25D\3\2\2\2\27I\3\2\2\2\31S\3\2\2\2\33"+
		"U\3\2\2\2\35W\3\2\2\2\37 \7e\2\2 !\7q\2\2!\"\7r\2\2\"#\7{\2\2#\4\3\2\2"+
		"\2$%\7]\2\2%\6\3\2\2\2&\'\7_\2\2\'\b\3\2\2\2()\7e\2\2)*\7c\2\2*+\7n\2"+
		"\2+,\7e\2\2,-\7w\2\2-.\7n\2\2./\7c\2\2/\60\7v\2\2\60\61\7g\2\2\61\n\3"+
		"\2\2\2\62\63\7}\2\2\63\f\3\2\2\2\64\65\7\177\2\2\65\16\3\2\2\2\66\67\7"+
		"*\2\2\67\20\3\2\2\289\7+\2\29\22\3\2\2\2:>\7$\2\2;=\n\2\2\2<;\3\2\2\2"+
		"=@\3\2\2\2>?\3\2\2\2><\3\2\2\2?A\3\2\2\2@>\3\2\2\2AB\7$\2\2B\24\3\2\2"+
		"\2CE\t\3\2\2DC\3\2\2\2EF\3\2\2\2FD\3\2\2\2FG\3\2\2\2G\26\3\2\2\2HJ\t\3"+
		"\2\2IH\3\2\2\2JK\3\2\2\2KI\3\2\2\2KL\3\2\2\2LM\3\2\2\2MO\7\60\2\2NP\t"+
		"\3\2\2ON\3\2\2\2PQ\3\2\2\2QO\3\2\2\2QR\3\2\2\2R\30\3\2\2\2ST\t\4\2\2T"+
		"\32\3\2\2\2UV\t\5\2\2V\34\3\2\2\2WX\t\6\2\2XY\3\2\2\2YZ\b\17\2\2Z\36\3"+
		"\2\2\2\7\2>FKQ\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}