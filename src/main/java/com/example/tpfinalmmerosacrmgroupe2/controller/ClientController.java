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
@RequestMapping("/clients")
public class ClientController {

    private ProspectService prospectService;
    private EntrepriseService entrepriseService;

    public ClientController(ProspectService prospectService,EntrepriseService entrepriseService) {
        this.prospectService = prospectService;
        this.entrepriseService = entrepriseService;
    }

    @GetMapping("/all")
    public String displayAllClients(Model model, @RequestParam(value = "etat", required = false) String etat, @RequestParam(value = "name", required = false) String name, @RequestParam(value = "order", required = false) String order, Principal principal){

        List<Prospect> clientsList;
        String userEmail = principal.getName() ;

        if (order == null){order="";}

        if (name!= null) {
          clientsList = prospectService.getAllClientsByName(userEmail, name, etat, order);
        }else{
            clientsList = prospectService.getAllClients(userEmail);
            name = "";
        }
        model.addAttribute("clients", clientsList);
        model.addAttribute("name", name);
        model.addAttribute("etat", etat);
        return "clientsListView";
    }

    @GetMapping("/details/{id}")
    public String displaySpecificClient(Model model, @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        Prospect prospect = prospectService.getProspectById(userEmail, id);
        model.addAttribute("prospect", prospect);
        return "clientView";
    }

    @GetMapping("/Create")
    public String createClientForm(Model model, Principal principal){
        String userEmail = principal.getName();
        List<Entreprise> entrepriseList = entrepriseService.getAllEntreprise(userEmail);
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("createProspect",new CreateProspect());
        model.addAttribute("type", "Create");
        return "clientCreateUpdate";
    }

    @PostMapping("/Create")
    public String createClient(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "prospectCreateUpdate";
        }else{
//            Entreprise entreprise = entrepriseService.getEntrepriseById(entrepriseId);
//            createProspect.setEntrepriseById(entreprise);
            Prospect prospect = prospectService.createUpdateProspect(userEmail, createProspect,"Client");
            return "redirect:/clients/details/" + prospect.getId();
        }
    }

    @GetMapping("/Update/{id}")
    public String updateClientForm(Model model,  @PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        CreateProspect createProspect = prospectService.getProspectById(userEmail,id).toCreateProspect();
        List<Entreprise> entrepriseList = entrepriseService.getAllEntreprise(userEmail);
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("createProspect", createProspect);
        model.addAttribute("type", "Update");
        return "clientCreateUpdate";
    }

    @PostMapping("/Update")
    public String updateClient(@Valid CreateProspect createProspect, BindingResult result, Model model, Principal principal){
        String userEmail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createProspect",createProspect);
            return "clientCreateUpdate";
        }else{
            Prospect prospect = prospectService.createUpdateProspect(userEmail, createProspect,"Client");
            return "redirect:/clients/all" ;
        }
    }

    @PostMapping ("/delete/{id}")
    public String deleteClientForm(@PathVariable(value="id") long id, Principal principal){
        String userEmail = principal.getName();
        prospectService.deleteProspectById(userEmail, id);
        return "redirect:/clients/all";
    }
}
