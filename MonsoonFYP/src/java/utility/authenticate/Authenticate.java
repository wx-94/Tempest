/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utility.authenticate;

import is203.JWTException;
import is203.JWTUtility;

/**
 *
 * @author jacky
 */
public class Authenticate {
    public static String getSecret(){
        return "1234567890123456";
    }
    
    
    //returns username

    /**
     *Verifies the token given by the current user if it is valid.
     * @param token Token given by current user
     * @return the username of the user if token is verified; null if token is not verified.
     */
    public static String verify(String token){
        try {
            return JWTUtility.verify(token, getSecret());
        } catch (JWTException ex) {
            return null;
        }
    }
    
    //returns token

    /**
     *Creates a token in String object for the authenticated user.
     * @param username  username of the current user logged in
     * @return  token for this user
     */
    public static String sign(String username){
        return JWTUtility.sign(getSecret(), username);
    }
}
