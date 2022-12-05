package com.ssafy.homes.controller;

import java.io.File;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

@CrossOrigin
@RestController
@RequestMapping("/file")
public class FileController {
	
	/**ck에디터 파일업로드 이벤트 발생 시 처리
	 * @param model
	 * @param fileload
	 * @return
	 */
	
	@Autowired
    private ServletContext servletContext;
	
	@PostMapping("/upload/image")
	public Map<String, Object> uploadImage(@RequestParam Map<String, Object> paramMap, MultipartRequest request) throws Exception
	{
		MultipartFile uploadFile = request.getFile("upload");
		String uploadDir = servletContext.getRealPath("/").replace("\\", "/") + "/static/upload/images/";
		String uploadId = UUID.randomUUID().toString() + "." + FilenameUtils.getExtension(uploadFile.getOriginalFilename());
		uploadFile.transferTo(new File(uploadDir + uploadId));
		paramMap.put("url", "/static/upload/images/" + uploadId);
		return paramMap;
	}

}
