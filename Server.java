import java.net.*;
import java.net.MalformedURLException;
import java.net.URISyntaxException;
import java.util.LinkedList;
import java.util.List;

import javax.imageio.ImageIO;

import com.google.gson.Gson;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.geom.AffineTransform;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.Reader.*;

public class Server {
	private List<BufferedImage> imagesList;
	private List<BufferedImage> prevCollageList;
	private BufferedImage prevCollage;
	private static Server instance;
	private String topic;
	public void setTopic(String topic) {
		this.topic = topic;
	}
	private Server() {
		imagesList = new LinkedList<>();
		prevCollageList = new LinkedList<>();
		prevCollage = null;//IMPORTANT to initialize it to null	
	}
	public static Server getInstance() {
		if(instance == null) {
	         instance = new Server();
	    }
	    return instance;
	}
	public void search() throws MalformedURLException, URISyntaxException, IOException{
		  //this.topic = topic;
		  //Google api credentials and parameters
		  String key = "AIzaSyDFyaeFTiOvijzl7-2OTS3rcPeMYb2S0Ts";
		  String qry = this.topic; // search key word
		  String cx  = "012772727063918838439:2cwicvp-wsk";
		  String searchType = "image";
		  int indexResult = 1;
		  int numImagesSaved = 0;
		  //CONDITION used to make sure we grab exactly 30 images
		  while (numImagesSaved < 30) {
			  //all parameters are put at the end of the url
			  URL url = new URL ("https://www.googleapis.com/customsearch/v1?key=" +key+ "&cx=" +cx+ "&q=" +qry + "&searchType="+searchType+"&start="+indexResult + "&num=1");//);
			  HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			  conn.setRequestMethod("GET");
			  conn.setRequestProperty("Accept", "application/json");
			  BufferedReader br = new BufferedReader(new InputStreamReader ( ( conn.getInputStream() ) ) );
			  String output;
			  while ((output = br.readLine()) != null) {
			        if(output.contains("\"link\": \"")){   
			        		//get ONE link 
			            String link=output.substring(output.indexOf("\"link\": \"")+("\"link\": \"").length(), output.indexOf("\","));
			            //form ONE url from link
			            URL imageURL = new URL(link);
			            try {
			            		//Add to the image list
			            		imagesList.add(ImageIO.read(imageURL));
			            		//if the image just stored is NOT null, increment the counter
			            		if (imagesList.get(imagesList.size() - 1) != null) {
			            			numImagesSaved++;
			            		}
			            		//if the image just stored is null, remove this null image and do NOT increment the counter
			            		else {
			            			imagesList.remove(imagesList.size() - 1);
			            		}
			            } catch (Exception InputMismachException) {
			            		System.out.println("Exception catched");    
			            }
			        }     
			  }
			  //after 
			  indexResult++;
			  conn.disconnect();
		  }
	}
	//DISCARDED
	public  BufferedImage joinBufferedImage() {
	    BufferedImage newImage = new BufferedImage(1800, 900,
	    		BufferedImage.TYPE_INT_RGB);
	    Graphics2D g2 = newImage.createGraphics();
	    //The first row
	    for (int i = 0; i < 10; i++) {
	    		g2.drawImage(this.imagesList.get(i), 0 + 180*i, 0, 180 + i*180, 300,0,0, this.imagesList.get(i).getWidth(), this.imagesList.get(i).getHeight(), null);
	    }
	    //The second row
	    for (int i = 0; i < 10; i++) {
    			g2.drawImage(this.imagesList.get(10 + i), 0 + 180*i, 300, 180 + i*180, 600,0,0, this.imagesList.get(10 + i).getWidth(), this.imagesList.get(10 + i).getHeight(), null);
	    }
	    //The third row
	    for (int i = 0; i < 10; i++) {
			g2.drawImage(this.imagesList.get(20 + i), 0 + 180*i, 600, 180 + i*180, 900,0,0, this.imagesList.get(20 + i).getWidth(), this.imagesList.get(20 + i).getHeight(), null);
	    }
	    g2.dispose();
	    
	    //To form previous collage list
	    if (prevCollage != null) {//if prevCollage is null, it's the first search that does not have previous collages
	    		prevCollageList.add(prevCollage);
	    }
	    prevCollage = newImage;
	    return newImage;
	}
	/*Scale up one image as background. Rest of images are scaled down to display*/
	public BufferedImage buildCollage() {
		//BufferedImage collage = new BufferedImage(1800, 900,BufferedImage.TYPE_INT_RGB);
		BufferedImage collage = new BufferedImage(2771, 1385, BufferedImage.TYPE_INT_RGB);
		Graphics2D g = collage.createGraphics();
		//Make the first image background of the collage
		g.drawImage(this.imagesList.get(0), 0, 0, 1800, 900, 0, 0, this.imagesList.get(0).getWidth(), this.imagesList.get(0).getHeight(), null);
		for (int i = 0; i < 30; i++) {
			//Set up the small image with no image yet
			BufferedImage smallImage = new BufferedImage(241, 125,BufferedImage.TYPE_INT_RGB);
			Graphics2D gToScaleDown = smallImage.createGraphics();
			gToScaleDown.setPaint(new Color ( 255, 255, 255 ) );//make the background white so after an image is on the background the border is white
			gToScaleDown.fillRect ( 0, 0, 241, 125 );
			gToScaleDown.drawImage(this.imagesList.get(i), 3, 3, 238, 122, 0, 0,
					this.imagesList.get(i).getWidth(), this.imagesList.get(i).getHeight(), null);//put an image on background
			gToScaleDown.dispose();
			//Create transformation for the scaled down images
			AffineTransform tx = new AffineTransform();
			double locationX = smallImage.getWidth() / 2;//find center of an image
			double locationY = smallImage.getHeight() / 2;
			//IMPORTANT translate must be before rotate 
			tx.translate(Math.random()*1800, Math.random()* 900);//Move the small images away from the origin
			tx.rotate(Math.toRadians (-45 + Math.random()*90), locationX, locationY);//rotate around the center
			g.drawImage(smallImage, tx, null);//draw with transformation 
		}	
		g.dispose();//Release all resources used by g
		//for local test
		try {
			ImageIO.write(collage, "jpg",new File("/Users/gongchen/Desktop/310imagesFolder/collage" + ".jpg"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//To form previous collage list
	    if (prevCollage != null) {//if prevCollage is null, it's the first search that does not have previous collages
	    		prevCollageList.add(prevCollage);
	    }
	    prevCollage = collage;
		return null;
		
	}
	//DISCARDED
	private void outputImages() {
		if (imagesList.size() == 30) {
			for (int i = 0; i < 30; i++) {
				try {
					ImageIO.write(imagesList.get(i), "jpg",new File("/Users/gongchen/Desktop/310imagesFolder/image" + i + ".jpg"));
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
			
		}
	}
	//IMPORTANT after each joinBufferedImage() called, getPrevCollageList() should be called immediately to update the previous collages
	public List<BufferedImage> getPrevCollageList() {
		return prevCollageList;
	}
	
	public static void main(String[] args) {
		Server s0 = new Server();
		try {
			//Grab 30 images
			s0.search(args[1]);//Parameter is a place holder.
		} catch (URISyntaxException | IOException e) {
			e.printStackTrace();
		}
		s0.outputImages();
		s0.buildCollage();
		//Build collage
		BufferedImage joinedImg = s0.joinBufferedImage();
		try {
			//save it to local
			ImageIO.write(joinedImg, "jpg",new File("/Users/gongchen/Desktop/310imagesFolder/imageJOINED" + ".jpg"));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}

