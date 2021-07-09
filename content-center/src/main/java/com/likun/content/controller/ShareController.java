package com.likun.content.controller;

import com.likun.content.domain.dto.content.ShareDTO;
import com.likun.content.service.content.ShareService;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
@RequestMapping("/shares")
public class ShareController {


    private final ShareService shareService;

    @GetMapping("/{id}")
    public ShareDTO shareFindById (@PathVariable Integer id){

        ShareDTO shareById = this.shareService.getShareById(id);
        return shareById;

    }


}
