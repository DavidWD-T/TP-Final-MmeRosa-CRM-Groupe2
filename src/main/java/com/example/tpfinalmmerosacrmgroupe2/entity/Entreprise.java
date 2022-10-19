package com.example.tpfinalmmerosacrmgroupe2.entity;

import javax.persistence.*;
import java.util.List;

@Entity
public class Entreprise {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String nom;

    private String secteurActivite;

    private String siret;

    private String adresse;

    private String complementAdresse;

    private String ville;

    private String codePostale;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User userById;

    @OneToMany(mappedBy = "entrepriseById")
    private List<Prospect> prospectsEntreprise;


    public Entreprise() {
    }

    public Entreprise(String nom, String secteurActivite, String siret, String adresse, String complementAdresse, String ville, String codePostale, User userById, List<Prospect> prospectsEntreprise) {
        this.nom = nom;
        this.secteurActivite = secteurActivite;
        this.siret = siret;
        this.adresse = adresse;
        this.complementAdresse = complementAdresse;
        this.ville = ville;
        this.codePostale = codePostale;
        this.userById = userById;
        this.prospectsEntreprise = prospectsEntreprise;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNom() {
        return nom;
    }

    public void setNom(String nom) {
        this.nom = nom;
    }

    public String getSecteurActivite() {
        return secteurActivite;
    }

    public void setSecteurActivite(String secteurActivite) {
        this.secteurActivite = secteurActivite;
    }

    public String getSiret() {
        return siret;
    }

    public void setSiret(String siret) {
        this.siret = siret;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    public String getComplementAdresse() {
        return complementAdresse;
    }

    public void setComplementAdresse(String complementAdresse) {
        this.complementAdresse = complementAdresse;
    }

    public String getVille() {
        return ville;
    }

    public void setVille(String ville) {
        this.ville = ville;
    }

    public String getCodePostale() {
        return codePostale;
    }

    public void setCodePostale(String codePostale) {
        this.codePostale = codePostale;
    }

    public User getUserById() {
        return userById;
    }

    public void setUserById(User userById) {
        this.userById = userById;
    }

    public List<Prospect> getProspectsEntreprise() {
        return prospectsEntreprise;
    }

    public void setProspectsEntreprise(List<Prospect> prospectsEntreprise) {
        this.prospectsEntreprise = prospectsEntreprise;
    }

}