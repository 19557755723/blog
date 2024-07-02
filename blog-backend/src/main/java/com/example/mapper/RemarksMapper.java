package com.example.mapper;

import com.example.domain.Remarks;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface RemarksMapper extends BaseMapper<Remarks> {

    Boolean upComment(Remarks remarks);
    List<Remarks> getComment(String blog);
    List<Remarks> delComment(String blog);
}




