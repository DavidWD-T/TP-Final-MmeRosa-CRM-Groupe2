package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface EntrepriseRepository extends CrudRepository<Entreprise, Long> {

    @Query("SELECT u FROM Entreprise u WHERE u.userById = :user AND (u.nom LIKE CONCAT('%',:name,'%') OR u.nom like CONCAT('%',:name,'%') OR u.secteurActivite like CONCAT('%',:name,'%') OR u.siret like CONCAT('%',:name,'%') OR u.adresse like CONCAT('%',:name,'%') OR u.ville like CONCAT('%',:name,'%') OR u.codePostale like CONCAT('%',:name,'%') OR u.siteWeb like CONCAT('%',:name,'%') OR u.telephone like CONCAT('%',:name,'%'))")
    List<Entreprise> findEntrepriseByAll(@Param("user") User user, @Param("name") String name);
    List<Entreprise> findEntrepriseByUserById(User user);

}
