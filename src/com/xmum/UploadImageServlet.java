package com.xmum;


import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

@WebServlet("/uploadImage")
@MultipartConfig(
    fileSizeThreshold=1024*1024*10, 	// 10 MB
    maxFileSize=1024*1024*50,      	// 50 MB
    maxRequestSize=1024*1024*100)
public class UploadImageServlet extends HttpServlet {
    //private static final String UPLOAD_DIR = "img";

    /*private static final String DATA_DIRECTORY = "img";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;*/

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        System.out.println("UploadImageServlet doPost activated!");

        String uploadType = request.getParameter("uploadType");
        System.out.println(uploadType);
        switch(uploadType){
            //upload profilepic
            case "profilePic":
            {
                String[] fileNames = uploadImage(request, "img");
                request.setAttribute("picName", fileNames[0]);
                //request.getRequestDispatcher("/user").forward(request, response);
                break;
            }
            case "postPic":
            {
                String[] fileNames = uploadImage(request, "img/postimgs");
                request.setAttribute("picName", fileNames);
                break;
            }
            default:
                break;
        }

    }

    private String[] uploadImage(HttpServletRequest request, String UPLOAD_DIR) throws IOException, ServletException {
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");

        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;

        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());

        ArrayList<String> picNames = new ArrayList<>();

        //Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            System.out.println(part.getContentType());
            if(part.getContentType() != null){
                System.out.println(part.getContentType());
                String fileName = getFileName(part);
                picNames.add(fileName);
                System.out.println(picNames);
                part.write(uploadFilePath + File.separator + fileName);
            } else {
                System.out.println("is not filetype");
                System.out.println(part.getContentType());
            }
        }

        //converting from ArrayList to String[]
        Object[] objNames = picNames.toArray();
        return Arrays.copyOf(objNames, objNames.length, String[].class);
    }

    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }

    /*protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
        // Check that we have a file upload request
        System.out.println("UploadImageServlet activated!");
        boolean isMultipart = ServletFileUpload.isMultipartContent(request);

        if (!isMultipart) {
            System.out.println("is not multipart");
            //return;
        }

        // Create a factory for disk-based file items
        DiskFileItemFactory factory = new DiskFileItemFactory();

        // Sets the size threshold beyond which files are written directly to
        // disk.
        factory.setSizeThreshold(MAX_MEMORY_SIZE);

        // Sets the directory used to temporarily store files that are larger
        // than the configured size threshold. We use temporary directory for
        // java
        factory.setRepository(new File(System.getProperty("java.io.tmpdir")));

        // constructs the folder where uploaded file will be stored
        String uploadFolder = getServletContext().getRealPath("")
                + File.separator + DATA_DIRECTORY;

        // Create a new file upload handler
        ServletFileUpload upload = new ServletFileUpload(factory);

        // Set overall request size constraint
        upload.setSizeMax(MAX_REQUEST_SIZE);

        try {
            // Parse the request
            System.out.println("in try block");

            List items = upload.parseRequest(request);
            System.out.println("got request data");
            System.out.println(items);

            Iterator iter = items.iterator();
            while (iter.hasNext()) {
                System.out.println("in while block");
                FileItem item = (FileItem) iter.next();

                if (!item.isFormField()) {
                    System.out.println("in if branch");
                    String fileName = new File(item.getName()).getName();
                    String filePath;
                    if (request.getParameter("imageUpload") != null){
                        filePath = uploadFolder + File.separator + "postimags" + File.separator + fileName;
                        File uploadedFile = new File(filePath);
                        System.out.println(fileName);
                        // saves the file to upload directory
                        item.write(uploadedFile);
                    }
                    else {
                        filePath = uploadFolder + File.separator + fileName;
                        File uploadedFile = new File(filePath);
                        System.out.println(fileName);
                        // saves the file to upload directory
                        item.write(uploadedFile);
                        request.setAttribute("picName", fileName);
                        RequestDispatcher rd = request.getRequestDispatcher("/user");
                        rd.forward(request, response);
                    }
                }
            }
        } catch (FileUploadException ex) {
            System.out.println(ex);
            throw new ServletException(ex);
        } catch (Exception ex) {
            System.out.println(ex);
            throw new ServletException(ex);
        }
    }
*/}
