package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEntreprise;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.service.EntrepriseService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/entreprises")
public class EntrepriseController {
    private EntrepriseService entrepriseService;

    public EntrepriseController(EntrepriseService entrepriseService) {
        this.entrepriseService = entrepriseService;
    }

    @GetMapping("/all")
    public String displayAllEntreprises(Model model, @RequestParam(value = "name", required = false) String name, Principal principal){
        List<Entreprise> entrepriseList;
        String mail = principal.getName() ;
        if (name!= null) {
            entrepriseList = entrepriseService.getAllEntrepriseByName(name,mail);
        }else{
            entrepriseList = entrepriseService.getAllEntreprise(mail);
            name = "";
        }
        model.addAttribute("entreprises", entrepriseList);
        model.addAttribute("name", name);
        return "entrepriseListView";
    }

    @GetMapping("/details/{id}")
    public String displaySpecificEntreprise(Model model, @PathVariable(value="id") long id){
        Entreprise entreprise = entrepriseService.getEntrepriseById(id);
        model.addAttribute("entreprise", entreprise);
        return "entrepriseView";
    }

    @GetMapping("/Create")
    public String createEntrepriseForm(Model model){
        model.addAttribute("createEntreprise",new CreateEntreprise());
        model.addAttribute("type", "Create");
        return "entrepriseCreateUpdate";
    }

    @GetMapping("/Update/{id}")
    public String updateEntrepriseForm(Model model, @PathVariable(value="id") long id){
        CreateEntreprise createEntreprise = entrepriseService.getEntrepriseById(id).toCreateEntreprise();
        model.addAttribute("createEntreprise", createEntreprise);
        model.addAttribute("type", "Update");
        return "entrepriseCreateUpdate";
    }

    @PostMapping("/Validate")
    public String createEntreprise(@Valid CreateEntreprise createEntreprise, BindingResult result, Model model, Principal principal){
        String mail = principal.getName() ;
        if (result.hasErrors()){
            model.addAttribute("createEntreprise",createEntreprise);
            return "entrepriseCreateUpdate";
        }else{
            Entreprise entreprise = entrepriseService.createUpdateEntreprise(createEntreprise,mail);
            return "redirect:/entreprises/details/" + entreprise.getId() ;
        }
    }


    @PostMapping ("/delete/{id}")
    public String deleteEntrepriseForm(@PathVariable(value="id") long id){
        entrepriseService.deleteEntreprise(id);
        return "redirect:/entreprises/all";
    }
}
