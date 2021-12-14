package com.kosmo.ft.service.impl;


import javax.annotation.Resource;


import org.springframework.stereotype.Service;

import com.kosmo.ft.service.MemberDTO;
import com.kosmo.ft.service.MemberService;


@Service("memberServiceImpl")
public class MemberServiceImpl implements MemberService{

    @Resource(name="memberDAO")
    private MemberDAO memberDAO;

    @Override
    public boolean Login(MemberDTO dto) throws Exception  {
    
        return memberDAO.Login(dto);

    }
} 

