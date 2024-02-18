package com.example.vet.config.auth;

import com.example.vet.model.User;
import com.example.vet.repository.SingUP_IN;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class PrincipalDetailService implements UserDetailsService {
    private final SingUP_IN singUPIn;

    public PrincipalDetailService(SingUP_IN singUPIn) {
        this.singUPIn = singUPIn;
    }


    @Override
    public UserDetails loadUserByUsername(String user_nm) throws UsernameNotFoundException {
        User user = null;
        try {
            user = singUPIn.lgoin(user_nm);
            if (user != null) {
                return new PrincipalDetails(user);
            }
            return null;
        } catch (Exception e) {
            throw new RuntimeException();
        }
    }
}
