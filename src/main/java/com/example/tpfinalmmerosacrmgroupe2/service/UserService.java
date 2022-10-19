package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

@Service
public class UserService {

    private UserRepository userRepository;
    private StorageService storageService;

    public UserService(UserRepository userRepository, StorageService storageService) {
        this.userRepository = userRepository;
        this.storageService = storageService;
    }

    public User createUpdateUser(CreateUser createUser) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        User user;

        if (createUser.getId() == null){
            user = new User();
        }else {
            user = userRepository.findById(createUser.getId()).get();
        }

        MultipartFile picture = createUser.getPhotoFile();
        if (picture.getOriginalFilename().equals("")){
            user.setPhotoUrl(createUser.getPhotoUrl());
        }else {
            storageService.store(picture);
            user.setPhotoUrl("http://localhost:8080/images/" + picture.getOriginalFilename());
        }

        user.setEmail(createUser.getEmail());
        user.setNom(createUser.getNom());
        user.setPrenom(createUser.getPrenom());
        user.setPhotoUrl(createUser.getPhotoUrl());
        user.setId(createUser.getId());
        if (createUser.getPassword().equals(user.getPassword())){}else {
            user.setPassword(passwordEncoder.encode(createUser.getPassword()));
        }

        return userRepository.save(user);
    }

    public User getUserByMail(String mail) {
        return userRepository.findByEmail(mail);
    }

}
