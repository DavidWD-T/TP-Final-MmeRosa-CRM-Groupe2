package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.ProspectRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import com.example.tpfinalmmerosacrmgroupe2.exception.EntrepriseNotFoundException;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import java.time.LocalDate;
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

    public  List<Prospect> getAllProspectsByName(String userEmail, String name, String etat, String order){
        Sort sort = null;
        User user = userRepository.findByEmail(userEmail);
        if(order.equals("")){
            sort = Sort.by(Sort.Direction.ASC, "prenom").by(Sort.Direction.ASC, "nom");
        }else if(order.equals("2")){
            sort = Sort.by(Sort.Direction.DESC, "prenom").by(Sort.Direction.DESC, "nom");
        }else if(order.equals("3")){
            sort = Sort.by(Sort.Direction.ASC, "dateCreationProspection").by(Sort.Direction.ASC, "dateCreationProspection");
        }else if(order.equals("4")){
            sort = Sort.by(Sort.Direction.DESC, "dateCreationProspection").by(Sort.Direction.DESC, "dateCreationProspection");
        }
        return prospectRepository.findProspectsByName(user, name, etat, sort);
    }

    public List<Prospect> getAllClients(String userEmail){
        User user = userRepository.findByEmail(userEmail);
        return  prospectRepository.findAllClientsByUserById(user);
    }

    public  List<Prospect> getAllClientsByName(String userEmail, String name, String order){
        Sort sort = null;
        User user = userRepository.findByEmail(userEmail);
        if(order.equals("")){
            sort = Sort.by(Sort.Direction.ASC, "prenom").by(Sort.Direction.ASC, "nom");
        }else if(order.equals("2")){
            sort = Sort.by(Sort.Direction.DESC, "prenom").by(Sort.Direction.DESC, "nom");
        }else if(order.equals("3")){
            sort = Sort.by(Sort.Direction.ASC, "nom").by(Sort.Direction.ASC, "dateCreationProspection");
        }else if(order.equals("4")){
            sort = Sort.by(Sort.Direction.DESC, "nom").by(Sort.Direction.DESC, "dateCreationProspection");
        }
        return prospectRepository.findClientsByName(user, name, sort);
    }

    public Prospect getProspectById(String userEmail, long id){
        return prospectRepository.findById(id).orElseThrow(() -> new EntrepriseNotFoundException(id));

    }

    public boolean deleteProspectById(String userEmail, long prospectId){
        Prospect prospectToDelete = getProspectById(userEmail,prospectId);
        prospectRepository.delete(prospectToDelete);
        return true;
    }

    public void UpdateProspectARelance(String userEmail){
        User user = userRepository.findByEmail(userEmail);
        List<Prospect> prospectList =  prospectRepository.findProspectsByDate(user, LocalDate.now());
        prospectList.forEach(e -> {
            e.setEtatProspection("À relancer");
            prospectRepository.save(e);
        });
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
            }
        }else {
            prospect = getProspectById(mail, createProspect.getId());
            if(prospect.isClient() == true){
                if (!prospect.getEntrepriseById().getNom().equals(createProspect.getEntrepriseById().getNom())){
                    prospect.setClient(false);
                    prospect.setEtatProspection("Aucune prospection");
                }

            }
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
