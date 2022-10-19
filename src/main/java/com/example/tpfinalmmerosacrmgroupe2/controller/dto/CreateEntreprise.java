package com.example.crm.controller.dto;

import com.example.crm.entity.Prospect;
import com.example.crm.entity.User;
import org.springframework.web.multipart.MultipartFile;
import java.util.List;

public class CreateEntreprise {

    private Long id;

    private String nom;

    private String logoUrl;

    private MultipartFile logoFile;

    private String secteurActivite;

    private String siret;

    private String adresse;

    private String complementAdresse;

    private String ville;

    private String codePostale;

    private User userById;

    private List<Prospect> prospectsEntreprise;


    public CreateEntreprise() {
    }

    public CreateEntreprise(String nom, String logoUrl, MultipartFile logoFile, String secteurActivite, String siret, String adresse, String complementAdresse, String ville, String codePostale, User userById, List<Prospect> prospectsEntreprise) {
        this.nom = nom;
        this.logoUrl = logoUrl;
        this.logoFile = logoFile;
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

    public String getLogoUrl() {
        return logoUrl;
    }

    public void setLogoUrl(String logoUrl) {
        this.logoUrl = logoUrl;
    }

    public MultipartFile getLogoFile() {
        return logoFile;
    }

    public void setLogoFile(MultipartFile logoFile) {
        this.logoFile = logoFile;
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
