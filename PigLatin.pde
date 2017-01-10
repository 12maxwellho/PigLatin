import java.util.*;
int nums = 0;
public void setup() {
	String lines[] = loadStrings("words.txt");
	System.out.println("there are " + lines.length + " lines");
	for (int i = 0 ; i < lines.length; i++) {
	  System.out.println(pigLatin(lines[i]));
	}
}
public void draw()
{
}
public int findFirstVowel(String sWord)
//precondition: sWord is a valid String of length greater than 0.
//postcondition: returns the position of the first vowel in sWord.  If there are no vowels, returns -1
{
	if(sWord.length()>0)
	{
		for(int i = 0; i<sWord.length(); i++)
 		{
    		if(sWord.substring(i,i+1).equals("a")||sWord.substring(i,i+1).equals("e")||sWord.substring(i,i+1).equals("i")||sWord.substring(i,i+1).equals("o")||sWord.substring(i,i+1).equals("u"))
    		{
    			nums = i;
      			return nums;
    		}
		}	
  	}
	return -1;
}

public String pigLatin(String sWord)
//precondition: sWord is a valid String of length greater than 0
//postcondition: returns the pig latin equivalent of sWord
{
	if(findFirstVowel(sWord) == -1) //rule 1: For words that are all consonants, simply add "ay" to the end of the word. 
	{
		return sWord + "ay";
	}
	else if(findFirstVowel(sWord) == 0) //rule 2: For words that begin with vowels, simply add "way" to the end of the word. 
	{
		return sWord + "way";
	}
	else if(sWord.substring(0,2).equals("qu")) //rule 3: For words beginning with "qu," move the "qu" to the end of the word and add ay
	{
		return sWord.substring(2) + "qu" + "ay";
	}
	else if(findFirstVowel(sWord) > 0) //rule 4: For words that begin with consonants, move the leading consonant(s) to the end of the word and add "ay."
	{
		return sWord.substring(nums) + sWord.substring(0,nums) + "ay";
	}
	else
	{
		return sWord;	
	}
}
