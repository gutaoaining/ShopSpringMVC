package com.gt.util;

import org.springframework.web.multipart.MultipartFile;

public interface UploadFile {

	String uploadFile(MultipartFile fileImage);

}