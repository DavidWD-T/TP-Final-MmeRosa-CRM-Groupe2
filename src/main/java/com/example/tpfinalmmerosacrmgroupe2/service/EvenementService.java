package com.example.crm.service;

import com.example.crm.entity.repository.EvenementRepository;
import org.springframework.stereotype.Service;

@Service
public class EvenementService {

    private EvenementRepository evenementRepository;

    public EvenementService(EvenementRepository evenementRepository) {
        this.evenementRepository = evenementRepository;
    }
}
