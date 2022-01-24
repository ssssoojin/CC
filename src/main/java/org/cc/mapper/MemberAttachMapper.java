package org.cc.mapper;

import java.util.List;

import org.cc.domain.MemberAttachVO;

public interface MemberAttachMapper {
   public List<MemberAttachVO> findByUserId(String userId);
   public void insert(MemberAttachVO vo);
   public void delete(String uuid);
   public void update(MemberAttachVO vo);
   public void deleteAll(String userId);
   
   
}