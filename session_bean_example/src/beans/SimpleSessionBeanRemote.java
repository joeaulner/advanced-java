package beans;

import javax.ejb.Remote;

@Remote
public interface SimpleSessionBeanRemote {
    String getEchoString(String clientString);
}
