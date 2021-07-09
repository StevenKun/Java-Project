package com.likun.usercenter.service.user;

import com.likun.usercenter.dao.user.UserMapper;
import com.likun.usercenter.domain.entity.user.User;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor(onConstructor = @_(@Autowired))
public class UserService {

    private final UserMapper userMapper;

    public User getUserFindById(Integer id){


        User user = userMapper.selectByPrimaryKey(id);


        return user;

    }




}
