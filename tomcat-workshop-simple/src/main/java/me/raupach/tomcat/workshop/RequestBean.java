package me.raupach.tomcat.workshop;

import java.util.ArrayList;
import java.util.List;
import java.util.Map.Entry;
import javax.annotation.PostConstruct;
import javax.enterprise.context.RequestScoped;
import javax.inject.Named;
import org.omnifaces.util.Faces;

@Named
@RequestScoped
public class RequestBean {
    
    private List<RequestHeader> headers;
    private List<SessionEntry> sessionEntries;
    
    private String key;
    private String value;
    
    @PostConstruct
    public void initialize() {
        headers = new ArrayList<RequestHeader>();
        for (Entry<String,String> e : Faces.getRequestHeaderMap().entrySet()) {
            RequestHeader header = new RequestHeader(e.getKey(), e.getValue());
            headers.add(header);
        }
        
        sessionEntries = new ArrayList<SessionEntry>();
        for (Entry<String, Object> e : Faces.getSessionMap().entrySet()) {
            SessionEntry se = new SessionEntry(e.getKey(), e.getValue());
            sessionEntries.add(se);
        }
    }
    
    public String save() {
        Faces.setSessionAttribute(key, value);
        return Faces.getViewId() + "?faces-redirect=true";
    } 
    
    public List<RequestHeader> getRequestHeader() {
        return headers;
    }
    
    public List<SessionEntry> getSessionEntry() {
        return sessionEntries;
    }

    public String getKey() {
        return key;
    }

    public void setKey(String key) {
        this.key = key;
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value;
    }
    
}
