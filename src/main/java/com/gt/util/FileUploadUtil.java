package com.gt.util;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import org.apache.commons.io.FilenameUtils;
import org.aspectj.util.FileUtil;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import com.gt.model.FileImage;


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
	 * @see com.gt.util.UploadFile#uploadFile(com.gt.model.FileImage)
	 */
    @Override
	public String uploadFile(FileImage fileImage){
    	String pic = CreateNewName(fileImage.getFilename());
    	try {
			FileUtil.copyFile(fileImage.getFile(), new File(filepath,pic));
			return pic;
    	} catch (IOException e) {
			throw new RuntimeException(e);
		}finally {
			fileImage.getFile().delete();
		}	
    	
     }
}
