package com.example.tpfinalmmerosacrmgroupe2.api;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;


@RestController
public class ProspectRessource {

    private ProspectService prospectService;

    public ProspectRessource(ProspectService prospectService) {
        this.prospectService = prospectService;
    }

    @GetMapping("/allProspects")
    public List<CreateProspect> allProspects(Principal principal) {
        List<CreateProspect> cp = prospectService.getAllProspectsDTO(principal.getName());
        System.out.println(cp);
        return cp;
    }


}