package beans;

import javax.ejb.Stateless;

@Stateless
public class SimpleSessionBean implements SimpleSessionBeanRemote {

    public String getEchoString(String clientString) {
        return clientString + " - from session bean";
    }
}
