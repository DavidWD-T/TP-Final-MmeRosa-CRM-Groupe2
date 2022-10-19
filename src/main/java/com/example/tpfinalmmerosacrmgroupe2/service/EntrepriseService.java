package com.example.crm.service;

import com.example.crm.entity.repository.EntrepriseRepository;
import org.springframework.stereotype.Service;

@Service
public class EntrepriseService {

   private EntrepriseRepository entrepriseRepository;

    public EntrepriseService(EntrepriseRepository entrepriseRepository) {
        this.entrepriseRepository = entrepriseRepository;
    }
}
