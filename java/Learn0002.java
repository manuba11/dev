//配列の生成など
import java.util.Random;

class Learn0002
{
    public static void main(String[] args)
    {
        Integer[] iOne2Hundred;
        iOne2Hundred = new Integer[10000];
        Random ranNumber = new Random();

        for(int i = 0; i < iOne2Hundred.length; i++)
        {
            iOne2Hundred[i] = ranNumber.nextInt(10000);
            System.out.println(i + "->" + iOne2Hundred[i]); 
        }
    }
}


public void class setRandom
{
    setRandom(int iMaxNumber)
    {
        
    }
}

