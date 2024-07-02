package com.example.service;

import com.example.domain.Remarks;
import com.baomidou.mybatisplus.extension.service.IService;

import java.util.List;


public interface RemarksService extends IService<Remarks> {

    Boolean upComment(Remarks remarks);

    List<Remarks> getComment(String blog);
}
