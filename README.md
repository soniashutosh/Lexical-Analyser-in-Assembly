# Lexical Analyser in Assembly
 
**Aim: Implement Lexical Analyser using LEX program and analyse the output.**

Introduction: 
	Lexical analyser is also known as ‘Scanner’. Its main job is to convert given input source file into stream of tokens.
	Programmatically, lex is a tool for automatically generating a scanner starting from lex specification.

Lexical Program Consists of three parts
1)	Declarations
2)	Transition Rules
3)	Auxiliary procedures

**Procedure to run Lex Program:**

**Step 1:** Install Flex in Ubuntu
      sudo apt-get update
      sudo apt-get install flex
**Step 2:** Run command on lexical complier
     	lex filename.l
     	This will change the .l file to .yy.c file.
**Step 3:** Run command  on C compiler
    	gcc lex.yy.c 
   	As output of this we get a.out file
**Step 4:** ./a.out inputfile.cpp

![image](https://github.com/soniashutosh/Lexical-Analyser-in-Assembly/assets/46646804/255ae900-f854-4916-881f-d84500474c51)
