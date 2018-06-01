//Comment

public class SampleApp 
{
    public static void main(String[] args)
    {
        Speech i = new Speech();

        System.out.println(i.sayGreet("morning"));
        System.out.println(i.introduceMyself());
        System.out.println(i.question());
//        System.out.println(i.sayGreet("daytime"));
//        System.out.println(i.sayGreet("evening"));
//        System.out.println(i.sayGreet("night"));
//        System.out.println(i.sayGreet("asa"));
//
//        EveningGreeting i = new EveningGreeting(); //generate instans
//        i.DayTime();
//        i.Morning();
//        i.Evening();
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
//    private String sGreet; 
//    public void Greeting()
//    {
//        sGreet = "";
//    }
//
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
                return "Doumo";
        }
    }
}



