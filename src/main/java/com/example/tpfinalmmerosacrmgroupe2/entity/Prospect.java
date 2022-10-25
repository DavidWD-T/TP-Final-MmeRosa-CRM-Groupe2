package com.example.tpfinalmmerosacrmgroupe2.entity;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEntreprise;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;

import javax.persistence.*;
import java.time.LocalDate;
import java.util.List;

@Entity
public class Prospect {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String email;

    private String photoUrl;

    private String nom;

    private String prenom;

    private String fonction;

    private String portable;

    private String fixe;

    private String etatProspection;

    private LocalDate dateCreationProspection;
    private LocalDate dateDernierContact;

    private Integer dureeRelance;

    private boolean isClient;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User userById;

    @ManyToOne
    @JoinColumn(name = "entreprise_id", referencedColumnName = "id")
    private Entreprise entrepriseById;

    @OneToMany(mappedBy = "prospectById", cascade = CascadeType.REMOVE)
    private List<Note> prospectNotes;

    @OneToMany(mappedBy = "prospectById", cascade = CascadeType.REMOVE)
    private List<Evenement> prospectEvenements;

    public Prospect() {
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

    public LocalDate getDateDernierContact() {
        return dateDernierContact;
    }

    public void setDateDernierContact(LocalDate dateDernierContact) {
        this.dateDernierContact = dateDernierContact;
    }

    public Integer getDureeRelance() {
        return dureeRelance;
    }

    public boolean isClient() {
        return isClient;
    }

    public void setClient(boolean client) {
        isClient = client;
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


    public CreateProspect toCreateProspect() {
        CreateProspect createProspect = new CreateProspect();
        createProspect.setId(this.id);

        createProspect.setEmail(this.email);
        createProspect.setNom(this.nom);
        createProspect.setPrenom(this.prenom);
        createProspect.setFonction(this.fonction);
        createProspect.setPortable(this.portable);
        createProspect.setFixe(this.fixe);
        createProspect.setDureeRelance(this.dureeRelance);
        createProspect.setEntrepriseById(this.entrepriseById);
        createProspect.setPhotoUrl(this.photoUrl);

        return createProspect;
    }
}