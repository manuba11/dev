//Comment

public class SampleApp 
{
    public static void main(String[] args)
    {
        Speech i = new Speech();
        Greeting i2 = new Greeting(); //Super Class of Speech

        System.out.println(i.sayGreet("morning"));
        System.out.println(i.introduceMyself());
        System.out.println(i.question());
        System.out.println(i2.sayGreet("midnight"));
        System.out.println(i2.getFrag());
    }
}

class Speech extends Greeting
{
    public String introduceMyself()
    {
       return "My name is Manabu Izurumachi.";
    }

    public String question()
    {
        return "Who are you?";
    }
}

class Greeting
{
    private boolean bFrag = false;

    public Greeting()
    {

        bFrag = true;
    }

    public String sayGreet(String sTime)
    {
        switch(sTime)
        {
            case "morning":
                return "Good morning";
            case "daytime":
                return "Hello";
            case "evening":
                return "Good evening";
            case "night":
                return "Good night";
            default:
                return "Doumo Doumo";
        }
    }

    public String getFrag()
    {
        if (bFrag == false)
        {
            return "false";
        } else {
            return "true";
        }
    }
}



