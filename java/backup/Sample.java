//sample
class Book{
    private String Name;

    //constructor
    public Book(){
        this.Name = "Bible";
    }

    public String getName(){
        return this.Name;
    }

    public void setName(String name){
        this.Name = name;
    }
}

public class Sample{
    public static void main(String[] args){
        Book i = new Book();
        System.out.println(i.getName());

        i.setName("eBook");
        System.out.println(i.getName());
    }
}







