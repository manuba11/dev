//
import java.util.*;

class Learn0001{
    
    public static void main(String[] args)
    {
        Bio human = new Bio();
        human.setFirstName("Manabu");
        human.setFamilyName("Izurumachi");
        human.setSex('M');

        Calendar cBirth = Calendar.getInstance();
        cBirth.set(1969, 11 - 1, 4, 0, 0, 0);
        human.setBirth(cBirth);

        human.printBio();
    }
}

class Bio
{
    private String sFirstName;
    private String sFamilyName;
    private char cSex;
    private Locale loJP;
    private TimeZone tzTokyo;
    private Calendar calBirth;
    
    //Constractor
    Bio()
    {
        sFirstName = "";
        sFamilyName = "";
        cSex = 'M';
        loJP = new Locale("ja", "JP");
        tzTokyo = TimeZone.getTimeZone("Asia/Tokyo"); 
        calBirth = Calendar.getInstance(tzTokyo, loJP);

    }
    
    public void setFirstName(String sFirstName)
    {
        this.sFirstName = sFirstName;
    }


    public void setFamilyName(String sFamilyName)
    {
        this.sFamilyName = sFamilyName;
    }

    public void setSex(char cSex)
    {
        this.cSex = cSex;
    }

    public void setBirth(Calendar calBirth)
    {
        this.calBirth = calBirth;
    }

    public void printBio()
    {
        System.out.println(this.sFirstName);
        System.out.println(this.sFamilyName);
        System.out.println(this.cSex);
        System.out.println(this.calBirth.getTime());
    }
}
