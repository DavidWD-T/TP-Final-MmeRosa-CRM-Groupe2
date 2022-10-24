package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEvenement;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Evenement;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import com.example.tpfinalmmerosacrmgroupe2.service.EvenementService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/evenements")
public class EvenementController {

    private EvenementService evenementService;
    private ProspectService prospectService;

    public EvenementController(EvenementService evenementService, ProspectService prospectService) {
        this.evenementService = evenementService;
        this.prospectService = prospectService;
    }

    @GetMapping("/all")
    public String displayAllClients(Model model, @RequestParam(value = "name", required = false) String name, Principal principal){
       List<Evenement> evenementsList;
        String userEmail = principal.getName() ;
        if (name!= null) {
            evenementsList = evenementService.getEvenementsByName(userEmail,name);
        }else{
           evenementsList = evenementService.getAllEvenements(userEmail);
            name = "";
        }
        model.addAttribute("evenements", evenementsList);
        model.addAttribute("name", name);
        return "evenementsListView";
    }

    @GetMapping("/details/{id}")
    public String displaySpecificEvenement(Model model, @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        Evenement evenement = evenementService.getEvenementById(userEmail, id);
        model.addAttribute("evenement", evenement);
        if (evenement.getProspectById().isClient() == true){
            model.addAttribute("client", "client");
        }else {
            model.addAttribute("client", "prospect");
        }
        return "evenementView";
    }

    @GetMapping("/Create/{id}")
    public String createEvenementForm(Model model, Principal principal, @PathVariable(value = "id") long id){
        String userEmail = principal.getName();
        Prospect prospect = prospectService.getProspectById(userEmail, id);
        CreateEvenement createEvenement = new CreateEvenement();
        createEvenement.setProspectById(prospect);
        model.addAttribute("createEvenement",createEvenement);
        model.addAttribute("type", "Create");
        return "evenementCreateUpdate";
    }

    @PostMapping("/Create")
    public String createEvenement(@Valid CreateEvenement createEvenement, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createEvenement",createEvenement);
            model.addAttribute("type", "Create");
            return "evenementCreateUpdate";
        }else{
           Evenement evenement = evenementService.createUpdateEvenement(userEmail, createEvenement);
            return "redirect:/evenements/details/" + evenement.getId();
        }
    }

    @GetMapping("/Update")
    public String updateEvenementForm(Model model, Principal principal, @RequestParam(value="id") long id){
        String userEmail = principal.getName();
        CreateEvenement createEvenement = evenementService.getEvenementById(userEmail, id).toCreateEvenement();
        model.addAttribute("createEvenement", createEvenement);
        model.addAttribute("type", "Update");
        return "evenementCreateUpdate";
    }

    @PostMapping("/Update")
    public String updateEvenement(@Valid CreateEvenement createEvenement, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            Prospect prospect = createEvenement.getProspectById();
            model.addAttribute("createEvenement",createEvenement);
            model.addAttribute("type", "Update");
            return "evenementCreateUpdate";
        }else{
           Evenement evenement = evenementService.createUpdateEvenement(userEmail, createEvenement);
            return "redirect:/evenements/details/" + evenement.getId();
        }
    }

    @PostMapping ("/delete/{id}")
    public String deleteEvenement(@PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        evenementService.deleteEvenementById(userEmail, id);
        return "redirect:/clients/all";
    }
}
