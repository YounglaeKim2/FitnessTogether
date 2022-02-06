package com.kosmo.ft.web;

import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kosmo.ft.service.PictureDTO;
import com.kosmo.ft.service.PictureHeartDTO;
import com.kosmo.ft.service.PictureReplyDTO;
import com.kosmo.ft.service.impl.PictureDAO;
import com.kosmo.ft.service.impl.PictureHeartDAO;
import com.kosmo.ft.service.impl.PictureReplyDAO;
import com.kosmo.ft.service.impl.PictureUploadServiceImpl;

@Controller
public class PhotoBbsController extends HttpServlet {

    @Autowired
    PictureDAO dao;

    //서비스 주입]
    @Resource(name = "pictureUploadService")
    private PictureUploadServiceImpl pictureUploadService;

    //게시글입력폼이동
    @RequestMapping(value = "/fnt/picture_write.do", method = RequestMethod.GET)
    public String write(@ModelAttribute("id") String id) {
        return "photobbs/Picture_write";
    }

    //게시글상세폼이동
    @RequestMapping(value = "/fnt/picture_detail.do/{bno}", method = RequestMethod.GET)
    public String detail(@ModelAttribute("id") String id, @PathVariable Integer bno, @RequestParam Map map, Model model) {
        map.put("bno", bno);
        model.addAttribute("item", pictureUploadService.selectOne(map));
        return "photobbs/Picture_detail";
    }

    //게시글수정폼이동
    @RequestMapping(value = "/fnt/picture_modify.do/{bno}", method = RequestMethod.GET)
    public String modify(@ModelAttribute("id") String id, @PathVariable Integer bno, @RequestParam Map map, Model model) {
        map.put("bno", bno);
        model.addAttribute("item", pictureUploadService.selectOne(map));
        return "photobbs/Picture_modify";
    }

    //게시글 입력처리
    @RequestMapping(value = "/fnt/picture_write.do", method = RequestMethod.POST)
    public String writeOK(MultipartHttpServletRequest mhsr) throws Exception {
        pictureUploadService.pictureUpload(mhsr);
        //뷰정보 반환 목록으로 이동
        return "forward:/fnt/picture_list.do";
    }

    //게시글 수정처리
    @RequestMapping(value = "/fnt/picture_modify.do", method = RequestMethod.POST)
    public String modifyOK(MultipartHttpServletRequest mhsr) throws Exception {
        pictureUploadService.modify(mhsr);
        //뷰정보 반환 목록으로 이동
        return "forward:/fnt/picture_list.do";
    }

    //게시글 삭제처리
    @RequestMapping("/fnt/picture_delete.do/{bno}")
    public String delete(@RequestParam Map map, @PathVariable Integer bno) throws Exception {
        //서비스 호출
        map.put("bno", bno);
        pictureUploadService.delete(map);
        //리스트로
        return "forward:/fnt/picture_list.do";
    }

    //공통적용 + 검색창 목록 관련
    @RequestMapping("/fnt/picture_list.do")
    public String picture_list(HttpServletRequest request, HttpSession session) {

        final int PAGE_ROW_COUNT = 12;

        //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
        int pageNum = 1;
        //페이지 번호가 파라미터로 전달되는지 읽어와 본다.
        String strPageNum = request.getParameter("pageNum");
        //페이지의 번호가 파라미터로 넘어온다면
        if (strPageNum != null) {
            //숫자로 바꿔서 보여줄 페이지 번호로 지정
            pageNum = Integer.parseInt(strPageNum);

        }//if

        //보여줄 페이지의 시작 ROWNUM -0부터 시작
        int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
        //보여줄 페이지의 끝 ROWNUM
        int endRowNum = pageNum * PAGE_ROW_COUNT;

        int rowCount = PAGE_ROW_COUNT;

        //검색 키워드 관련된 처리 - 검색 키워드가 파라미터로 넘어올 수 있고 안넘어 올 수도 있음.
        String keyword = request.getParameter("keyword");
        String condition = request.getParameter("condition");

        //키워드가 넘어오지 않는다면
        if (keyword == null) {
            //키워드와 검색 조건에 빈 문자열 넣기
            keyword = "";
            condition = "";
        }//if

        //특수기호를 인코딩한 키워드를 미리 준비한다.
        String encodedK = URLEncoder.encode(keyword);

        //startRowNum과 rowCount를 PictureDTO객체에 담는다.
        PictureDTO pto = new PictureDTO();
        pto.setStartRowNum(startRowNum);
        pto.setEndRowNum(endRowNum);
        pto.setRowCount(rowCount);

        //ArrayList 객체의 참조값을 담을 지역변수 생성
        ArrayList<PictureDTO> list = null;
        //전체 row의 개수를 담을 지역변수를 미리 만든다. -검색조건이 들어올 경우 '검색결과갯수'가 된다.
        int totalRow = 0;

        //검색키워드가 넘어온다면
        if (!keyword.equals("")) { //검색조건에 따라 분기
            if (condition.equals("subject")) { //제목검색
                pto.setSubject(keyword);
            } else if (condition.equals("content")) { //내용검색
                pto.setContent(keyword);
            }
            //다른검색조건 추가시 else if추가

        }
        if (session.getAttribute("id") == null) {
            //로그인 상태가 아닐때
            //System.out.println("로그인 상태가 아닐때");
            //사진 게시판 목록 가져오기
            list = dao.boardList(pto);
        } else {
            //로그인 상태일때
            //System.out.println("로그인 상태일때");

            //현재 사용자의 아이디 세팅
            pto.setId((String) session.getAttribute("id"));

            //사진 게시판 목록 가져오기
            list = dao.boardListLogin(pto);
        }
        //글의 개수
        totalRow = dao.PictureCount(pto);

        //전체 페이지의 갯수 구하기
        int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

        request.setAttribute("list", list);
        request.setAttribute("totalPageCount", totalPageCount);
        request.setAttribute("condition", condition);
        request.setAttribute("keyword", keyword);
        request.setAttribute("totalRow", totalRow);
        //pageNum도 추가로 담아주기
        request.setAttribute("pageNum", pageNum);

        //여기까지의 내용이 PhotoList 페이지와 동일하게 적용될 내용
        //PhotoList페이지는 스크롤을 내릴때 추가되는 게시물들을 가져오기 떄문에
        //best5에 해당사항 없음

        //좋아요(heart)순 상위5개 가져오기
        ArrayList<PictureDTO> bestList = new ArrayList();
        bestList = dao.bestList(pto);

        request.setAttribute("bestList", bestList);

        return "photobbs/Picture_list";
    }

    //디폴트 사진목록
    @RequestMapping("/fnt/photoList.do")
    public String photoList(HttpServletRequest request, HttpSession session) {

        //한 페이지에 표시할 이미지카드수(12로 설정)
        final int PAGE_ROW_COUNT = 12;

        //보여줄 페이지의 번호를 일단 1이라고 초기값 지정
        int pageNum = 1;
        //페이지 번호가 파라미터로 전달되는지 읽어와 본다
        String strPageNum = request.getParameter("pageNum");
        //만일 페이지 번호가 파라미터로 넘어온다면
        if (strPageNum != null) {
            //숫자로 바꿔서 보여줄 페이지 번호로 지정한다.
            pageNum = Integer.parseInt(strPageNum);
        }

        //보여줄 페이지의 시작 ROWNUM -0 부터 시작
        int startRowNum = 0 + (pageNum - 1) * PAGE_ROW_COUNT;
        //보여줄 페이지의 끝 ROWNUM
        int endRowNum = pageNum * PAGE_ROW_COUNT;
        int rowCount = PAGE_ROW_COUNT;

        //검색키워드 관련 처리
        String keyword = request.getParameter("keyword");
        String condition = request.getParameter("condition");
        //만일 키워드로 넘어오지 않는다면
        if (keyword == null) {
            keyword = "";
            condition = "";
        }

        //특수기호 인코딩 키워드를 준비
        String encodedK = URLEncoder.encode(keyword);

        //startRowNum과 rowCount를 PictureDTO 객체에 담기
        PictureDTO pto = new PictureDTO();
        pto.setStartRowNum(startRowNum + 1);
        pto.setEndRowNum(endRowNum);
        pto.setRowCount(rowCount);

        //ArrayList 객체의 참조값 담을 지역변수
        ArrayList<PictureDTO> list = null;
        //전체 row의 갯수를 담을 지역변수 미리 만들기.
        int totalRow = 0;

        //검색키워드가 넘어올경우
        if (!keyword.equals("")) { //검색조건에따른 분기
            if (condition.equals("subject")) { //제목일경우
                //검색 키워드를 PictureDTO에 담아서 전달한다.
                pto.setSubject(keyword);
            } else if (condition.equals("content")) { //내용일경우
                pto.setContent(keyword);
            }

            //기타 검색조건 추가시 아래 else if() 계속 추가
        }

        // 위의 분기에 따라 pto에 담기에는 내용이 다르고
        // 그 내용을 기준으로 조건이 다를때마다 다른내용이 select 되도록 dynamic query를 구성한다.
        // 글 목록 얻어오기

        if (session.getAttribute("id") == null) {
            //로그인 상태가 아닐때
            //사진게시판 목록 가져오
            list = dao.boardList(pto);
        } else {
            //로그인 상태일때

            //현재 사용자의 닉네임을 세팅
            pto.setId((String) session.getAttribute("id"));

            //사진게시판 목록 가져오기
            list = dao.boardListLogin(pto);
        }

        //글 갯수
        totalRow = dao.PictureCount(pto);

        //전체 페이지의 갯수 구하기
        int totalPageCount = (int) Math.ceil(totalRow / (double) PAGE_ROW_COUNT);

        request.setAttribute("list", list);
        request.setAttribute("totalPageCount", list);
        request.setAttribute("condition", condition);
        request.setAttribute("keyword", keyword);
        request.setAttribute("totalRow", totalRow);
        request.setAttribute("pageNum", pageNum);

        return "photobbs/PhotoList";
    }

    /////////////좋아요 관련

    @Autowired
    PictureHeartDAO heartDao;

    @ResponseBody
    @RequestMapping(value = "/fnt/saveHeart.do")
    public PictureDTO save_heart(@RequestParam String hno, HttpSession session) {

        PictureHeartDTO dto = new PictureHeartDTO();

        //게시물 번호를 세팅
        dto.setBno(hno);

        //좋아요 누른 사람 id을 세팅
        dto.setId((String) session.getAttribute("id"));

        // +1된 좋아요수 담아오기 위하여
        PictureDTO pto = heartDao.pictureSaveHeart(dto);

        return pto;
    }

    @ResponseBody
    @RequestMapping(value = "/fnt/removeHeart.do")
    public PictureDTO remove_heart(@RequestParam String hno, HttpSession session) {

        PictureHeartDTO dto = new PictureHeartDTO();

        //게시물 번호를 세팅
        dto.setBno(hno);

        //좋아요 누른 사람 name을 세팅
        dto.setId((String) session.getAttribute("id"));

        // +1된 좋아요수 담아오기 위하여
        PictureDTO pto = heartDao.pictureRemoveHeart(dto);

        return pto;
    }
    /////////////

    //댓글 관련

    @Autowired
    PictureReplyDAO replyDao;

    //댓글 작성
    @ResponseBody
    @RequestMapping(value = "/fnt/picture_write_reply.do")
    public PictureDTO write_reply(@RequestParam String rno, @RequestParam String content, HttpSession session) {

        PictureReplyDTO dto = new PictureReplyDTO();

        //게시물 번호 세팅
        dto.setBno(rno);

        //댓글 내용 세팅
        dto.setContent(content);

        //댓글작성자 name을 name으로 세팅
        dto.setName((String) session.getAttribute("id"));

        // +1된 댓글 갯수를 담아오기 위해서
        PictureDTO pto = replyDao.pictureWriteReply(dto);

        return pto;
    }

    //대댓글 작성
    @ResponseBody
    @RequestMapping(value = "/fnt/picture_write_rereply_do")
    public PictureDTO write_rereply(@RequestParam String rno, @RequestParam String bno, @RequestParam String content,
                                    HttpSession session) {

        PictureReplyDTO dto = new PictureReplyDTO();

        //게시물 번호 세팅
        dto.setBno(bno);

        //DTO에 int로 정의되어 있기 때문에 String인 rno를 int로 변환시켜 넣어준다.
        //댓글 번호 no를 grp로 세팅
        dto.setGrp(Integer.parseInt(rno));

        //대댓글의 깊이가 1이 되어야 하므로 grpl을 1로 세팅
        dto.setGrpl(1);

        //대댓글 내용 세팅
        dto.setContent(content);

        //대댓글 작성자 name을 세팅
        dto.setName((String) session.getAttribute("id"));

        // +1된 대댓글갯수 담아오기
        PictureDTO pto = replyDao.pictureWriteReReply(dto);

        return pto;
    }

    //댓글 리스트
    @ResponseBody
    @RequestMapping(value = "/fnt/picture_replyList.do")
    public ArrayList<PictureReplyDTO> reply_list(@RequestParam String rno, HttpSession session) {

        PictureReplyDTO dto = new PictureReplyDTO();

        //댓글리스트의 게시물번호 세팅
        dto.setBno(rno);

        ArrayList<PictureReplyDTO> replyList = new ArrayList();

        replyList = replyDao.replyList(dto);

        return replyList;
    }

    //댓글삭제
    @ResponseBody
    @RequestMapping(value = "/fnt/picture_delete_reply.do")
    public PictureDTO picture_delete_reply(@RequestParam String rno, @RequestParam String bno) {

        PictureReplyDTO dto = new PictureReplyDTO();

        //댓글 번호 세팅
        dto.setRno(rno);

        //게시물 번호 세팅
        dto.setBno(bno);

        //갱신된 댓글 갯수를 담아오기 위해
        PictureDTO pto = replyDao.pictureDeleteReply(dto);

        return pto;
    }

    //대댓글삭제
    @ResponseBody
    @RequestMapping(value = "/fnt/picture_delete_rereply.do")
    public PictureDTO delete_rereply(@RequestParam String rno, @RequestParam String bno, @RequestParam int grp) {

        PictureReplyDTO dto = new PictureReplyDTO();

        //대댓번호 세팅 - 대댓 삭제하기 위해
        dto.setRno(rno);

        //게시물번호셋팅 - BOARD테이블의 reply + 1 하기 위해서
        dto.setBno(bno);

        //grp세팅 - 댓글은 삭제를 해도 대댓글은 남아있게 되는데 대댓글이 모두삭제되면 댓글도 삭제하기 위해
        dto.setGrp(grp);

        PictureDTO pto = replyDao.pictureDeleteReReply(dto);

        return pto;
    }

}///PhotoBbsController
