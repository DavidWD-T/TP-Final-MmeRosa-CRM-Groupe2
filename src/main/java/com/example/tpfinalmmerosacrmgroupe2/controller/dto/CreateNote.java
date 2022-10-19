package com.example.crm.controller.dto;

import com.example.crm.entity.Prospect;
import java.time.LocalDate;
import java.time.LocalTime;

public class CreateNote {

        private Long id;

        private LocalDate date;

        private LocalTime heure;

        private String texte;

        private String prospectEntrepriseNom;

        private Prospect prospectById;

    public CreateNote() {
    }

    public CreateNote(LocalDate date, LocalTime heure, String texte, String prospectEntrepriseNom, Prospect prospectById) {
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
