package com.example.controller;

import cn.hutool.core.util.ObjectUtil;
import com.example.domain.Remarks;
import com.example.service.RemarksService;
import com.example.utils.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/comments")
@CrossOrigin
public class CommentsController {

    @Autowired
    private RemarksService remarksService;

    @GetMapping("/getComment")
    public Result getComment(String blog) {
        if (ObjectUtil.isEmpty(blog)) {
            return new Result(400, "参数错误");
        }
        try {
            Object comments = remarksService.getComment(blog);
            if (comments == null) {
                return new Result(404, "未找到评论");
            }
            return new Result(comments);
        } catch (Exception e) {
            return new Result(500, "服务器内部错误");
        }
    }
    @PostMapping("/upComment")
    public Result upComment(@RequestBody Remarks remarks) {
        if (remarksService.upComment(remarks)) {
            return new Result(200, "评论成功");
        } else {
            return new Result(400, "评论失败");
        }

    }
}
