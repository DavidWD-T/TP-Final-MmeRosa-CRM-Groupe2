package com.example.tpfinalmmerosacrmgroupe2.controller;


import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.time.LocalDate;
import java.util.List;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/")
public class DashboardController {

    private ProspectService prospectService;
    private EntrepriseService entrepriseService;

    public DashboardController(ProspectService prospectService, EntrepriseService entrepriseService) {
        this.prospectService = prospectService;
        this.entrepriseService = entrepriseService;
    }

    @GetMapping("home")
    public String displayDashBoard(Principal principal, Model model){
        String userEmail = principal.getName() ;
        prospectService.UpdateProspectARelance(userEmail);
        List<Prospect> clientList =  prospectService.getAllClients(userEmail);
        List<Prospect> prospectList =  prospectService.getAllProspects(userEmail);
        List<Entreprise> entrepriseList =  entrepriseService.getAllEntreprise(userEmail);
        LocalDate d = LocalDate.now();
        String mois3 = "['" + d.getMonth() + "'," + entrepriseList.stream().filter(i-> i.getDateCreation().getMonth().equals(d.getMonth())).count() + "," + prospectList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.getMonth())).count() + "," + clientList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.getMonth())).count() + "]";
        String mois2 = "['" + d.plusMonths(-1).getMonth() + "'," + entrepriseList.stream().filter(i-> i.getDateCreation().getMonth().equals(d.plusMonths(-1).getMonth())).count() + "," + prospectList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.plusMonths(-1).getMonth())).count() + "," + clientList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.plusMonths(-1).getMonth())).count() + "]";
        String mois1 = "['" + d.plusMonths(-2).getMonth() + "'," + entrepriseList.stream().filter(i-> i.getDateCreation().getMonth().equals(d.plusMonths(-2).getMonth())).count() + "," + prospectList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.plusMonths(-2).getMonth())).count() + "," + clientList.stream().filter(i-> i.getDateCreationProspection().getMonth().equals(d.plusMonths(-2).getMonth())).count() + "]";
        System.out.println(mois1);
        System.out.println(mois2);
        System.out.println(mois3);
        model.addAttribute("customersByUser", clientList.size());
        model.addAttribute("propectsByUser", prospectList.size());
        model.addAttribute("propectsByUser1", prospectService.getAllProspectsByName(userEmail,"","Aucune prospection","").size());
        model.addAttribute("propectsByUser2", prospectService.getAllProspectsByName(userEmail,"","En cours de prospection","").size());
        model.addAttribute("propectsByUser3", prospectService.getAllProspectsByName(userEmail,"","À relancer","").size());
        model.addAttribute("customersByUser1", prospectService.getAllClientsByName(userEmail,"","À contacter","").size());

        model.addAttribute("mois1", mois1);
        model.addAttribute("mois2", mois2);
        model.addAttribute("mois3", mois3);

        return "dashboardView";
    }
}
