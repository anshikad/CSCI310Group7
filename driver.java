package Backend;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class driver
 */
@WebServlet("/driver")
public class driver extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public driver() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		//Creating new server
		Server server = Server.getInstance();
		String topic = request.getParameter("buildCollage");
		server.setTopic(topic);
		System.out.println("Topic is: " + topic);
		session.setAttribute("topic", topic);
		try {
			server.search();
		} catch (URISyntaxException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		//Sending collage over to front-end
		BufferedImage currentCollage = server.buildCollage();
		session.setAttribute("currentCollage", currentCollage);
		List<BufferedImage> previousCollages = server.getPrevCollageList();
		session.setAttribute("previousCollages", previousCollages);
		RequestDispatcher dispatchSecondPage = getServletContext().getRequestDispatcher("/secondPage.jsp");
		dispatchSecondPage.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
