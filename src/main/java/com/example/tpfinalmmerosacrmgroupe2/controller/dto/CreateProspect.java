package com.example.tpfinalmmerosacrmgroupe2.controller.dto;

import com.example.tpfinalmmerosacrmgroupe2.entity.*;
import org.springframework.web.multipart.MultipartFile;
import java.time.LocalDate;
import java.util.List;

public class CreateProspect {

    private Long id;

    private String email;

    private String photoUrl;

    private MultipartFile photoFile;

    private String nom;

    private String prenom;

    private String fonction;

    private String portable;

    private String fixe;

    private Integer dureeRelance;

    private Entreprise entrepriseById;

    public CreateProspect() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhotoUrl() {
        return photoUrl;
    }

    public void setPhotoUrl(String photoUrl) {
        this.photoUrl = photoUrl;
    }

    public MultipartFile getPhotoFile() {
        return photoFile;
    }

    public void setPhotoFile(MultipartFile photoFile) {
        this.photoFile = photoFile;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getPrenom() {
        return prenom;
    }

    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    public String getFonction() {
        return fonction;
    }

    public void setFonction(String fonction) {
        this.fonction = fonction;
    }

    public String getPortable() {
        return portable;
    }

    public void setPortable(String portable) {
        this.portable = portable;
    }

    public String getFixe() {
        return fixe;
    }

    public void setFixe(String fixe) {
        this.fixe = fixe;
    }


    public Integer getDureeRelance() {
        return dureeRelance;
    }

    public void setDureeRelance(Integer dureeRelance) {
        this.dureeRelance = dureeRelance;
    }


    public Entreprise getEntrepriseById() {
        return entrepriseById;
    }

    public void setEntrepriseById(Entreprise entrepriseById) {
        this.entrepriseById = entrepriseById;
    }

}
