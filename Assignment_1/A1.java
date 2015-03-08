//Konstantin Polyashenko
//CSC 135 A1
//recursive-descent recognizer

/*
compiling and running instructions
1. open terminal/command-prompt
2. navigate to the folder that contains this program
3. run javac A1.java then java A1

program ::= statemt {statemt}
  statemt ::= asignmt | ifstmt | until | read | write
  asignmt ::= ident ~ exprsn ;
  ifstmt  ::= I comprsn @ {statemt} [% {statemt}] &
  until   ::= U ( comprsn ) D {statemt} \
  read    ::= R ident {, ident} ;
  write   ::= W ident {, ident} ;
  comprsn ::= ( oprnd opratr oprnd )
  exprsn  ::= factor {+ factor}
  factor  ::= oprnd {* oprnd}
  oprnd   ::= integer | ident | ( exprsn )
  opratr  ::= < | = | > | !
  ident   ::= letter {char}
  char    ::= letter | digit
  integer ::= digit {digit}
  letter  ::= _ | X | Y | Z
  digit   ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

  the tokens are: ~ ; I @ % & U ( ) D \ R , W + * < = > ! _ X Y Z 0 1 2 3 4 5 6 7 8 9
  nonterminals are shown as lowercase words.
*/

import java.io.*;
public class A1
{
  //string input from user
  static String inputString; 
  static int index = 0;
  static int errorFlag = 0;

  //main method to kick off program
  public static void main (String[] args) throws IOException
  {
    A1 recognizer = new A1();
    BufferedReader input = new BufferedReader
      (new InputStreamReader(System.in));

    System.out.print("\n" + "enter an expression: ");
    inputString = input.readLine();
    recognizer.start();
  }

  private char token()
  {
    return(inputString.charAt(index));
  }

  private void advancePtr()
  {
    if (index < (inputString.length() -1))
    {
      index++;
    }
  }

  private void match(char T)
  {
    if (T == token()) 
    {
      advancePtr();
    }
    else 
    {
      error();
    }
  }

  public void error()
  {
    System.out.println("error at position: " + index);
    errorFlag = 1;
    advancePtr();
  }

  public void start()
  {
    program();
    match('$');
    if (errorFlag == 0)
    {
      System.out.println("legal" + "\n");
    }
    else
    {
      System.out.println("errors found" + "\n");
    }
  }

  //methods to deal with every category
  public void program()
  {
    do
    {
      statemt();
    }
    while(((token() == 'Z')
    || (token() == '_')
    || (token()=='X')
    || (token()=='Y')
    || (token()=='W')
    || (token()=='I')
    || (token()=='R')
    || (token()=='U'))); 
          
    match('$');
  }
    
  public void statemt()
  {
    if (token()==('I'))
    {
      ifstmt();
    }
    else if(token()==('U'))
    {
      until();
    }
    else if(token()==('R'))
    {
      read();
    }
    else if (token() == ('W'))
    {
      write();
    }
    else 
    {
      asignmt();
    }
  }

  public void asignmt()
  {
    ident();
    match('~');
    exprsn();
    match(';');
  }

  public void ifstmt()
  {
    match('I');
    comprsn();
    match('@');
    while((token() == 'Z')
    || (token() == '_')
    || (token() == 'X')
    || (token() == 'Y')
    || (token() == 'W')
    || (token() == 'I')
    || (token() == 'R')
    || (token() == 'U'))
    {
      statemt();
    }

    if (token() == ('%'))
    {
      match('%');
      while((token() == 'Z')
      || (token() == '_')
      || (token() == 'X')
      || (token() == 'Y')
      || (token() == 'W')
      || (token() == 'I')
      || (token() == 'R')
      || (token() == 'U'))
      {
        statemt();
      }
    }
    match('&');
  }

  public void until()
  {
    match('U');
    match('(');
    comprsn();
    match(')');
    match('D');
    while((token() == 'Z')
    || (token() == '_')
    || (token() == 'Y')
    || (token() == 'X')
    || (token() == 'W')
    || (token() == 'I')
    || (token() == 'R')
    || (token() == 'U')) 
    {
      statemt();
    }
    match('\\');
  }

  public void read()
  {
    match('R');
    ident();
    while (token()==(','))
    {
      match(',');
      ident();
    }
    match(';');
  }

  public void write()
  {
    match('W');
    ident();
    while (token()==(','))
    {
      match(',');
      ident();
    }
    match(';');
  }

  public void comprsn()
  {
    match('(');
    oprnd();
    opratr();
    oprnd();
    match(')');
  }

  public void exprsn()
  {
    factor();
    while (token() == ('+'))
    {
      match('+');
      factor();
    }
  }

  public void factor()
  {
    oprnd();
    while (token() == ('*'))
    {
      match('*');
      oprnd();
    }
  }

  public void oprnd()
  {
    if (token() == ('('))
    {
      match(('('));
      exprsn();
      match(')');
    }
    else if (((token() == '0')
    || (token() == '1')
    || (token()=='2')
    || (token()=='3')
    || (token()=='4')
    || (token()=='5')
    || (token()=='6')
    || (token()=='7')
    || (token()=='8')
    || (token()=='9')))
    {
      integer();
    }
    else
    {
      ident();
    }
  }

  public void opratr()
  {
    if ((token() == '>')
    || (token() == '<')
    || (token() == '=')
    || (token() == '!'))
    {
      match( token());
    }
    else
    {
      error();
    }
  }

  public void ident()
  {
    letter();
    while (((token() == '0')
    || (token() == '1')
    || (token() == '2')
    || (token() == '3')
    || (token() == '4')
    || (token() == '5')
    || (token() == '6')
    || (token() == '7')
    || (token() == '8')
    || (token() == '9')
    || (token() == 'Z')
    || (token() == '_')
    || (token() == 'Y')
    || (token() == 'X')))
    {
      charious();
    }
  }

  private void charious()
  {
    if (((token() == '0')
    || (token() == '1')
    || (token()=='2')
    || (token()=='3')
    || (token()=='4')
    || (token()=='5')
    || (token()=='6')
    || (token()=='7')
    || (token()=='8')
    || (token()=='9')))
    {
      digit();
    }
    else
    {  
      letter();
    }   
  }

  public void integer()
  {
    do
    {
      digit();
    }
    while(((token() == '0')
    || (token() == '1')
    || (token()=='2')
    || (token()=='3')
    || (token()=='4')
    || (token()=='5')
    || (token()=='6')
    || (token()=='7')
    || (token()=='8')
    || (token()=='9')));
  }
    
  public void letter()
  {
    if ((token() == 'Z')
    || (token() == '_')
    || (token() == 'Y')
    || (token() == 'X'))
    {
      match( token());
    }
    else 
    {
      error(); 
    }  
  }

  public void digit()
  {
    if ((token() == '0')
    || (token() == '1')
    || (token() == '2')
    || (token() == '3')
    || (token() == '4')
    || (token() == '5')
    || (token() == '6')
    || (token() == '7')
    || (token() == '8')
    || (token() == '9'))
    {
      match(token());
    }
    else
    {
      error();
    }
  }
}