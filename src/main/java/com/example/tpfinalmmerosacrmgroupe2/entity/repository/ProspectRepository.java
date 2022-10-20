package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Prospect;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface ProspectRepository extends CrudRepository<Prospect, Long> {

    //liste des prospects
    @Query(value = "SELECT p FROM Prospect p WHERE p.userById = :id and p.isClient=false")
    List<Prospect> findAllProspectsByUserById_Id(long id);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.isClient=false  AND (p.nom LIKE CONCAT('%',:name,'%') OR p.prenom like CONCAT('%',:name,'%') OR p.email like CONCAT('%',:name,'%') OR p.fixe like CONCAT('%',:name,'%') OR p.fonction like CONCAT('%',:name,'%') OR p.portable like CONCAT('%',:name,'%') OR p.entrepriseById.nom like CONCAT('%',:name,'%'))")
    List<Prospect> findProspectsByName(@Param("user") User user, @Param("name") String name);


    //liste des clients
    @Query(value = "SELECT p FROM Prospect p WHERE p.userById = :id and p.isClient=true ")
    List<Prospect> findAllClientsByUserById_Id(long id);

    @Query("SELECT p FROM Prospect p WHERE p.userById = :user AND p.isClient=true AND (p.nom LIKE CONCAT('%',:name,'%') OR p.prenom like CONCAT('%',:name,'%') OR p.email like CONCAT('%',:name,'%') OR p.fixe like CONCAT('%',:name,'%') OR p.fonction like CONCAT('%',:name,'%') OR p.portable like CONCAT('%',:name,'%') OR p.entrepriseById.nom like CONCAT('%',:name,'%'))")
    List<Prospect> findClientsByName(@Param("user") User user, @Param("name") String name);
}
