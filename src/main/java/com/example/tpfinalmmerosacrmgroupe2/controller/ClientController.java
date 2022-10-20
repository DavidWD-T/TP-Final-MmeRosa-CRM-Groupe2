package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping
public class ClientController {

    private ProspectService prospectService;

    public ClientController(ProspectService prospectService) {
        this.prospectService = prospectService;
    }

    @GetMapping("/clients")
    public String displayAllClients(Model model, @RequestParam(value = "name", required = false) String name, Principal principal){
        List<Prospect> clientsList;
        String userEmail = principal.getName() ;
        if (name!= null) {
          clientsList = prospectService.getAllClientsByName(userEmail, name);
        }else{
            clientsList = prospectService.getAllClients(userEmail);
            name = "";
        }
        model.addAttribute("clients", clientsList);
        model.addAttribute("name", name);
        return "clientsListView";
    }
}
