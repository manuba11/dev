//import java.lang.Class;
import java.util.Arrays;

class Learn0003
{
    public static void main(String[] args)
    {
        //Initialize  array with initial value.
        byte[] byVar = {117, 118, 119, 120,  121, 123, 124, 125, 126, 127};
//        short[] shVar = {10, 9, 8, 7, 6, 5, 4, 3, 2, 1};
        int[] inVar = {1, 2, 3, 4, 5, 6, 7, 8, 9, 150000000};
//        long[] loVar = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

//        System.out.println(inVar.length);
//
//        for (int i = 0; i < inVar.length; i++)
//        {
//            System.out.println(inVar[i]);
//        }
//
//        //Initialize array with same value.
//        //Need import Arrays library
//        Arrays.fill(inVar, 30000);
//
//        for (int i = 0; i < inVar.length; i++)
//        {
//            System.out.println(inVar[i]);
//        }
//

        //Cast variables of different types to each other
        for (int i = 0; i < inVar.length; i++)
        {
            //Cast short to Integer with '(int)'
            inVar[i] = (byte)byVar[i];
        }

        for (int i = 0; i < inVar.length; i++)
        {
            System.out.println(inVar[i]);
        }
        //Get class name from instance variable.
        System.out.println(byVar.getClass().getName());
        //Get arrys length with Arrays.length().
        System.out.println(byVar.length);
    }
}

