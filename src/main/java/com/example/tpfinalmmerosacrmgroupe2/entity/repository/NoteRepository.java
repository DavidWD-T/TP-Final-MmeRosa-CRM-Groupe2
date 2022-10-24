package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Note;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface NoteRepository extends CrudRepository<Note, Long> {

    @Query(value = "SELECT p FROM Note p WHERE p.prospectById = :prospect ORDER BY p.date desc, p.heure desc")
    List<Note> findAllNotesByProspectById(Prospect prospect);

    @Query(value = "SELECT p FROM Note p WHERE p.prospectById = :prospect AND p.prospectEntrepriseNom = :filtre ORDER BY p.date desc, p.heure desc")
    List<Note> findAllNotesByProspectByIdClient(Prospect prospect, String filtre);

    @Query(value = "SELECT p FROM Note p WHERE p.prospectById = :prospect AND  p.prospectEntrepriseNom <> :filtre ORDER BY p.date desc, p.heure desc")
    List<Note> findAllNotesByProspectByIdNonClient(Prospect prospect, String filtre);
}
