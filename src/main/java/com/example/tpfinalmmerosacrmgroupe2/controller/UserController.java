package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateUser;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import javax.validation.Valid;

@Controller
public class UserController {
    private UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/signup")
    public String displaySignUpForm(Model model) {
        model.addAttribute("createUser",new CreateUser());
        return "signUpFormView";
    }

    @GetMapping("/signup/{mail}")
    public String updateEntrepriseForm(Model model, @PathVariable(value="mail") String mail){
        CreateUser createUser = userService.getUserByMail(mail).toCreateUser();
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
