package com.example.service.impl;

import cn.hutool.core.date.DateUtil;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.domain.Remarks;
import com.example.service.RemarksService;
import com.example.mapper.RemarksMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public class RemarksServiceImpl extends ServiceImpl<RemarksMapper, Remarks> implements RemarksService {

    @Autowired
    private RemarksMapper remarksMapper;

    @Override
    public List<Remarks> getComment(String blog) {
        List<Remarks> comments = remarksMapper.getComment(blog);
        return comments;
    }

    @Override
    public Boolean upComment(Remarks remarks) {
        remarks.setTime(DateUtil.now());
        if (remarksMapper.upComment(remarks)) {
            return true;
        } else {
            return false;
        }
    }
}




