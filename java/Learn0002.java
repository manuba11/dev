//配列の生成など
import java.util.Random;
import java.util.Arrays;
import java.util.Collections;

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

        //昇順でソート。配列を引数にしてArrayクラスのsort()メソッドを呼び出す
        //インスタンス化していないからこれはクラスメソッド？
        Arrays.sort(iOne2Hundred);

        for(int i = 0; i < iOne2Hundred.length; i++)
        {
            System.out.println(i + "->" + iOne2Hundred[i]);
        }

        //降順でソート
        //2番目の引数にCollectionsクラスのreverseOrder()メソッドを指定する
        Arrays.sort(iOne2Hundred, Collections.reverseOrder());

        for(int i = 0; i < iOne2Hundred.length; i++)
        {
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

