package com.example.tpfinalmmerosacrmgroupe2.service;

import com.example.tpfinalmmerosacrmgroupe2.api.EventDTO;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateEvenement;
import com.example.tpfinalmmerosacrmgroupe2.controller.dto.CreateNote;
import com.example.tpfinalmmerosacrmgroupe2.entity.Evenement;
import com.example.tpfinalmmerosacrmgroupe2.entity.Note;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.EvenementRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.NoteRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.ProspectRepository;
import com.example.tpfinalmmerosacrmgroupe2.entity.repository.UserRepository;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.List;

@Service
public class NoteService {

    private NoteRepository noteRepository;
    private ProspectRepository prospectRepository;

    public NoteService(NoteRepository noteRepository,ProspectRepository prospectRepository) {
        this.noteRepository = noteRepository;
        this.prospectRepository = prospectRepository;
    }

    public List<Note> getAllNotes(Long id) {
        Prospect prospect = prospectRepository.findById(id).get();
        return noteRepository.findAllNotesByProspectById(prospect);
    }
    public List<Note> getAllNotesClient(Long id) {
        Prospect prospect = prospectRepository.findById(id).get();
        String filtre = "Client " + prospect.getEntrepriseById().getNom();
        return noteRepository.findAllNotesByProspectByIdClient(prospect,filtre);
    }
    public List<Note> getAllNotesNonClient(Long id) {
        Prospect prospect = prospectRepository.findById(id).get();
        String filtre = "Client " + prospect.getEntrepriseById().getNom();
        return noteRepository.findAllNotesByProspectByIdNonClient(prospect,filtre);
    }

    public Note getNoteById(long id){
        return noteRepository.findById(id).get();
    }
    public Note createUpdateNote(CreateNote createNote) {
        Note note;
        if (createNote.getId() == null){
            note = new Note();
            Prospect prospect = createNote.getProspectById();
            if (prospect.isClient()){
                note.setProspectEntrepriseNom("Client " + prospect.getEntrepriseById().getNom());
            }else {
                note.setProspectEntrepriseNom("Prospect " + prospect.getEntrepriseById().getNom());
            }
            note.setDate(LocalDate.now());
            note.setHeure(LocalTime.now());

            LocalDate dateRecent = note.getDate().plusDays(prospect.getDureeRelance());
            if (dateRecent.isAfter(prospect.getDateDernierContact())){
                if (prospect.isClient()){
                    prospect.setEtatProspection("Note du " + dateRecent);
                }else {
                prospect.setEtatProspection("En cours de prospection");
                }
                prospect.setDateDernierContact(dateRecent);
            }
        }else {
            note = getNoteById(createNote.getId());
        }

        note.setTexte(createNote.getTexte());
        note.setProspectById(createNote.getProspectById());

        return noteRepository.save(note);
    }

    public void deleteNoteById(long id) {
        Note note = getNoteById(id);
        noteRepository.delete(note);
    }

}
