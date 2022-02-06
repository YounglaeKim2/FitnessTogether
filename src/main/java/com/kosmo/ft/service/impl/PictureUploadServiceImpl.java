package com.kosmo.ft.service.impl;


import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletRequest;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.MultipartRequest;

import com.kosmo.ft.service.PictureDTO;
import com.kosmo.ft.service.PictureUploadService;

@Transactional
@Service("pictureUploadService")
public class PictureUploadServiceImpl implements PictureUploadService {

    @Resource(name = "pictureUploadDAO")
    private PictureUploadDAO dao;

    @Override
    public boolean pictureUpload(MultipartHttpServletRequest mhsr) {

        String id = mhsr.getParameter("id"); //파라미터로 SQL에서 검색할 키값 받아오기
        String subject = mhsr.getParameter("subject");
        String content = mhsr.getParameter("content"); //파라미터로 본문텍스트 가져오기

        MultipartFile imgFile = mhsr.getFile("imgName");

        //DAO에서 활용할 map데이터 생성하기
        Map map = new HashMap<>();
        map.put("id", id);
        map.put("subject", subject);
        map.put("content", content);

        if (!imgFile.isEmpty()) {
            String path = mhsr.getServletContext().getRealPath("resources/images/upload/picture");
            System.out.println(path);

            String rename=FileUpDownUtils.getNewFileName(path,imgFile.getOriginalFilename());
            File dest = new File(path+File.separator+rename);


            System.out.println(rename);
            System.out.println(dest);

            try {
                imgFile.transferTo(dest);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                System.out.println("서버에 사진업로드 실패");
                return false;
            }

            map.put("imgName", rename);
        }

        //Map을 통해 먼저 글을 입력
        try {
            dao.pictureUpload(map);
        } catch (Exception e) {
            System.out.println(e);
        }
        System.out.println("작성된 글 번호:" + map.get("bno")); // DB에 방금 저장한 글의 키값을 map을 통해 받아옴, 결과값 확인

        return true;
    }//pictureUpload

    @Override
    public int modify(MultipartHttpServletRequest mhsr) { //update
        String bno = mhsr.getParameter("bno");
        String id = mhsr.getParameter("id"); //파라미터로 SQL에서 검색할 키값 받아오기
        String subject = mhsr.getParameter("subject");
        String content = mhsr.getParameter("content"); //파라미터로 본문텍스트 가져오기

        MultipartFile imgFile = mhsr.getFile("imgName");

        Map map = new HashMap<>();
        map.put("bno", bno);
        map.put("id", id);
        map.put("subject", subject);
        map.put("content", content);


        if (!imgFile.isEmpty()) {
            String path = mhsr.getServletContext().getRealPath("resources/images/upload/picture");
            System.out.println(path);

            String rename = FileUpDownUtils.getNewFileName(path, imgFile.getOriginalFilename());
            File dest = new File(path + File.separator + rename);

            System.out.println(rename);
            System.out.println(dest);

            try {
                imgFile.transferTo(dest);
            } catch (IllegalStateException | IOException e) {
                e.printStackTrace();
                System.out.println("서버에 사진업로드 실패");
            }

            map.put("imgName", rename);
        }

        return dao.update(map);
    }

    @Override
    public void delete(Map map) {
        dao.delete(map);
    }

    @Override
    public PictureDTO selectOne(Map map) {

        return dao.selectOne(map);
    }

}//PictureUploadServiceImpl

