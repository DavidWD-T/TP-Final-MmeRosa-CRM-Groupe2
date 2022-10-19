package com.example.tpfinalmmerosacrmgroupe2.exception;

public class EntrepriseNotFoundException extends RuntimeException {
    public EntrepriseNotFoundException(long id) {
        super("Aucune entreprise avec cet ID " + id + " n'existe.");
    }
}
