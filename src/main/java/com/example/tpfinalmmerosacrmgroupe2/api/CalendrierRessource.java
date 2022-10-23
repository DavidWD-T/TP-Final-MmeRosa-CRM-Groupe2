package com.example.tpfinalmmerosacrmgroupe2.api;

import com.example.tpfinalmmerosacrmgroupe2.service.EvenementService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.security.Principal;
import java.util.List;


@RestController
public class CalendrierRessource {
    private EvenementService evenementService;

    public CalendrierRessource(EvenementService evenementService) {
        this.evenementService = evenementService;
    }


    @GetMapping("/allevents")
    public List<EventDTO> allEvents(Principal principal) {
        return evenementService.getAllEventsDTO(principal.getName());
    }


}
