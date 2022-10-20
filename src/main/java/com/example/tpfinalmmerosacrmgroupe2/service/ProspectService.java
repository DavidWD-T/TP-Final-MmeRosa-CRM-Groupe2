package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.ProspectRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import org.springframework.security.core.Authentication;
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

    public List<Prospect> getAllProspects(String userEmail){
        User user = userRepository.findByEmail(userEmail);
        return  prospectRepository.findAllProspectsByUserById_Id(user.getId());
    }

    public  List<Prospect> getAllProspectsByName(String userEmail, String name){
        User user = userRepository.findByEmail(userEmail);
        return prospectRepository.findProspectsByName(user, name);
    }

    public List<Prospect> getAllClients(String userEmail){
        User user = userRepository.findByEmail(userEmail);
        return  prospectRepository.findAllClientsByUserById_Id(user.getId());
    }

    public  List<Prospect> getAllClientsByName(String userEmail, String name){
        User user = userRepository.findByEmail(userEmail);
        return prospectRepository.findClientsByName(user, name);
    }

    public Prospect getProspectById(String userEmail, long prospectId){
        return getAllProspects(userEmail).stream().filter(p-> p.getId()==prospectId).findFirst().get();
    }

    public boolean deleteProspectById(String userEmail, long prospectId){
        Prospect prospectToDelete = getProspectById(userEmail,prospectId);
        prospectRepository.deleteById(prospectToDelete.getId());
        return true;
    }

    public boolean createProspect(String userMail, CreateProspect createProspect){
       User prospectUser= userRepository.findByEmail(userMail);

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

public boolean editProspect(String userEmail,CreateProspect createProspect){
        Prospect prospectToEdit = getProspectById(userEmail, createProspect.getId());

        prospectToEdit.setEntrepriseById(createProspect.getEntrepriseById());
        prospectToEdit.setEmail(createProspect.getEmail());
        prospectToEdit.setNom(createProspect.getNom());
        prospectToEdit.setPrenom(createProspect.getPrenom());
        prospectToEdit.setDureeRelance(createProspect.getDureeRelance());
        prospectToEdit.setEtatProspection(createProspect.getEtatProspection());

        MultipartFile picture = createProspect.getPhotoFile();
        if (picture == null) {
            prospectToEdit.setPhotoUrl(createProspect.getPhotoUrl());
        } else {
            storageService.store(picture);
            prospectToEdit.setPhotoUrl("http://localhost:8080/images/" + picture.getOriginalFilename());
        }

        prospectRepository.save(prospectToEdit);
        return true;
    }
}
