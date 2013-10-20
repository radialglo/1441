import java.io.*;
import java.security.*; 

public class ComputeSHA
{
	public static void main(String[] args) throws Exception { 

		MessageDigest md = MessageDigest.getInstance("SHA-1");

		// create an input stream based on the file specified
		FileInputStream fis = new FileInputStream(args[0]);
 
        byte[] dataBytes = new byte[1024];
 
        int nread = 0; 
        // read bytes into buffer and get the count for amount read
        while ((nread = fis.read(dataBytes)) != -1) {
        // process data through update
          md.update(dataBytes, 0, nread);
        };

        // digest to complete hash computation
        byte[] mdbytes = md.digest();
 
        StringBuffer hexString = new StringBuffer();
    	for (int i=0;i<mdbytes.length;i++) {
    	  // implicit sign extension done on param
    	  // so we need bit mask to extract byte
    	  hexString.append(Integer.toHexString(0xFF & mdbytes[i]));
    	}
 
    	System.out.println(hexString.toString());
	}

}
