/* Program for Lexical Analyser */
/* Declaration Part */

%{

	int comment = 0;
	int count_of_comment = 0;

%}
identifier [a-zA-Z_][a-zA-Z0-9]*
/* Transition Rules */

%%
#.*  { printf("\n%s is a PREPROCESSOR DIRECTIVE \n",yytext); }

auto | 
break | 
case | 
char | 
continue | 
do | 
default | 
const | 
double | 
else | 
enum |
extern | 
for | 
if | 
goto | 
float | 
int | 
long | 
register | 
return | 
signed | 
static |
sizeof | 
short | 
struct | 
typedef | 
union | 
void | 
while | 
volatile | 
unsigned { printf(" %s is a KEYWORD \n",yytext); }

"/*" { comment = 1; }
"*/" { comment = 0;
count_of_comment++; }

{identifier}\( { 
	if(!comment)
		printf("\nFUNCTION   %s \n",yytext);
	}
	\{ {
		if(!comment)
			printf("\t BLOCK BEGINS \n");
	}
	\} {
		if(!comment)
			printf("\t BLOCK ENDS \n");
	}
	{identifier}(\[[0-9]*\])? {
		if(!comment)
			printf("\t %s is a IDENTIFIER \n",yytext);
	}
	\".*\" {
		if(!comment) 
		printf("\t %s is a STRING \n",yytext);
}
	[0-9]+ {
		if(!comment)
			printf("\t %s is a NUMBER \n",yytext);
	}
\)(\;)? {
	if(!comment)
		printf("\n");
	ECHO;
}
\(
	ECHO;
	= {
		if(!comment)
			printf("\t %s is a ASSIGNMENT OPERATOR \n",yytext);
	}
	\ <= |
	\ >= |
	\ <  |
	\ == |
	\ > {
		if(!comment)
			printf("\t %s is a RELATIONAL OPERATOR \n",yytext);
	}

%%

int main(int argc,char *argv[]){
	if(argc!=2){
		printf("Please give input file \n");
		printf("terminating...\n");
		exit(0);
	}

	FILE *file = NULL ;
	file = fopen(argv[1],"r");
	if(file == NULL){
		printf("Error in opening file \n");
		printf("Try again ... \n terminating ....\n");
		exit(0);
	}

	yyin = file;

	yylex();

	printf(" \n Total number of comments in this file is %d \n",count_of_comment);
	return 0;

}

int yywrap()
{
	return 1;
}
