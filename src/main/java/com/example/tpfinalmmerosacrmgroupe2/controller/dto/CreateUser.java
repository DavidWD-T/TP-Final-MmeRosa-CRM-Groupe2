package com.example.crm.controller.dto;

import com.example.crm.entity.Entreprise;
import com.example.crm.entity.Prospect;
import org.springframework.web.multipart.MultipartFile;
import java.time.LocalDateTime;
import java.util.List;

public class CreateUser {


    private Long id;

    private String email;

    private String password;

    private String photoUrl;

    private MultipartFile photoFile;

    private String nom;

    private String prenom;

    private Boolean isAdmin;

    private LocalDateTime dateCreation;

    private List<Prospect> userProspects;

    private List<Entreprise> userEntreprises;

    public CreateUser() {
    }

    public CreateUser(String email, String password, String photoUrl, MultipartFile photoFile, String nom, String prenom, Boolean isAdmin, LocalDateTime dateCreation, List<Prospect> userProspects, List<Entreprise> userEntreprises) {
        this.email = email;
        this.password = password;
        this.photoUrl = photoUrl;
        this.photoFile = photoFile;
        this.nom = nom;
        this.prenom = prenom;
        this.isAdmin = isAdmin;
        this.dateCreation = dateCreation;
        this.userProspects = userProspects;
        this.userEntreprises = userEntreprises;
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public Boolean getAdmin() {
        return isAdmin;
    }

    public void setAdmin(Boolean admin) {
        isAdmin = admin;
    }

    public LocalDateTime getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDateTime dateCreation) {
        this.dateCreation = dateCreation;
    }

    public List<Prospect> getUserProspects() {
        return userProspects;
    }

    public void setUserProspects(List<Prospect> userProspects) {
        this.userProspects = userProspects;
    }

    public List<Entreprise> getUserEntreprises() {
        return userEntreprises;
    }

    public void setUserEntreprises(List<Entreprise> userEntreprises) {
        this.userEntreprises = userEntreprises;
    }
}
