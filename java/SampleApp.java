//Commnet

public class SampleApp 
{
    public static void main(String[] args)
    {
        Test i = new Test(); //generate instans
        i.printHello("Hello"); //call 
    }
}

class Test
{
    private String x; //can't get form outside

    public Test()
    {
        this.x = "World!";
    }

    public void printHello(String mes) //method. It's can call from outside
    {
        System.out.println(mes + " " + x);
    }
}
