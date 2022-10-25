package com.example.tpfinalmmerosacrmgroupe2.entity;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

@Entity
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false)
    private String password;

    private String nom;
    private String prenom;
    private String photoUrl;
    private Boolean isAdmin;

    @OneToMany(mappedBy = "userById", cascade = CascadeType.REMOVE)
    private List<Prospect> userProspects;

    @OneToMany(mappedBy = "userById", cascade = CascadeType.REMOVE)
    private List<Entreprise> userEntreprises;

    @OneToMany(mappedBy = "userById", cascade = CascadeType.REMOVE)
    private List<Evenement> evenementsUser;

    public User() {
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

    public List<Evenement> getEvenementsUser() {
        return evenementsUser;
    }

    public void setEvenementsUser(List<Evenement> evenementsUser) {
        this.evenementsUser = evenementsUser;
    }

    public CreateUser toCreateUser() {
        CreateUser createUser = new CreateUser();
        createUser.setId(this.id);

        createUser.setEmail(this.email);
        createUser.setNom(this.nom);
        createUser.setPassword(this.password);
        createUser.setPrenom(this.prenom);
        createUser.setPhotoUrl(this.photoUrl);
        return createUser;
    }
}