package com.example.tpfinalmmerosacrmgroupe2.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Evenement {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String motif;

    private String description;

    private String adresse;

    private String ville;

    private String codePostale;

    private String voiceCallUrl;

    private LocalDate date;

    private LocalTime heureDebut;

    private LocalTime heureFin;

    @ManyToOne
    @JoinColumn(name = "prospect_id", referencedColumnName = "id")
    private Prospect prospectById;

    @ManyToOne
    @JoinColumn(name = "user_id", referencedColumnName = "id")
    private User userById;

    public Evenement() {
    }

    public Evenement(String motif, String description, String adresse, String ville, String codePostale, String voiceCallUrl, LocalDate date, LocalTime heureDebut, LocalTime heureFin, Prospect prospectById, User userById) {
        this.motif = motif;
        this.description = description;
        this.adresse = adresse;
        this.ville = ville;
        this.codePostale = codePostale;
        this.voiceCallUrl = voiceCallUrl;
        this.date = date;
        this.heureDebut = heureDebut;
        this.heureFin = heureFin;
        this.prospectById = prospectById;
        this.userById = userById;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getMotif() {
        return motif;
    }

    public void setMotif(String motif) {
        this.motif = motif;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getAdresse() {
        return adresse;
    }

    public void setAdresse(String adresse) {
        this.adresse = adresse;
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

    public String getVoiceCallUrl() {
        return voiceCallUrl;
    }

    public void setVoiceCallUrl(String voiceCallUrl) {
        this.voiceCallUrl = voiceCallUrl;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeureDebut() {
        return heureDebut;
    }

    public void setHeureDebut(LocalTime heureDebut) {
        this.heureDebut = heureDebut;
    }

    public LocalTime getHeureFin() {
        return heureFin;
    }

    public void setHeureFin(LocalTime heureFin) {
        this.heureFin = heureFin;
    }

    public Prospect getProspectById() {
        return prospectById;
    }

    public void setProspectById(Prospect prospectById) {
        this.prospectById = prospectById;
    }
}
