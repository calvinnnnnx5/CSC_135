//Konstantin Polyashenko
//CSC 135 A1
//recursive-descent recognizer


/*
compiling and running instructions
1. open terminal/command prompt
2. navigate to the folder that contains this program
3. run javac A1.java then java A1

program ::= statemt {statemt}
       statemt ::= asignmt | ifstmt | until | read | write
       *asignmt ::= ident ~ exprsn ;
       *ifstmt  ::= I comprsn @ {statemt} [% {statemt}] &
       until   ::= U ( comprsn ) D {statemt} \
       *read    ::= R ident {, ident} ;
       write   ::= W ident {, ident} ;
       *comprsn ::= ( oprnd opratr oprnd )
       *exprsn  ::= factor {+ factor}
       *factor  ::= oprnd {* oprnd}
       *oprnd   ::= integer | ident | ( exprsn )
       *opratr  ::= < | = | > | !
       *ident   ::= letter {char}
       *char    ::= letter | digit
       *integer ::= digit {digit}
       *letter  ::= _ | X | Y | Z
       *digit   ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9

	The tokens are: ~ ; I @ % & U ( ) D \ R , W + * < = > ! _ X Y Z 0 1 2 3 4 5 6 7 8 9
   	
      Nonterminals are shown as lowercase words.
*/

public class A1
{
    public String userInput; //String inputted by user
    static int index = 0;
    static int errorFlag = 0;

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
        if (T == token()) advancePtr();
        {
            else error();
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
            System.out.println("errors detected" + "\n");
        }
    }

    //
    public void program()
    {

    }
    //
    public void statemt()
    {
          
    }
    public void asignmt()
    {
          
    }
    public void ifstmt()
    {
          
    }
    //
    public void until()
    {
          
    }
    public void read()
    {
          
    }
    //
    public void write()
    {
            
    }
    public void comprsn()
    {
          
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
        ||(token() == '1')
        ||(token()=='2')
        ||(token()=='3')
        ||(token()=='4')
        ||(token()=='5')
        ||(token()=='6')
        ||(token()=='7')
        ||(token()=='8')
        ||(token()=='9')))
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
        ||(token() == '1')
        ||(token() == '2')
        ||(token() == '3')
        ||(token() == '4')
        ||(token() == '5')
        ||(token() == '6')
        ||(token() == '7')
        ||(token() == '8')
        ||(token() == '9')
        ||(token() == 'Z')
        ||(token() == '_')
        ||(token() == 'Y')
        ||(token() == 'X')))
        {
            char();
        }
    }

    private void char()
    {
        if (((token() == '0')
        ||(token() == '1')
        ||(token()=='2')
        ||(token()=='3')
        ||(token()=='4')
        ||(token()=='5')
        ||(token()=='6')
        ||(token()=='7')
        ||(token()=='8')
        ||(token()=='9'))){
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
            ||(token() == '1')
            ||(token()=='2')
            ||(token()=='3')
            ||(token()=='4')
            ||(token()=='5')
            ||(token()=='6')
            ||(token()=='7')
            ||(token()=='8')
            ||(token()=='9'))); 
        }
    }

    public void letter()
    {
        if ((token() == 'Z')
        || (token() = '_') 
        || (token() = 'Y') 
        || (token() = 'X'))
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
        if ((token() == '0'))
        ||(token() == '1')
        ||(token() == '2')
        ||(token() == '3')
        ||(token() == '4')
        ||(token() == '5')
        ||(token() == '6')
        ||(token() == '7')
        ||(token() == '8')
        ||(token() == '9')
        {
            match(token());
        }
        else
        {
            error();
        }
    }

    public static void main (String[] args)
    {
        A1 recognizer = new A1();
        BufferedReader input = new BufferedReader
          (new InputStreamReader(System.in));

        System.out.print("\n" + "enter an expression: ");
        inputString = input.readLine();
        rec.start();
  }
}