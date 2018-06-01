//Comment

public class SampleApp 
{
    public static void main(String[] args)
    {
        EveningGreeting i = new EveningGreeting(); //generate instans
        i.DayTime();
        i.Morning();
        i.Evening();
    }
}

class Greeting
{
    private String sGreet;  //can't get form outside

    public Greeting()
    {
        this.sGreet = "Hello";
    }

    public void DayTime() //method. It's can call from outside
    {
        System.out.println(this.sGreet);
    }
}

class MorningGreeting extends Greeting
{
    
    private String sGreet;  //can't get form outside

    public MorningGreeting()
    {
        this.sGreet = "Good morning";
    }

    public void Morning() //method. It's can call from outside
    {
        System.out.println(this.sGreet);
    }

}


class EveningGreeting extends MorningGreeting
{
    
    private String sGreet;  //can't get form outside

    public EveningGreeting()
    {
        this.sGreet = "Good evening";
    }

    public void Evening() //method. It's can call from outside
    {
        System.out.println(this.sGreet);
    }

}
