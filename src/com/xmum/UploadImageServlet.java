package com.xmum;


import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.Iterator;
import java.util.List;

@WebServlet("/uploadImage")
@MultipartConfig
public class UploadImageServlet extends HttpServlet {

    private static final String DATA_DIRECTORY = "img";
    private static final int MAX_MEMORY_SIZE = 1024 * 1024 * 2;
    private static final int MAX_REQUEST_SIZE = 1024 * 1024;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException {
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
}
