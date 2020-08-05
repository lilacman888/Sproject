package com.sProject.controller;

import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class UploadController {
	
	private static final Logger logger = LoggerFactory.getLogger(UploadController.class);
	
	@Resource(name = "uploadPath")
	private String uploadPath;
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public void uploadFormGET() throws Exception {
		System.out.println("/upload");
		logger.debug("upload GET.....");
	}

	@RequestMapping(value = "/uploadForm", method = RequestMethod.POST)
	public void uploadFormPOST(MultipartFile file, Model model, @RequestParam String type) throws Exception{
		System.out.println("/upload");
		logger.debug("upload POST.....originalName={}, size={}, contentType={}",
				file.getOriginalFilename(),
				file.getSize(),
				file.getContentType());
		//저장된 파일명
		String savedFileName = uploadFile(file);
		model.addAttribute("savedFileName", savedFileName);
		model.addAttribute("type", type);
		System.out.println(type);
	}
    
	private String uploadFile(MultipartFile file) throws IOException {
		//임의의 이름 + _ 파일
		String filename = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
		File target = new File(uploadPath, filename);
		FileCopyUtils.copy(file.getBytes(), target);
		return filename;
	}
   

}
