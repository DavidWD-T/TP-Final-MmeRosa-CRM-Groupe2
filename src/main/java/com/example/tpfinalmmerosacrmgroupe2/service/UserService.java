package com.example.crm.service;

import com.example.crm.controller.dto.CreateUser;
import com.example.crm.entity.User;
import com.example.crm.entity.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class UserService {

    private UserRepository userRepository;
    private StorageService storageService;

    public UserService(UserRepository userRepository, StorageService storageService) {
        this.userRepository = userRepository;
        this.storageService = storageService;
    }

    public List<User> getAllUsers(){
        return (List<User>) userRepository.findAll();
    }

    public User getUserById(long id){
        return userRepository.findById(id).get();
    }

    public boolean deleteUserById(long id){
        userRepository.deleteById(id);
        return true;
    }

    public boolean createUser(CreateUser createUser){
        BCryptPasswordEncoder encodedPassword = new BCryptPasswordEncoder();

        User user = new User();
        user.setNom(createUser.getNom());
        user.setPrenom(createUser.getPrenom());
        user.setPassword(encodedPassword.encode(createUser.getPassword()));
        user.setEmail(createUser.getEmail());
        user.setDateCreation(createUser.getDateCreation());

        MultipartFile photo = createUser.getPhotoFile();
        if (photo == null) {
            user.setPhotoUrl(createUser.getPhotoUrl());
        } else {
            storageService.store(photo);
            user.setPhotoUrl("http://localhost:8080/images/" + photo.getOriginalFilename());
        }

        userRepository.save(user);
        return true;
    }

    public boolean editUser(CreateUser createUser){
        User userToEdit = userRepository.findById(createUser.getId()).get();

        userToEdit.setEmail(createUser.getEmail());
        userToEdit.setPassword(createUser.getPassword());

        MultipartFile picture = createUser.getPhotoFile();
        if (picture == null) {
            userToEdit.setPhotoUrl(createUser.getPhotoUrl());
        } else {
            storageService.store(picture);
            userToEdit.setPhotoUrl("http://localhost:8080/images/" + picture.getOriginalFilename());
        }

        userRepository.save(userToEdit);
        return true;
    }

}
