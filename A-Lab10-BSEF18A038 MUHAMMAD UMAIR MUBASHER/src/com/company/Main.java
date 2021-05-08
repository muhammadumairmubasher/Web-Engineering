package com.company;
import java.util.Scanner;
public class Main {
    public static void main(String[] args) {
        //Task-01
        System.out.println("Welcome to JAVA\n\nJAVA is pure object-Oriented programing language.");
        System.out.println("We can create application almost for almost all platforms in Java including:");
        System.out.println("\t1- Desktop Applications");
        System.out.println("\t2- Web Applications");
        System.out.println("\t3- Mobile Applications");
        System.out.println("\n Learning java is fun.");


        //Task-02:
        System.out.println("\n\t\t\t***************** Task-02 ***************");
        Scanner scanner=new Scanner(System.in);
        System.out.print("Movie Name:");
        String movieName=scanner.nextLine();

        System.out.print("Movie Genre:");
        String movieGenre=scanner.nextLine();

        System.out.print("Movie Year:");
        int movieYear=scanner.nextInt();

        System.out.print("Movie Length:");
        float movieLength=scanner.nextFloat();

        System.out.println("\nDisplaying data...");
        System.out.println("\nName Entered: "+movieName);
        System.out.println("Genre Entered: "+movieGenre);
        System.out.println("Year Entered: "+ movieYear);
        System.out.println("Length Entered: "+movieLength);


        //Task-03
        System.out.println("\n\t\t\t***************** Task-03 ***************");
        Scanner input=new Scanner(System.in);
        System.out.print("Enter an integral Value:");
        int value=input.nextInt();
        if (value>=0) {
            System.out.println("Result: Positive value");
        }
        else{
            System.out.println("Result: Negative value");
        }



        //Task-04
        System.out.println("\n\t\t\t***************** Task-04 ***************");

        Scanner inputArray=new Scanner(System.in);
        int [] arr=new int [10];
        System.out.print("Enter 10 numbers:");
        for (int i=0;i< arr.length;i++) {
            arr[i]=inputArray.nextInt();
        }
        Main obj=new Main();
        System.out.println("Sum is:"+obj.sum(arr));
        System.out.println("Average: " +obj.average(arr));
        System.out.println("Largest is: "+obj.largest(arr));
        System.out.println("Smallest is: "+ obj.smallest(arr));



        //Task 05
        System.out.println("\n\t\t\t***************** Task-05 ***************");

        Scanner charInput= new Scanner(System.in);
        System.out.print("Enter Characters: ");
        String str= charInput.nextLine();

        String decodedString = "";
        int lastCharValue = 'z';
        for (char character: str.toCharArray()) {
            int decodedChar = character + 5;
            int charValue = decodedChar < lastCharValue ? decodedChar : decodedChar - 26;
            decodedString += (char) charValue;
        }
        System.out.println("Decoded String is: " + decodedString);


    }
    public int sum (int arr[]) {
        int result=0;
        for(int i=0;i<arr.length;i++) {
            result=result+arr[i];
        }
        return result;
    }
    public double average (int arr[]){
        int sum=sum(arr);
        return (double)sum/arr.length;
    }
    public int largest (int arr[]){
        int large=arr[0];
        for(int i=0;i<arr.length;i++){
            if(large<arr[i])
                large=arr[i];
        }
        return large;
    }
    public int smallest (int arr[]){
        int small=arr[0];
        for(int i=0;i<arr.length-1;i++) {
            if(small>arr[i])
                small=arr[i];
        }
        return small;
    }
}
