package com.example.tpfinalmmerosacrmgroupe2.entity.repository;

import com.example.tpfinalmmerosacrmgroupe2.entity.Entreprise;
import com.example.tpfinalmmerosacrmgroupe2.entity.User;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface UserRepository extends CrudRepository<User, Long> {
    @Query("SELECT u FROM User u WHERE u.email = :email")
    User findByEmail(@Param("email") String email);

    @Query("SELECT u FROM User u WHERE NOT(u.id = :id) AND (u.nom LIKE CONCAT('%',:name,'%') OR u.prenom like CONCAT('%',:name,'%') OR u.email like CONCAT('%',:name,'%'))")
    List<User> findUsersByAll(@Param("id") Long id, @Param("name") String name);
    @Query("SELECT u FROM User u WHERE NOT(u.id = :id)")
    List<User> findUsers(@Param("id") Long id);
}
