grammar CsvProcessing;

STRING: '"' ~('"')*? '"';
INT: [0-9]+;
DOUBLE: [0-9]+ '.' [0-9]+;
OP1: '+' | '-';
OP2: '*' | '/';
WS: [ \r\n\t] -> skip;

program: command* EOF;
command: STRING ('copy' '[' INT ']' | 'calculate' expression);
expression: term (OP1 term)*;
term: factor (OP2 factor)*;
factor: '[' input=INT ']' | '{' output=INT '}' | DOUBLE | '(' expression ')';