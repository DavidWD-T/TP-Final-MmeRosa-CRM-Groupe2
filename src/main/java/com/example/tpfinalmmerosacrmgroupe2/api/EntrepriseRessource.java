package com.example.tpfinalmmerosacrmgroupe2.api;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEntreprise;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;


@RestController
public class EntrepriseRessource {

    private EntrepriseService entrepriseService;

    public EntrepriseRessource(EntrepriseService entrepriseService) {
        this.entrepriseService = entrepriseService;
    }

    @GetMapping("/allEntreprises")
    public List<CreateEntreprise> allEntreprises(Principal principal) {
        return entrepriseService.getAllEntrepriseDTO(principal.getName());
    }


}