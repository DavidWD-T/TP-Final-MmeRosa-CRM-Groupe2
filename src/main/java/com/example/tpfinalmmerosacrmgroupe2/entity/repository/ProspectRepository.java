package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.time.LocalDate;
import java.util.List;

public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    //liste des prospects
    @Query(value = "SELECT p FROM Prospect p WHERE p.userById = :user and p.isClient=false")
    List<Prospect> findAllProspectsByUserById(User user);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.isClient=false  AND p.etatProspection LIKE CONCAT('%',:etat,'%') AND (p.nom LIKE CONCAT('%',:name,'%') OR p.prenom like CONCAT('%',:name,'%') OR p.email like CONCAT('%',:name,'%') OR p.fixe like CONCAT('%',:name,'%') OR p.fonction like CONCAT('%',:name,'%') OR p.portable like CONCAT('%',:name,'%') OR p.entrepriseById.nom like CONCAT('%',:name,'%'))")
    List<Prospect> findProspectsByName(@Param("user") User user, @Param("name") String name, @Param("etat") String etat, Sort sort);


    //liste des clients
    @Query(value = "SELECT p FROM Prospect p WHERE p.userById = :user and p.isClient=true ")
    List<Prospect> findAllClientsByUserById(User user);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.isClient=true AND p.etatProspection LIKE CONCAT('%',:etat,'%') AND (p.nom LIKE CONCAT('%',:name,'%') OR p.prenom like CONCAT('%',:name,'%') OR p.email like CONCAT('%',:name,'%') OR p.fixe like CONCAT('%',:name,'%') OR p.fonction like CONCAT('%',:name,'%') OR p.portable like CONCAT('%',:name,'%') OR p.entrepriseById.nom like CONCAT('%',:name,'%'))")
    List<Prospect> findClientsByName(@Param("user") User user, @Param("name") String name, @Param("etat") String etat, Sort sort);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.dateDernierContact < :dateJ AND p.etatProspection = 'En cours de prospection'")
    List<Prospect> findProspectsByDate(@Param("user") User user,@Param("dateJ") LocalDate dateJ);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.dateDernierContact < :dateJ AND (p.etatProspection like CONCAT('%','Note du','%') or p.etatProspection like CONCAT('%','Evenement du','%'))")
    List<Prospect> findClientsByDate(@Param("user") User user,@Param("dateJ") LocalDate dateJ);

}
