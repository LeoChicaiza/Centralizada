
package mycompany.centralizada;

import java.net.*;
import java.io.*;

public class Server {
    public static void main(String[] args) throws IOException {
        System.out.println("Central Server started...");
        ServerSocket serverSocket = new ServerSocket(1234);
        
        while (true) {
            Socket clientSocket = serverSocket.accept();
            System.out.println("Client connected: " + clientSocket);
            
            // Simplemente responde con un eco
            PrintWriter out = new PrintWriter(clientSocket.getOutputStream(), true);
            out.println("Hello from central server!");
            
            clientSocket.close();
        }
    }
}
