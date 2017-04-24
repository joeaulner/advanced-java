package edu.unomaha.project;

import javax.faces.application.FacesMessage;
import javax.faces.context.FacesContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class User {

    private boolean authenticated = false;
    private String email;
    private String password;
    private String oldPassword;
    private String newPassword;
    private String confirmPassword;
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

    public String getOldPassword() {
        return oldPassword;
    }

    public void setOldPassword(String oldPassword) {
        this.oldPassword = oldPassword;
    }

    public String getNewPassword() {
        return newPassword;
    }

    public void setNewPassword(String newPassword) {
        this.newPassword = newPassword;
    }

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
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
        authenticated = false;
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
                authenticated = false;
                addMessage("Invalid email/password combination");
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

    public String register() throws Exception {
        if (!newPassword.equals(confirmPassword)) {
            addMessage("Passwords must match");
            return "passwordMismatch";
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rset = null;
        try {
            conn = JdbcManager.getConnection();

            String sql = "SELECT email FROM users WHERE email=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);

            rset = stmt.executeQuery();
            if (rset.next()) {
                addMessage("Email address is already registered");
                return "emailTaken";
            }
        } catch (Exception ex) {
            reset();
            throw ex;
        } finally {
            JdbcManager.close(rset);
            JdbcManager.close(stmt);
            JdbcManager.close(conn);
        }
        return "toRegisterDetails";
    }

    public String registerDetails() throws Exception {
        if (!newPassword.equals(confirmPassword)) {
            addMessage("Passwords must match");
            return "passwordMismatch";
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcManager.getConnection();

            String sql = "INSERT INTO users" +
                    "(email, password, first_name, last_name, gender, age)" +
                    "VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, newPassword);
            stmt.setString(3, firstName);
            stmt.setString(4, lastName);
            stmt.setString(5, gender);
            stmt.setInt(6, age);

            int result = stmt.executeUpdate();
            if (result != 1) {
                throw new Exception("Unable to register email, unknown error");
            }
            authenticated = true;
        } catch (Exception ex) {
            reset();
            throw ex;
        } finally {
            JdbcManager.close(stmt);
            JdbcManager.close(conn);
        }
        return "registerSuccess";
    }

    public String logout() {
        reset();
        return "logoutSuccess";
    }

    public String changePassword() throws Exception {
        Connection conn = null;
        PreparedStatement stmt = null;
        try {
            conn = JdbcManager.getConnection();

            if (!oldPassword.equals(password)) {
                addMessage("Old password incorrect");
                return "badPassword";
            }
            if (!newPassword.equals(confirmPassword)) {
                addMessage("Passwords must match");
                return "passwordMismatch";
            }

            String sql = "UPDATE users SET password=? WHERE EMAIL=?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, newPassword);
            stmt.setString(2, email);

            int result = stmt.executeUpdate();
            if (result != 1) {
                throw new Exception("Unable to change password, unknown error");
            }
        } finally {
            JdbcManager.close(stmt);
            JdbcManager.close(conn);
        }
        return "changePasswordSuccess";
    }

    private void addMessage(String message) {
        FacesMessage facesMessage = new FacesMessage(FacesMessage.SEVERITY_ERROR, message, null);
        FacesContext.getCurrentInstance().addMessage(null, facesMessage);
    }
}
