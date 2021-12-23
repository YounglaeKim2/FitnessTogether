package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.kosmo.ft.service.ListPagingData;
import com.kosmo.ft.service.MappingDTO;
import com.kosmo.ft.service.MappingService;
import com.kosmo.ft.service.PagingUtil;

/*
 * 이름 미 지정시 ID값은 소문자로 시작하는 클래스명이됨
 * 예]OneMemoServiceImpl클래인 경우 
 * ID값은 oneMemoServiceImpl
 * 지정도 가능 @Service(value="임의의ID값")
 */

@Service("mappingService")
public class MappingServiceImpl implements MappingService{
	
	//MappingDAO주입
	@Resource(name="mappingDAO")
	private MappingDAO dao;
	
	@Autowired
	private LineCommentDAO lcdao;
	
	//리소스파일(onememo.properties)에서 읽어오기
	@Value("${PAGE_SIZE}")
	private int pageSize;
	@Value("${BLOCK_PAGE}")
	private int blockPage;
	
	@Override
	public ListPagingData<MappingDTO> selectList(
			Map map, HttpServletRequest req, int nowPage){
		//페이징을 위한 로직 시작
		//전체 레코드수
		int totalRecordCount = dao.getTotalRowCount(map);
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);
		//시작 및 끝 ROWNUM구하기
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		//페이징을 위한 로직 끝
		map.put("start", start);
		map.put("end", end);
		//글 전체 목록 얻기
		List lists= dao.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/fnt/mappingList.do?");
		
		//Lombok라이브러리 미 사용시
		/*
		ListPagingData<OneMemoDTO> listPagingData = new ListPagingData<>();
		listPagingData.setBlockPage(blockPage);
		listPagingData.setLists(lists);
		listPagingData.setNowPage(nowPage);
		listPagingData.setPageSize(pageSize);
		listPagingData.setPagingString(pagingString);
		listPagingData.setTotalRecordCount(totalRecordCount);
		return listPagingData;*/
		//Lombok사용시
		return ListPagingData.builder().lists(lists).nowPage(nowPage).pageSize(pageSize).pagingString(pagingString).totalRecordCount(totalRecordCount).build();
		
	}
	@Override
	public MappingDTO selectOne(Map map) {
		return dao.selectOne(map);
	}
	@Override
	public int insert(Map map) {
		
		int affected=0;
		try {
			affected=dao.insert(map);
		}
		catch(Exception e) {e.printStackTrace();}
		return affected;
	}
	@Override
	public int delete(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
	@Override
	public int update(Map map) {
		// TODO Auto-generated method stub
		return 0;
	}
  
   
} 

