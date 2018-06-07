//配列の生成など
import java.util.Random;

class Learn0002
{
    public static void main(String[] args)
    {
        Integer[] iOne2TenThousand;
        iOne2TenThousand = new Integer[10000];
        Random ranNumber = new Random();

        for(int i = 0; i < iOne2TenThousand.length; i++)
        {
            iOne2TenThousand[i] = ranNumber.nextInt(10000);
            System.out.println(i + "->" + iOne2TenThousand[i]); 
        }
    }
}


public void class setRandom
{
    setRandom(int iMaxNumber)
    {
        
    }
}

