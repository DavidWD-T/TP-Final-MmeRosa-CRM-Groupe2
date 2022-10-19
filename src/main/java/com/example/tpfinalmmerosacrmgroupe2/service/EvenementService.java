package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.entity.repository.EvenementRepository;
import org.springframework.stereotype.Service;

@Service
public class EvenementService {

    private EvenementRepository evenementRepository;

    public EvenementService(EvenementRepository evenementRepository) {
        this.evenementRepository = evenementRepository;
    }
}
