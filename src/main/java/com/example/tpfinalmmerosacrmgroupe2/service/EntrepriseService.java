package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.entity.repository.EntrepriseRepository;
import org.springframework.stereotype.Service;

@Service
public class EntrepriseService {

   private EntrepriseRepository entrepriseRepository;

    public EntrepriseService(EntrepriseRepository entrepriseRepository) {
        this.entrepriseRepository = entrepriseRepository;
    }
}
