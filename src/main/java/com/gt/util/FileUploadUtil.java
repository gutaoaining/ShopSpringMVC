package com.gt.util;

import java.io.File;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;



@Component("uploadFile")
public class FileUploadUtil implements UploadFile {
	 private String filepath = "D:/";
	 
     public String getFilepath() {
		return filepath;
	}
     @Value("#{property.filepath}")
	public void setFilepath(String filepath) {
    	 System.out.println(filepath);
		this.filepath = filepath;
	}
	private String getFileExtname(String filename){
    	 return FilenameUtils.getExtension(filename);
     }
     private String CreateNewName(String filename){
    	 String ext = getFileExtname(filename);
    	 return UUID.randomUUID().toString()+"."+ext;
     }
     /* 
	 * @see com.gt.util.UploadFile#uploadFile(com.gt.model.uploadfile)
	 */
    @Override
	public String uploadFile(MultipartFile uploadfile){
    	String pic = CreateNewName(uploadfile.getOriginalFilename());
    	try {
    		File targetFile = new File(filepath, pic);
    		if(!targetFile.exists()){  
                targetFile.mkdirs();  
            }  
    		uploadfile.transferTo(targetFile);
			return pic;
    	} catch (Exception e) {
			throw new RuntimeException(e);
		}
     }
	
}
