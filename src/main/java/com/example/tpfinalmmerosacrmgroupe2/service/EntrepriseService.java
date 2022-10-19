package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEntreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.EntrepriseRepository;
import com.example.tpfinalmmerosacrmgroupe2.exception.EntrepriseNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

@Service
public class EntrepriseService {

    private EntrepriseRepository entrepriseRepository;
    private UserService userService ;
    private StorageService storageService;

    public EntrepriseService(EntrepriseRepository entrepriseRepository, UserService userService, StorageService storageService) {
        this.entrepriseRepository = entrepriseRepository;
        this.userService = userService;
        this.storageService = storageService;
    }

    public List<Entreprise> getAllEntreprise(String mail) {
        User user = userService.getUserByMail(mail);
        return (List<Entreprise>) entrepriseRepository.findEntrepriseByUserById(user);
    }

    public List<Entreprise> getAllEntrepriseByName(String name,String mail) {
        User user = userService.getUserByMail(mail);
        return entrepriseRepository.findEntrepriseByAll(user, name);
    }


    public Entreprise getEntrepriseById(long id) {
        return entrepriseRepository.findById(id).orElseThrow(() -> new EntrepriseNotFoundException(id));
    }

    public Entreprise createUpdateEntreprise(CreateEntreprise createEntreprise, String mail) {
        Entreprise entreprise;
        if (createEntreprise.getId() == null){
            entreprise = new Entreprise();
        }else {
            entreprise = entrepriseRepository.findById(createEntreprise.getId()).get();
        }

        MultipartFile picture = createEntreprise.getLogoFile();
        if (picture.getOriginalFilename().equals("")){
            entreprise.setLogo(createEntreprise.getLogo());
        }else {
            storageService.store(picture);
            entreprise.setLogo("http://localhost:8080/images/" + picture.getOriginalFilename());
        }

        entreprise.setNom(createEntreprise.getNom());
        entreprise.setSecteurActivite(createEntreprise.getSecteurActivite());
        entreprise.setSiret(createEntreprise.getSiret());
        entreprise.setAdresse(createEntreprise.getAdresse());;
        entreprise.setComplementAdresse(createEntreprise.getComplementAdresse());
        entreprise.setVille(createEntreprise.getVille());
        entreprise.setCodePostale(createEntreprise.getCodePostale());
        entreprise.setEmail(createEntreprise.getEmail());
        entreprise.setSiteWeb(createEntreprise.getSiteWeb());
        entreprise.setTelephone(createEntreprise.getTelephone());
        entreprise.setDateCreation(createEntreprise.getDateCreation());
        entreprise.setUserById(userService.getUserByMail(mail));

        return entrepriseRepository.save(entreprise);
    }

    public void deleteEntreprise(long id) {
        entrepriseRepository.deleteById(id);
    }
}
