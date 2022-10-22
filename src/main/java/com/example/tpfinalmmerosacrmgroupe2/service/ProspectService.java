package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.ProspectRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import com.example.tpfinalmmerosacrmgroupe2.exception.EntrepriseNotFoundException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.time.LocalDate;
import java.util.Date;
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
        return  prospectRepository.findAllProspectsByUserById(user);
    }

    public  List<Prospect> getAllProspectsByName(String userEmail, String name){
        User user = userRepository.findByEmail(userEmail);
        return prospectRepository.findProspectsByName(user, name);
    }

    public List<Prospect> getAllClients(String userEmail){
        User user = userRepository.findByEmail(userEmail);
        return  prospectRepository.findAllClientsByUserById(user);
    }

    public  List<Prospect> getAllClientsByName(String userEmail, String name){
        User user = userRepository.findByEmail(userEmail);
        return prospectRepository.findClientsByName(user, name);
    }

    public Prospect getProspectById(String userEmail, long id){
        return prospectRepository.findById(id).orElseThrow(() -> new EntrepriseNotFoundException(id));
    }

    public boolean deleteProspectById(String userEmail, long prospectId){
        Prospect prospectToDelete = getProspectById(userEmail,prospectId);
        prospectRepository.deleteById(prospectToDelete.getId());
        return true;
    }

    public Prospect createUpdateProspect(String mail, CreateProspect createProspect,String type){
        LocalDate localdateJ = LocalDate.now();
        Prospect prospect;
        if (createProspect.getId() == null){
            prospect = new Prospect();
            prospect.setDateCreationProspection(localdateJ);
            if (type.equals("Client")){
                prospect.setEtatProspection("Aucun");
                prospect.setClient(true);
            }else{
                prospect.setEtatProspection("Aucune prospection");
            }
        }else {
            prospect = getProspectById(mail, createProspect.getId());
        }

        MultipartFile photo = createProspect.getPhotoFile();
        if (photo.getOriginalFilename().equals("")) {
            prospect.setPhotoUrl(createProspect.getPhotoUrl());
        } else {
            storageService.store(photo);
            prospect.setPhotoUrl("http://localhost:8080/images/" + photo.getOriginalFilename());
        }


        prospect.setEntrepriseById(createProspect.getEntrepriseById());
        prospect.setEmail(createProspect.getEmail());
        prospect.setNom(createProspect.getNom());
        prospect.setPrenom(createProspect.getPrenom());
        prospect.setDureeRelance(createProspect.getDureeRelance());
        prospect.setUserById(userRepository.findByEmail(mail));

        prospect.setPortable(createProspect.getPortable());
        prospect.setFixe(createProspect.getFixe());



       return prospectRepository.save(prospect);
    }

}
