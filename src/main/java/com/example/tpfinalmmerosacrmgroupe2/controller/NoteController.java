package com.example.tpfinalmmerosacrmgroupe2.controller;

import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateNote;
import com.example.tpfinalmmerosacrmgroupe2.entity.Note;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.service.NoteService;
import com.example.tpfinalmmerosacrmgroupe2.service.ProspectService;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import java.security.Principal;

@Controller
@RequestMapping("/notes")
public class NoteController {
    private NoteService noteService;
    private ProspectService prospectService;

    public NoteController(NoteService noteService, ProspectService prospectService) {
        this.noteService = noteService;
        this.prospectService = prospectService;
    }

    @PostMapping("/Create/{id}")
    public String createNote(@PathVariable(value="id") long id, HttpServletRequest request, Principal principal){
        String text = request.getParameter("text");
        CreateNote createNote = new CreateNote();
        createNote.setTexte(text);
        createNote.setProspectById(prospectService.getProspectById(principal.getName(), id));
        Note note = noteService.createUpdateNote(createNote);
        if (note.getProspectById().isClient()){
            return "redirect:/clients/details/" + note.getProspectById().getId();
        }else {
            return "redirect:/prospects/details/" + note.getProspectById().getId();
        }
    }

    @PostMapping("/Create2/{id}")
    public String createNote2(@PathVariable(value="id") long id, HttpServletRequest request, Principal principal){
        String text = request.getParameter("text");
        CreateNote createNote = new CreateNote();
        createNote.setTexte(text);
        createNote.setProspectById(prospectService.getProspectById(principal.getName(), id));
        Note note = noteService.createUpdateNote(createNote);
        prospectService.ARelancer(prospectService.getProspectById(principal.getName(), id));
        if (note.getProspectById().isClient()){
            return "redirect:/clients/details/" + note.getProspectById().getId();
        }else {
            return "redirect:/prospects/details/" + note.getProspectById().getId();
        }
    }

    @PostMapping("/Update/{id}")
    public String updateNote(@PathVariable(value="id") long id, HttpServletRequest request){
        String text = request.getParameter("text");
        CreateNote createNote = new CreateNote();
        createNote.setId(id);
        createNote.setTexte(text);
        Note note = noteService.createUpdateNote(createNote);
        if (note.getProspectById().isClient()){
            return "redirect:/clients/details/" + note.getProspectById().getId();
        }else {
            return "redirect:/prospects/details/" + note.getProspectById().getId();
        }
    }

    @PostMapping ("/delete/{id}")
    public String deleteNote(@PathVariable(value="id") long id){
        Prospect prospect = noteService.getNoteById(id).getProspectById();
        noteService.deleteNoteById(id);
        if (prospect.isClient()){
            return "redirect:/clients/details/" + prospect.getId();
        }else {
            return "redirect:/prospects/details/" + prospect.getId();
        }
    }

}
