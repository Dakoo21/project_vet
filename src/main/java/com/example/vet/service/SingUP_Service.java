package com.example.vet.service;

import com.example.vet.model.User;
import com.example.vet.repository.SingUP_IN;
import org.springframework.stereotype.Service;

@Service
public class SingUP_Service {

    private final SingUP_IN singUPIn;

    public SingUP_Service(SingUP_IN singUPIn) {
        this.singUPIn = singUPIn;
    }

    public int userinsert(User user) {
        int result;
        result = singUPIn.userInsert(user);
        return  result;
    }
}
