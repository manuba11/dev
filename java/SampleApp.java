//Comment

public class SampleApp 
{
    public static void main(String[] args)
    {
        Greeting i = new Greeting();

        System.out.println(i.sayGreet("morning"));
        System.out.println(i.sayGreet("daytime"));
        System.out.println(i.sayGreet("evening"));
        System.out.println(i.sayGreet("night"));

//        EveningGreeting i = new EveningGreeting(); //generate instans
//        i.DayTime();
//        i.Morning();
//        i.Evening();
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



// class Greeting
// {
//     private String sGreet;  //can't get form outside
// 
//     public Greeting()
//     {
//         this.sGreet = "Hello";
//     }
// 
//     public void DayTime() //method. It's can call from outside
//     {
//         System.out.println(this.sGreet);
//     }
// }
// 
// class MorningGreeting extends Greeting
// {
//     
//     private String sGreet;  //can't get form outside
// 
//     public MorningGreeting()
//     {
//         this.sGreet = "Good morning";
//     }
// 
//     public void Morning() //method. It's can call from outside
//     {
//         System.out.println(this.sGreet);
//     }
// 
// }
// 
// 
// class EveningGreeting extends MorningGreeting
// {
//     
//     private String sGreet;  //can't get form outside
// 
//     public EveningGreeting()
//     {
//         this.sGreet = "Good evening";
//     }
// 
//     public void Evening() //method. It's can call from outside
//     {
//         System.out.println(this.sGreet);
//     }

//}
