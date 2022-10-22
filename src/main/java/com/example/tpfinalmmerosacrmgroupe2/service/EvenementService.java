package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEvenement;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Evenement;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.EvenementRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class EvenementService {

    private EvenementRepository evenementRepository;
    private UserRepository userRepository;

    public EvenementService(EvenementRepository evenementRepository, UserRepository userRepository) {
        this.evenementRepository = evenementRepository;
        this.userRepository = userRepository;
    }

    public List<Evenement> getAllEvenements(String userEmail) {
        User user = userRepository.findByEmail(userEmail);
        return evenementRepository.findAllEvenements(user);
    }

    public List<Evenement> getEvenementsByName(String userEmail, String name) {
        User user = userRepository.findByEmail(userEmail);
        return evenementRepository.findEvenementsByName(user, name);
    }

    public Evenement getEvenementById(String userEmail, long id){
        User user = userRepository.findByEmail(userEmail);
        return evenementRepository.findEvenementById(user, id);
    }
    public Evenement createUpdateEvenement(String mail, CreateEvenement createEvenement) {
        Evenement evenement;
        if (createEvenement.getId() == null){
            evenement = new Evenement();
        }else {
            evenement = getEvenementById(mail, createEvenement.getId());
        }

        evenement.setMotif(createEvenement.getMotif());
        evenement.setDescription(createEvenement.getDescription());
        evenement.setAdresse(createEvenement.getAdresse());
        evenement.setVille(createEvenement.getVille());
        evenement.setCodePostale(createEvenement.getCodePostale());
        evenement.setVoiceCallUrl(createEvenement.getVoiceCallUrl());
        evenement.setDate(createEvenement.getDate());
        evenement.setHeureDebut(createEvenement.getHeureDebut());
        evenement.setHeureFin(createEvenement.getHeureFin());
        evenement.setUserById(userRepository.findByEmail(mail));
        evenement.setProspectById(createEvenement.getProspectById());

        return evenementRepository.save(evenement);
    }

    public void deleteEvenementById(String userEmail, long id) {
        Evenement evenement = getEvenementById(userEmail, id);
        evenementRepository.delete(evenement);
    }
}
