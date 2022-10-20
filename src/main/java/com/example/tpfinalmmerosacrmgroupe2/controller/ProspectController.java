package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateProspect;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;
import java.util.stream.Collectors;

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
    public String displayAllProspects(Model model, @RequestParam(value = "name", required = false) String name, Principal principal){
        List<Prospect> prospectsList;
        String userEmail = principal.getName() ;
        if (name!= null) {
            prospectsList = prospectService.getAllProspectsByName(userEmail, name);
        }else{
            prospectsList = prospectService.getAllProspects(userEmail);
            name = "";
        }
        model.addAttribute("prospects", prospectsList);
        model.addAttribute("name", name);
        return "prospectsListView";
    }

//    @PostMapping("/all")
//    public String postAllEntreprises(Model model, @RequestParam(value = "name", required = false) String name){
//        List<Entreprise> entrepriseList = (List<Entreprise>) model.getAttribute("entreprises");
//        model.addAttribute("entreprises", entrepriseList);
//        model.addAttribute("name", name);
//        return "entrepriseListView";
//    }

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
        model.addAttribute("createProspect",new Prospect());
        model.addAttribute("type", "Create");
        return "prospectClientCreateUpdate";
    }

    @PostMapping("/create")
    public String createProspect(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal, @RequestParam(value = "entrepriseId") long entrepriseId){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "prospectCreateUpdate";
        }else{
            Entreprise entreprise = entrepriseService.getEntrepriseById(entrepriseId);
            createProspect.setEntrepriseById(entreprise);
            prospectService.createProspect(userEmail, createProspect);
            return "redirect:/prospects/details/" + prospectService.getProspectById(userEmail, createProspect.getId()).getId() ;
        }
    }

    @GetMapping("/Update/{id}")
    public String updateProspectForm(Model model,  @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        Prospect prospect = prospectService.getProspectById(userEmail, id);
        List<Entreprise> entrepriseList = entrepriseService.getAllEntreprise(userEmail);
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("createProspect", prospect);
        model.addAttribute("type", "Update");
        if(prospect.isClient()==false){
            model.addAttribute("genre","prospect");
        }else {
            model.addAttribute("genre", "client");
        }
        return "prospectClientCreateUpdate";
    }

    @PostMapping("/update")
    public String updateProspect(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal, @RequestParam(value = "entrepriseId") long entrepriseId){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "prospectClientCreateUpdate";
        }else{
            Entreprise entreprise = entrepriseService.getEntrepriseById(entrepriseId);
            createProspect.setEntrepriseById(entreprise);
            prospectService.editProspect(userEmail, createProspect);
            return "redirect:/prospects/details/" + prospectService.getProspectById(userEmail, createProspect.getId()).getId() ;
        }
    }


    @PostMapping ("/delete/{id}")
    public String deleteProspectForm(@PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        prospectService.deleteProspectById(userEmail, id);
        return "redirect:/prospects/all";
    }
}
