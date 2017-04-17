package client;

import beans.SimpleSessionBeanRemote;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class SimpleSessionClient {

    public static void main(String[] args) throws Exception {
        InitialContext ctx;
        SimpleSessionBeanRemote simpleSession = null;
        try {
            ctx = new InitialContext();
            // JBoss' default remote jndi: <ejb-name>/remote
            final String jndiName = "SimpleSessionBean/remote";
            simpleSession = (SimpleSessionBeanRemote) ctx.lookup(jndiName);
        } catch (NamingException ex) {
            Logger.getLogger(SimpleSessionClient.class.getName())
                    .log(Level.SEVERE, null, ex);
            System.exit(1);
        }

        if (args.length == 0) {
            args = "this is my default input".split(" ");
        }
        for (String arg : args) {
            String returnedString = simpleSession.getEchoString(arg);
            System.out.printf(
                    "sent string: %s, received string: %s\n",
                    arg, returnedString
            );
        }
    }
}
