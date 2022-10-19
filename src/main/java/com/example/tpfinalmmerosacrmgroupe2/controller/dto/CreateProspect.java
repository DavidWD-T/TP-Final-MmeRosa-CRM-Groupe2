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

    private String etatProspection;

    private LocalDate dateCreationProspection;

    private Integer dureeRelance;

    private User userById;

    private Entreprise entrepriseById;

    private List<Note> prospectNotes;

    private List<Evenement> prospectEvenements;

    public CreateProspect() {
    }

    public CreateProspect(String email, String photoUrl, MultipartFile photoFile, String nom, String prenom, String fonction, String portable, String fixe, String etatProspection, LocalDate dateCreationProspection, Integer dureeRelance, User userById, Entreprise entrepriseById, List<Note> prospectNotes, List<Evenement> prospectEvenements) {
        this.email = email;
        this.photoUrl = photoUrl;
        this.photoFile = photoFile;
        this.nom = nom;
        this.prenom = prenom;
        this.fonction = fonction;
        this.portable = portable;
        this.fixe = fixe;
        this.etatProspection = etatProspection;
        this.dateCreationProspection = dateCreationProspection;
        this.dureeRelance = dureeRelance;
        this.userById = userById;
        this.entrepriseById = entrepriseById;
        this.prospectNotes = prospectNotes;
        this.prospectEvenements = prospectEvenements;
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

    public String getEtatProspection() {
        return etatProspection;
    }

    public void setEtatProspection(String etatProspection) {
        this.etatProspection = etatProspection;
    }

    public LocalDate getDateCreationProspection() {
        return dateCreationProspection;
    }

    public void setDateCreationProspection(LocalDate dateCreationProspection) {
        this.dateCreationProspection = dateCreationProspection;
    }

    public Integer getDureeRelance() {
        return dureeRelance;
    }

    public void setDureeRelance(Integer dureeRelance) {
        this.dureeRelance = dureeRelance;
    }

    public User getUserById() {
        return userById;
    }

    public void setUserById(User userById) {
        this.userById = userById;
    }

    public Entreprise getEntrepriseById() {
        return entrepriseById;
    }

    public void setEntrepriseById(Entreprise entrepriseById) {
        this.entrepriseById = entrepriseById;
    }

    public List<Note> getProspectNotes() {
        return prospectNotes;
    }

    public void setProspectNotes(List<Note> prospectNotes) {
        this.prospectNotes = prospectNotes;
    }

    public List<Evenement> getProspectEvenements() {
        return prospectEvenements;
    }

    public void setProspectEvenements(List<Evenement> prospectEvenements) {
        this.prospectEvenements = prospectEvenements;
    }
}
