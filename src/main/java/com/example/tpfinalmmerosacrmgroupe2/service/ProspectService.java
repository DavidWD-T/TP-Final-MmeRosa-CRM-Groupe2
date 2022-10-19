package com.example.crm.service;

import com.example.crm.controller.dto.CreateProspect;
import com.example.crm.controller.dto.CreateUser;
import com.example.crm.entity.Prospect;
import com.example.crm.entity.User;
import com.example.crm.entity.repository.ProspectRepository;
import com.example.crm.entity.repository.UserRepository;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class ProspectService {

    private ProspectRepository prospectRepository;
    private UserRepository userRepository;
    private StorageService storageService;

    public ProspectService(ProspectRepository prospectRepository, UserRepository userRepository, StorageService storageService) {
        this.prospectRepository = prospectRepository;
        this.userRepository = userRepository;
        this.storageService = storageService;
    }

    public List<Prospect> getAll(long userId){
        return  prospectRepository.findAllProspectsByUserById_Id(userId);
    }

    public Prospect getProspectById(long userId, long prospectId){
        return getAll(userId).stream().filter(p-> p.getId()==prospectId).findFirst().get();
    }

    public boolean deleteUserById(long userId, long prospectId){
        Prospect prospectToDelete = getProspectById(userId,prospectId);
        prospectRepository.deleteById(prospectToDelete.getId());
        return true;
    }

    public boolean createProspect(long userId, CreateProspect createProspect){
       User prospectUser = userRepository.findById(userId).get();

        Prospect prospect = new Prospect();
        prospect.setUserById(prospectUser);
        prospect.setEntrepriseById(createProspect.getEntrepriseById());
        prospect.setEmail(createProspect.getEmail());
        prospect.setNom(createProspect.getNom());
        prospect.setPrenom(createProspect.getPrenom());
        prospect.setDureeRelance(createProspect.getDureeRelance());
        prospect.setDateCreationProspection(createProspect.getDateCreationProspection());
        prospect.setEtatProspection(createProspect.getEtatProspection());

        MultipartFile photo = createProspect.getPhotoFile();
        if (photo == null) {
            prospect.setPhotoUrl(createProspect.getPhotoUrl());
        } else {
            storageService.store(photo);
            prospect.setPhotoUrl("http://localhost:8080/images/" + photo.getOriginalFilename());
        }

        prospectRepository.save(prospect);
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
