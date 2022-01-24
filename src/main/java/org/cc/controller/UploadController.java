package org.cc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.nio.file.Files;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Base64;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.cc.domain.AttachFileDTO;
import org.cc.domain.MemberAttachVO;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;
import net.coobird.thumbnailator.Thumbnailator;

@Controller
@Log4j
public class UploadController {

	private String getFolder() {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String str = sdf.format(date);
		return str.replace("-", File.separator);
	}

	// 이미지 파일인지 확인
	private boolean checkImageType(File file) {
		try {
			String contentType = Files.probeContentType(file.toPath());
			return contentType.startsWith("image");
		} catch (IOException e) {
			e.printStackTrace();
		}
		return false;
	}

	@GetMapping("/uploadAjax")
	public void uploadAjax() {
		log.info("upload ajax");
	}

	@PostMapping(value = "/uploadAjaxAction", produces = MediaType.APPLICATION_JSON_VALUE)
	@ResponseBody
	public ResponseEntity<List<MemberAttachVO>> uploadAjaxPost(MultipartFile[] uploadFile) {
		List<MemberAttachVO> list = new ArrayList<>();
		String uploadFolder = "C:\\Users\\BIT\\Desktop\\ColorCustom\\upload";

		String uploadFolderPath = getFolder();
		// 폴더 생성하기
		File uploadPath = new File(uploadFolder, uploadFolderPath);
		log.info("프로필 이미지 업로드 경로 : " + uploadPath);

		if (uploadPath.exists() == false) {// 폴더가 존재하지 않으면 새로 생성
			uploadPath.mkdirs(); // yyyy/MM/dd 폴더 생성
		}

		for (MultipartFile multipartFile : uploadFile) {
			MemberAttachVO attachDTO = new MemberAttachVO();
			log.info("--------------------------------------");
			log.info("Upload File Name : " + multipartFile.getOriginalFilename());
			log.info("Upload File Size : " + multipartFile.getSize());

			String uploadFileName = multipartFile.getOriginalFilename();// 파일 이름 설정

			// 파일명 랜덤생성 (UUID를 이용해서 고유한 파일명 생성)
			UUID uuid = UUID.randomUUID();
			attachDTO.setFileName(uploadFileName);
			uploadFileName = uuid.toString() + "_" + uploadFileName;// 랜덤생성 + 파일이름 저장

			File saveFile = new File(uploadPath, uploadFileName);
			try {
				multipartFile.transferTo(saveFile);

				attachDTO.setUuid(uuid.toString());
				attachDTO.setUploadPath(getFolder());

				// check image type file
				if (checkImageType(saveFile)) {
					attachDTO.setFileType(true);
					FileOutputStream thumbnail = new FileOutputStream(new File(uploadPath, "s_" + uploadFileName));
					Thumbnailator.createThumbnail(multipartFile.getInputStream(), thumbnail, 100, 100); // 섬네일 크기
					thumbnail.close();
				}

				// add to List
				list.add(attachDTO);
				log.info("attachDTO : " + attachDTO);

			} catch (Exception e) {
				e.printStackTrace();
			}

		} // end for
		return new ResponseEntity<>(list, HttpStatus.OK);
	}

	// 섬네일 데이터 전송하기
	@GetMapping("/display")
	@ResponseBody
	public ResponseEntity<byte[]> getFile(String fileName) {
		log.info("fileName: " + fileName);
		File file = new File("C:\\Users\\BIT\\Desktop\\ColorCustom\\upload\\" + fileName);
		log.info("file : " + file);
		ResponseEntity<byte[]> result = null;

		try {
			HttpHeaders header = new HttpHeaders();
			// 적당한 MIME 타입을 헤더에 추가
			header.add("Content-Type", Files.probeContentType(file.toPath()));
			result = new ResponseEntity<byte[]>(FileCopyUtils.copyToByteArray(file), header, HttpStatus.OK);
		} catch (IOException e) {
			e.printStackTrace();
		}
		return result;
	}

	// 서버에서 첨부파일 삭제
	@PostMapping("/deleteFile")
	@ResponseBody
	public ResponseEntity<String> deleteFile(String fileName, String type) {
		log.info("deleteFile : " + fileName);

		File file;

		try {
			file = new File("C:\\Users\\BIT\\Desktop\\ColorCustom\\upload\\" + URLDecoder.decode(fileName, "UTF-8"));

			file.delete();

			if (type.equals("image")) {
				String largeFileName = file.getAbsolutePath().replace("s_", "");
				log.info("largetFileName : " + largeFileName);
				file = new File(largeFileName);
				file.delete();
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return new ResponseEntity<>(HttpStatus.NOT_FOUND);
		}

		return new ResponseEntity<String>("deleted", HttpStatus.OK);
	}

	// 캡쳐 이미지 저장
	@ResponseBody
	@PostMapping("/saveCapture")
	public AttachFileDTO ImgSaveTest(@RequestParam HashMap<Object, Object> param, final HttpServletRequest request,
			final HttpServletResponse response) throws Exception {

		AttachFileDTO attachDTO = new AttachFileDTO();

		String binaryData = request.getParameter("imgSrc");
		String itemName = request.getParameter("itemName");
		attachDTO.setFileName(itemName);

		FileOutputStream stream = null;

		// 폴더 생성하기
		String uploadFolder = "C:\\Users\\BIT\\Desktop\\ColorCustom\\upload\\custom";
		File uploadPath = new File(uploadFolder, getFolder());
		log.info("upload Path : " + uploadPath);
		if (uploadPath.exists() == false) { // 폴더가 존재하지 않으면 새로 생성
			uploadPath.mkdirs(); // yyyy/MM/dd 폴더 생성
		}

		try {
			System.out.println("binary file" + binaryData);
			if (binaryData == null || binaryData.trim().equals("")) {
				throw new Exception();
			}
			binaryData = binaryData.replaceAll("data:image/png;base64,", "");
			byte[] file = Base64.getDecoder().decode(binaryData);
			UUID uuid = UUID.randomUUID();
			itemName = uuid.toString();

			attachDTO.setUuid(uuid.toString()); // uuid
			attachDTO.setUploadPath("custom/" + getFolder()); // 파일 경로
			attachDTO.setImage(true);

			stream = new FileOutputStream(uploadPath + "/" + itemName + ".png");
			stream.write(file);
			stream.close();
			System.out.println("캡처 저장");

		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("에러 발생");
		} finally {
			if (stream != null) {
				stream.close();
			}
		}

		return attachDTO;
	}
}