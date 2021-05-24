/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.fatec;

import java.util.ArrayList;

/**
 *
 * @author Fernanda
 */
public class Database {
    private static ArrayList<User> users;
    private static ArrayList<Contato> contatos;
    
    public static ArrayList<Contato> getContatos() {
        if(contatos == null) {
            contatos.add(
                    new Contato (
                    "Julia", 
                    "julia@gmail.com",
                    "3244233")
                    );
            contatos.add(
                    new Contato(
                            "João",
                            "joao@gmail.com", 
                            "123213")                
            );
        }
        return contatos;
    }
    public static ArrayList<User> getUsers(){
        if(users==null){
            users = new ArrayList<>();
            users.add(
                    new User(
                            "Administrador", 
                            "admin@domain.com", 
                            "1234".hashCode())
            );
            users.add(
                    new User(
                            "Fulano da Silva", 
                            "fulano@domain.com", 
                            "123".hashCode())
            );
        }
        return users;
    }
    
    public static User getUser(String email, String password){
        int hashCode = password.hashCode();
        for(User user: getUsers()){
            if(user.getEmail().equals(email) 
                    && user.getPasswordHash() == hashCode){
                return user;
            }
        }
        return null;
    }
    
    public static void addUser(User newUser){
        getUsers().add(newUser);
    }
    public static void removeUser(String email){
        for(int i=0 ; i< users.size(); i++){
            if(users.get(i).getEmail().equals(email)){
                getUsers().remove(i);
            }
        }
    }
    
    public static void addContato(Contato newContato){
        getContatos().add(newContato);
    }
    
    public static void removeContato(String email){
        for (int i=0; i< contatos.size(); i++){
            if(contatos.get(i).getEmail().equals(email)){
                getContatos().remove(i);
            }
        }
    }
    
}
