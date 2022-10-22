package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Evenement;
import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EvenementRepository extends CrudRepository<Evenement, Long> {


    @Query(value = "SELECT e FROM Evenement e WHERE e.userById = :user")
    List<Evenement> findAllEvenements(User user);

    @Query(value = "SELECT e FROM Evenement e WHERE e.userById = :user AND e.prospectById = :prospect")
    List<Evenement> findAllEvenementsByProspect(User user, Prospect prospect);

    @Query("SELECT e FROM Evenement e WHERE e.userById = :user AND (e.motif LIKE CONCAT('%',:name,'%') OR e.description like CONCAT('%',:name,'%') OR e.adresse like CONCAT('%',:name,'%') OR e.ville like CONCAT('%',:name,'%') OR e.codePostale like CONCAT('%',:name,'%'))")
    List<Evenement> findEvenementsByName(@Param("user") User user, @Param("name") String name);

    @Query(value = "SELECT e FROM Evenement e WHERE e.userById = :user AND e.id = :id")
    Evenement findEvenementById(User user, long id);
}
