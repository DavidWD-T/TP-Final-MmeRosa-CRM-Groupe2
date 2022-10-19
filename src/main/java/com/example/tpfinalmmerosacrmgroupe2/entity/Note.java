package com.example.crm.entity;

import javax.persistence.*;
import java.time.LocalDate;
import java.time.LocalTime;

@Entity
public class Note {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private LocalDate date;

    private LocalTime heure;

    private String texte;

    private String prospectEntrepriseNom;

    @ManyToOne
    @JoinColumn(name = "prospect_id", referencedColumnName = "id")
    private Prospect prospectById;


    public Note() {
    }

    public Note(LocalDate date, LocalTime heure, String texte, String prospectEntrepriseNom, Prospect prospectById) {
        this.date = date;
        this.heure = heure;
        this.texte = texte;
        this.prospectEntrepriseNom = prospectEntrepriseNom;
        this.prospectById = prospectById;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public LocalDate getDate() {
        return date;
    }

    public void setDate(LocalDate date) {
        this.date = date;
    }

    public LocalTime getHeure() {
        return heure;
    }

    public void setHeure(LocalTime heure) {
        this.heure = heure;
    }

    public String getTexte() {
        return texte;
    }

    public void setTexte(String texte) {
        this.texte = texte;
    }

    public String getProspectEntrepriseNom() {
        return prospectEntrepriseNom;
    }

    public void setProspectEntrepriseNom(String prospectEntrepriseNom) {
        this.prospectEntrepriseNom = prospectEntrepriseNom;
    }

    public Prospect getProspectById() {
        return prospectById;
    }

    public void setProspectById(Prospect prospectById) {
        this.prospectById = prospectById;
    }

}
