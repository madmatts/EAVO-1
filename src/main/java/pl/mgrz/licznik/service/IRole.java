package pl.mgrz.licznik.service;

import java.util.List;

import pl.mgrz.licznik.model.Role;

public interface IRole {

	List<Role> findAllRoles();

	Role findByName(String role);

	void deleteRoleById(int id);

	List<Role> findRolesForUser(int id);

}
