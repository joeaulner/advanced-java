package edu.unomaha.project;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import javax.faces.context.FacesContextFactory;
import javax.faces.webapp.FacesServlet;
import javax.xml.ws.http.HTTPException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User {

    private boolean authenticated = false;
    private String email;
    private String password;
    private String firstName;
    private String lastName;
    private String gender;
    private int age;

    public boolean getAuthenticated() {
        return authenticated;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }

    private void reset() {
        email = null;
        password = null;
        firstName = null;
        lastName = null;
        gender = null;
        age = 0;
    }

    public String login() throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rset = null;
        try {
            conn = JdbcManager.getConnection();

            String sql = "SELECT * FROM users WHERE email=? AND password=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);

            rset = stmt.executeQuery();
            if (rset.next()) {
                authenticated = true;
                firstName = rset.getString("first_name");
                lastName = rset.getString("last_name");
                gender = rset.getString("gender");
                age = rset.getInt("age");
            } else {
                reset();
                FacesMessage message = new FacesMessage(
                        FacesMessage.SEVERITY_ERROR,
                        "Invalid Email/Password Combination",
                        null
                );
                FacesContext.getCurrentInstance().addMessage(null, message);
                return "loginFailure";
            }
        } catch (Exception ex) {
            reset();
            throw ex;
        } finally {
            JdbcManager.close(rset);
            JdbcManager.close(stmt);
            JdbcManager.close(conn);
        }
        return "loginSuccess";
    }

    public String register() {
        return "registerSuccess";
    }
}
