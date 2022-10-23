package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/prospects")
public class ProspectController {

    private ProspectService prospectService;
    private EntrepriseService entrepriseService;

    public ProspectController(ProspectService prospectService, EntrepriseService entrepriseService) {
        this.prospectService = prospectService;
        this.entrepriseService = entrepriseService;
    }

    @GetMapping("/all")
    public String displayAllProspects(Model model, @RequestParam(value = "etat", required = false) String etat, @RequestParam(value = "name", required = false) String name,@RequestParam(value = "order", required = false) String order, Principal principal){
        List<Prospect> prospectsList;
        String userEmail = principal.getName() ;
        prospectService.UpdateProspectARelance(userEmail);
        if (name!= null) {
            prospectsList = prospectService.getAllProspectsByName(userEmail, name, etat, order);
        }else{
            prospectsList = prospectService.getAllProspects(userEmail);
            name = "";
        }
        model.addAttribute("prospects", prospectsList);
        model.addAttribute("name", name);
        model.addAttribute("etat", etat);
        return "prospectsListView";
    }

    @GetMapping("/details/{id}")
    public String displaySpecificProspect(Model model, @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        Prospect prospect = prospectService.getProspectById(userEmail, id);
        model.addAttribute("prospect", prospect);
        return "prospectView";
    }

    @GetMapping("/Create")
    public String createProspectForm(Model model, Principal principal){
        String userEmail = principal.getName();
        List<Entreprise> entrepriseList = entrepriseService.getAllEntreprise(userEmail);
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("createProspect",new CreateProspect());
        model.addAttribute("type", "Create");
        return "prospectCreateUpdate";
    }

    @PostMapping("/Create")
    public String createProspect(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "prospectCreateUpdate";
        }else{
//            Entreprise entreprise = entrepriseService.getEntrepriseById(entrepriseId);
//            createProspect.setEntrepriseById(entreprise);
           Prospect prospect = prospectService.createUpdateProspect(userEmail, createProspect,"Prospect");
            return "redirect:/prospects/details/" + prospect.getId();
        }
    }

    @GetMapping("/Update/{id}")
    public String updateProspectForm(Model model,  @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        CreateProspect createProspect = prospectService.getProspectById(userEmail, id).toCreateProspect();
        List<Entreprise> entrepriseList = entrepriseService.getAllEntreprise(userEmail);
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("createProspect", createProspect);
        model.addAttribute("type", "Update");
        return "prospectCreateUpdate";
    }

    @PostMapping("/Update")
    public String updateProspect(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "prospectCreateUpdate";
        }else{
//            Entreprise entreprise = entrepriseService.getEntrepriseById(entrepriseId);
//            createProspect.setEntrepriseById(entreprise);
           Prospect prospect = prospectService.createUpdateProspect(userEmail, createProspect,"Prospect");
            return "redirect:/prospects/details/" + prospect.getId() ;
        }
    }


    @PostMapping ("/delete/{id}")
    public String deleteProspectForm(@PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        prospectService.deleteProspectById(userEmail, id);
        return "redirect:/prospects/all";
    }
}
