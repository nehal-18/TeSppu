import java.util.LinkedList;		
import java.util.Queue;
import java.util.Scanner;

public class Fifo
{
    public static void main(String[] args)
    {
        Queue<String> queue = new LinkedList<String>();
        Scanner sc = new Scanner(System.in);
        int input;
        String str;
        
        System.out.print("Enter size of queue:");
        input = sc.nextInt();
        
        for(int i=0;i<input;i++)
        {
        	str = sc.next();
        	queue.add(str);
        }
        
        sc.close();

        System.out.println("Created Queue: " + queue);
        String value = (String) queue.remove();		
        
        
        System.out.println("The element deleted from the head is: " + value);
        System.out.println("The queue after deletion: " + queue);	
        
        
        String head = (String) queue.peek();
        System.out.println("The head of the present queue is: " + head);		
        
        int size = queue.size();
        System.out.println("The size of the queue is: " + size);		
    
        
    }
}
