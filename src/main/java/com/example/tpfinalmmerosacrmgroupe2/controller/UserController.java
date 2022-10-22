package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.security.CustomLogoutHandler;
import com.example.tpfinalmmerosacrmgroupe2.service.UserService;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.validation.Valid;
import java.security.Principal;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/listUsers")
    public String displaylistUsers(Model model, Principal principal, @RequestParam(value = "name", required = false) String name) {
        if(userService.isUserAdmin(principal.getName())){
            if (name == null) {
                model.addAttribute("listUsers", userService.getAllUser(principal.getName()));
                name = "";
            }else{
                model.addAttribute("listUsers", userService.getAllUserByAll(principal.getName(), name));
            }
            model.addAttribute("name", name);
            return "userListView";
        }else{
            return "redirect:/signup/" + principal.getName();
        }
    }

    @PostMapping ("users/delete/{id}")
    public String deleteUserByIDForm(@PathVariable(value="id") long id, Principal principal){
        if(userService.isUserAdmin(principal.getName())){
            userService.deleteUser(id);
            return "redirect:/listUsers";
        }else{
            return "redirect:/signup/" + principal.getName();
        }
    }

    @PostMapping ("users/delete")
    public String deleteUserForm(Principal principal){
        userService.deleteUserByMail(principal.getName());
        SecurityContextHolder.clearContext();
        return "redirect:/signin";
    }

    @GetMapping("/signup")
    public String displaySignUpForm(Model model) {
        model.addAttribute("createUser",new CreateUser());
        return "signUpFormView";
    }

    @GetMapping("/signup/{mail}")
    public String updateEntrepriseForm(Model model, @PathVariable(value="mail") String mail){
        CreateUser createUser = userService.getUserByMail(mail).toCreateUser();
        if (userService.getUserByMail(mail).getAdmin() == null){model.addAttribute("deleteActif", "Oui");}
        model.addAttribute("createUser", createUser);
        return "signUpFormView";
    }

    @PostMapping("/signup")
    public String displaySignUp(@Valid CreateUser createUser, BindingResult result, Model model) {
        if (result.hasErrors()){
            model.addAttribute("createUser",createUser);
            return "signUpFormView";
        }else{
            userService.createUpdateUser(createUser);
            return "redirect:/entreprises/all";
        }
    }

    @GetMapping("/signin")
    public String displaySignInForm(Model model) {
        return "signInForm";
    }
}
