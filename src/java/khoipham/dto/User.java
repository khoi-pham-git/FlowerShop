/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.dto;


public class User {

    private final String userId;
    private String password, roleId, name;

    enum Type {
        User, Admin
    }

    public User(String userId, String password, String roleId, String name) {
        this.userId = userId;
        this.password = password;
        this.roleId = roleId;
        this.name = name;
    }

    public User(String userId, String name) {
        this.userId = userId;
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public String getId() {
        return userId;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

}
