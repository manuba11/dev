//配列の生成など
import java.util.Random;

class Learn0002
{
    public static void main(String[] args)
    {
        Integer[] iOne2Hundred = new Integer[100];
        RandomNumber r = new RandomNumber();

        for(int i = 0; i < iOne2Hundred.length; i++)
        {
            iOne2Hundred[i] = r.getRandomNumber(10000);
            System.out.println(i + "->" + iOne2Hundred[i]);
        }
    }
}


class RandomNumber
{
    private Random ranNumber;

    RandomNumber()
    {
        this.ranNumber = new Random();
    }

    Integer getRandomNumber(int iMaxNumber)
    {
        return this.ranNumber.nextInt(iMaxNumber);
    }
}

