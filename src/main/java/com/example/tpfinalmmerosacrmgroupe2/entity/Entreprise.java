package com.example.tpfinalmmerosacrmgroupe2.entity;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEntreprise;

import javax.persistence.*;
import java.time.LocalDate;
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
    private String email;
    private String siteWeb;
    private String telephone;
    private LocalDate dateCreation;
    private String logo;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User userById;

    @OneToMany(mappedBy = "entrepriseById")
    private List<Prospect> prospectsEntreprise;


    public Entreprise() {
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

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getSiteWeb() {
        return siteWeb;
    }

    public void setSiteWeb(String siteWeb) {
        this.siteWeb = siteWeb;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public LocalDate getDateCreation() {
        return dateCreation;
    }

    public void setDateCreation(LocalDate dateCreation) {
        this.dateCreation = dateCreation;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
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

    public CreateEntreprise toCreateEntreprise() {
        CreateEntreprise createEntreprise = new CreateEntreprise();
        createEntreprise.setId(this.id);

        createEntreprise.setEmail(this.email);
        createEntreprise.setNom(this.nom);
        createEntreprise.setSecteurActivite(this.secteurActivite);
        createEntreprise.setSiret(this.siret);
        createEntreprise.setAdresse(this.adresse);
        createEntreprise.setComplementAdresse(this.complementAdresse);
        createEntreprise.setVille(this.ville);
        createEntreprise.setCodePostale(this.codePostale);
        createEntreprise.setEmail(this.email);
        createEntreprise.setSiteWeb(this.siteWeb);
        createEntreprise.setTelephone(this.telephone);
        createEntreprise.setLogo(this.logo);

        return createEntreprise;
    }

}