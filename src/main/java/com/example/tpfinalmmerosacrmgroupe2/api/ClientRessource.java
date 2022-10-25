package com.example.tpfinalmmerosacrmgroupe2.api;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;


@RestController
public class ClientRessource {

    private ProspectService prospectService;

    public ClientRessource(ProspectService prospectService) {
        this.prospectService = prospectService;
    }

    @GetMapping("/allClients")
    public List<CreateProspect> allClients(Principal principal) {
        return prospectService.getAllClientsDTO(principal.getName());
    }


}