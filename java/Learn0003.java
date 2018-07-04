import java.util.Arrays;

class Learn0003
{
    public static void main(String[] args)
    {
        Integer[] iVar = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
        short[] shVar = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};

        System.out.println(iVar.length);

        for (int i = 0; i < iVar.length; i++)
        {
            System.out.println(iVar[i]);
        }

        //Initialize array with same value.
        Arrays.fill(iVar, 30000);

        for (int i = 0; i < iVar.length; i++)
        {
            System.out.println(iVar[i]);
        }

        //Cast variables of different types to each other
        for (int i = 0; i < iVar.length; i++)
        {
            iVar[i] = (int)shVar[i];
        }

        for (int i = 0; i < iVar.length; i++)
        {
            System.out.println(iVar[i]);
        }


    }
}

