package com.kosmo.ft.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.support.TransactionTemplate;

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
	
	//MappingDAO주임
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
	public boolean isLogin(Map map) {
		return dao.isLogin(map);
	}
	
	@Override
	public ListPagingData<MappingDTO> selectList(
			Map map, HttpServletRequest req, int nowPage) {
		//페이징을 위한 로직 시작]
		//전체 레코드수	
		int totalRecordCount = dao.getTotalRowCount(map);		
		//전체 페이지수
		int totalPage = (int)Math.ceil((double)totalRecordCount/pageSize);		
		//시작 및 끝 ROWNUM구하기
		int start= (nowPage-1)*pageSize+1;
		int end = nowPage*pageSize;
		//페이징을 위한 로직 끝]
		map.put("start", start);
		map.put("end", end);
		//글 전체 목록 얻기
		List lists= dao.selectList(map);
		String pagingString=PagingUtil.pagingBootStrapStyle(totalRecordCount, 
				pageSize, blockPage, nowPage,
				req.getContextPath()+"/mapping/MappingList.do?");
		
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
	
	/*
	 //https://mybatis.org/spring/transactions.html
	 [삭제 작업을 트랜잭션 처리하기]
	 1.빈 설정파일(root-context.xml)에 DataSourceTransactionManager 등록
	 2.빈 설정파일(root-context.xml)에 TransactionTemplate 등록
	 3.TransactionTemplate 주입받는다
	 4.TransactionTemplate객체의 execute()메소드로 트랜잭션 작업 실행
	   You can omit to call the commit and rollback method using the TransactionTemplate.
	 
	 ※트랜잭션 작업에서 런타임 오류시 롤백,정상 실행시 커밋된다
	  트랜잭션 처리는 @Service어노테이션이 붙은 클래스에서 하자
	 */
	/*
	@Autowired
	private TransactionTemplate transactionTemplate;
	*/
	@Override
	public int delete(Map map) {
		int affected=0;
		try {
			//1.람다함수 미 사용
			/*
			affected=transactionTemplate.execute(new TransactionCallback<Integer>() {

				@Override
				public Integer doInTransaction(TransactionStatus status) {
					//삭제된 글의  댓글 수 반환
					//글번호에 따른 모든 댓글 삭제
					int commentCount=lcdao.deleteByNo(map);
					//트랙잭션 테스트용 에러 코드 두줄 추가				
					//String str=null;
					//str.length();
					//해당 글 삭제
					dao.delete(map);
					return commentCount;//반환값이 execute메소드의 반환값이다 
				}
				
			});*/
			//2.람다함수 사용
//			affected=transactionTemplate.execute(tx->{
//				int commentCount=lcdao.deleteByNo(map);
//				dao.delete(map);
//				return commentCount;
//			});
		}
		catch(Exception e) {e.printStackTrace();}
		System.out.println("삭제된 댓글 수:"+affected);
		return affected;
	}
	
	@Override
	public int update(Map map) {
		return dao.update(map);
	}
}