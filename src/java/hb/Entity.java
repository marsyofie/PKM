/*
 Copyright by Saman Zarandioon (http://saman.me)
 Limited use for non-commercial research and private study is allowed under
 the following constraints:
 1) Proper credit must be given to the author (Saman Zarandioon)
 2) The author must be informed of how this code is being used. (zarandioon@yahoo.com) 
 */

package hb;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.io.File;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.Random;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import it.unisa.dia.gas.jpbc.Element;
import java.util.Arrays;

public class Entity {

	private String[] identity;	// hierarchical identity of the entity, empty array means root
	private Element St; 		// secret
	private BigInteger st; 		//Lower-level Setup
	private Element[] Qis; 		// Q1 - Qt-1 // t=identity.length
	private HIBE hibe; 			// a reference to the corresponding HIBE setup

	// not public so only HIBE can create an entity object
	Entity(String[] identity,BigInteger st, Element St, Element[] Qis, HIBE hibe)
	{
		this.identity = identity;
		this.St = St;
		this.st = st;
		this.Qis = Qis;
		this.hibe = hibe;
	}
	
	Entity(byte[] entityBytes, HIBE hibe)
	{
		this.hibe = hibe;
		setFromBytes(entityBytes,0);
	}
	
	Entity(String path, HIBE hibe)
	{
		this.hibe = hibe;
        try {
    		FileInputStream fis = new FileInputStream(path);
    		setFromBytes(new BASE64Decoder().decodeBuffer(fis),0);
        }
        catch (IOException ex){
            ex.printStackTrace();
        }
        finally
        {
        }
	}
		

	String[] getIdentity()
	{
		return identity;
	}
	
	Element getSt()
	{
		return St;
	}
	
	BigInteger get_st()
	{
		return st;
	}
	
	Element[] getQis()
	{
		return Qis;
	}
	
	// n bytes id (4 bytes) , id , st, St ,Qis
	public void setFromBytes(byte[] bytes, int offset)
	{

		int idBytesLen = getIntegerFromBytes(bytes,offset); offset += 4;

		String id = null;
		try
		{
			id = new String(bytes,offset,idBytesLen, "UTF-8");
			offset += idBytesLen;
		} catch (UnsupportedEncodingException e) {
		    e.printStackTrace();
		}
		// remove initial "/" and then split on "/"
		if(id.equals("/")) 
			identity = new String[0];
		else
			identity = id.substring(1).split("/");

		int stBytesLen = getIntegerFromBytes(bytes,offset); offset += 4;

		byte[] stBytes = new byte[stBytesLen];
		for(int i = 0; i < stBytesLen; i++)
			stBytes[i] = bytes[offset++];
		st = new BigInteger(stBytes);

		St = hibe.getPairing().getG1().newElement();
		offset += St.setFromBytes(bytes, offset);
		St = St.getImmutable();
		ArrayList<Element> QisArrayList = new ArrayList<Element>();
		
		while(offset<bytes.length)
		{
			Element Qi = hibe.getPairing().getG1().newElement();
			offset += Qi.setFromBytes(bytes, offset);
			Qi = Qi.getImmutable();
			QisArrayList.add(Qi);
		}
		
		Qis = new Element[QisArrayList.size()];
		QisArrayList.toArray(Qis);
	}
	
	public Entity derive( String[] identity)
	{
		// to protect aginst signiture attack
		if(identity[identity.length-1].startsWith(" "))
			return null;
		return hibe.derive(this, identity);
	}
	
	public byte[] encrypt(byte[] message, String[] identity)
	{
		return hibe.encrypt(message, identity);
	}

	public byte[] decrypt(byte[] ciphertext)
	{
		return hibe.decrypt(this, ciphertext);
	}
	
	public void save()
	{
		
        try {
        	String path = hibe.getPath();
        	File file = new File(path);
        	path = file.getParent();
        	String name = "";
        	for(String id : identity)
        	{
        		path += "/" + id;
        		name += "_" + id;
        	}
        	
        	File entityPath = new File(path);
        	if(! entityPath.exists())
        		entityPath.mkdirs();
        	//String nn=file.getName();
                //String awal=nn.substring(4,10); //get _surat or get _resu --me
                //String getnn=nn.substring(11);
        	//path += "/entity"+awal + name +"_"+ getnn ;
        	path += "/entity" + name + ".dat";

        	FileOutputStream fos = new FileOutputStream(path);
        	new BASE64Encoder().encode(toBytes(), fos);
                fos.flush();
                fos.close();
        }
        catch (IOException ex){
            ex.printStackTrace();
        }
        finally
        {
        }
	}
	
	byte[] toBytes()
	{
		byte[] bytes = null;
		byte[][] QiBytes = new byte[Qis.length][];
		int QiBytesLen = 0;
		for(int j=0; j <Qis.length ; j++)
		{
			QiBytes[j] = Qis[j].toBytes();
			QiBytesLen += QiBytes[j].length;
		}
		
		String id = "";
		if(identity == null || identity.length == 0)
		{
			id = "/";
		}
		{
			for(String i:identity)
			{
				id += "/" +  i;
			}
		}

		try {
			byte[] idBytes = id.getBytes("UTF-8");
			byte[] stBytes = st.toByteArray();

			byte[] StBytes = St.toBytes();

			// n bytes id (4 bytes) , id , st len (4 bytes), st, St ,Qis
			bytes = new byte[4 + idBytes.length + 4 + stBytes.length +  QiBytesLen + StBytes.length    ];
			int idBytesLen = idBytes.length;
			int offset =0 ;
			
			getIntegerBytes(idBytesLen,bytes,offset);offset+=4;
			
			System.arraycopy(idBytes, 0, bytes, offset, idBytes.length);
			offset += idBytes.length;
			
			// st
			getIntegerBytes(stBytes.length,bytes,offset); offset += 4;
			
			for(int i=0; i<stBytes.length; i++)
				bytes[offset++] = stBytes[i];

			// St
			System.arraycopy(StBytes,0,bytes,offset,StBytes.length); offset += StBytes.length;
			
			for( int j =0; j< Qis.length; j++)
			{
				System.arraycopy(QiBytes[j],0,bytes,offset,QiBytes[j].length);
				offset += QiBytes[j].length;
			}
			

			
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		return bytes;
	}
	
	public byte[] sign(byte[] data)
	{
		String[] signID = getSignID(identity, data);
		Entity e = hibe.derive(this, signID);
        System.out.println("sign entity: " + e);
		return e.toBytes();
	}
	
	private String[] getSignID(String[] id, byte[] data)
	{
		String[] signID = null;
		try{
			// Generate an hash from string (48-bit hash)
			MessageDigest md = MessageDigest.getInstance("SHA");
			md.update(data);
			byte[] hash = md.digest();
			signID = new String[id.length +1];
			for(int i=0; i<id.length ; i++)
			{
				signID[i] = id[i];
			}
			signID[id.length] = " " + new String(hash);
		}catch (NoSuchAlgorithmException e) {
		    System.err.println("no such hash algorithm");
		}
		return signID;
	}
	
	public boolean verifySignature(String[] signerID, byte[] data , byte[] signature)
	{
        Random random = new Random(System.currentTimeMillis());
        byte[] randomBytes = new byte[10]; random.nextBytes(randomBytes);     
        byte[] encRandomBytes = encrypt(randomBytes,getSignID(signerID,data));
        Entity entity = new Entity(signature,hibe);
        System.out.println("sign entity: " + entity);
        byte[] randomBytes2 = entity.decrypt(encRandomBytes);
		return Arrays.equals(randomBytes, randomBytes2);
	}
	
	
	// extracts i bytes and put them in bytes starting at offset and ending at offset+4
	static void getIntegerBytes(int integer, byte[] bytes, int offset)
	{
		int i = 0;
		for ( ; i < 4 ; i++ ) 
			bytes[ offset++ ] = (byte) ( ( integer >> ( i * 8 ) ) & 0x000000FF );
	}
	
	/*
	// exteract the integer stored at offset - offset+4
	static int getIntegerFromBytes(byte[] bytes, int offset)
	{
		int integer = 0;
		for ( int i =0; i < 4 ; i++ ) 
		{
			integer += (int) ( bytes[ offset ] << ( i * 8 ) ) ;
			offset++;
		}
		return integer;
	} */
	
	// extract the integer stored at offset - offset+4
	static int getIntegerFromBytes(byte[] bytes, int offset)
	{
		int integer = 0;
		for ( int i =0; i < 4 ; i++ ) 
		{
			int byteInt =  (bytes[ offset ] << ( i * 8 ) );
			if(byteInt < 0) byteInt += 256;
			integer += byteInt ;
			offset++;
		}
		return integer;
	}
	
	public String toString()
	{
		String string = "\n";
		string += "Identity: " ;
		for(int i = 0; i< identity.length; i++)
		{
			string += "/"+identity[i];
		}
		string += "\n";
		string += "st: " + st + "\n";
		string += "St: " + St + "\n";
		for(int i = 0; i < Qis.length ; i++)
		{
			string += "Q" + i +": " + Qis[i] + "\n";
		}
		return string;
	}
	
}
