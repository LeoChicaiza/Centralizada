
package mycompany.centralizada;

import java.net.*;
import java.io.*;

public class Client {
    public static void main(String[] args) throws IOException {
        Socket socket = new Socket("server", 1234);
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        
        String response = in.readLine();
        System.out.println("Server says: " + response);
        
        socket.close();
    }
}

