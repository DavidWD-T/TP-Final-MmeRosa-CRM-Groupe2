package com.example.tpfinalmmerosacrmgroupe2.controller.dto;

import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import java.time.LocalDate;
import java.time.LocalTime;

public class CreateNote {

        private Long id;

        private String texte;

        private Prospect prospectById;

    public CreateNote() {
    }

    public Long getId() {
            return id;
        }

        public void setId(Long id) {
            this.id = id;
        }

        public String getTexte() {
            return texte;
        }

        public void setTexte(String texte) {
            this.texte = texte;
        }

        public Prospect getProspectById() {
            return prospectById;
        }

        public void setProspectById(Prospect prospectById) {
            this.prospectById = prospectById;
        }
}
