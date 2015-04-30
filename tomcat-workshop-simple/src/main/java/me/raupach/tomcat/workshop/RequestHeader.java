package me.raupach.tomcat.workshop;

import java.io.Serializable;

public final class RequestHeader implements Serializable {
    
    private final String key;
    private final String value;

    public RequestHeader(String key, String value) {
        this.key = key;
        this.value = value;
    }

    public String getKey() {
        return key;
    }

    public String getValue() {
        return value;
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 47 * hash + (this.key != null ? this.key.hashCode() : 0);
        hash = 47 * hash + (this.value != null ? this.value.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final RequestHeader other = (RequestHeader) obj;
        if ((this.key == null) ? (other.key != null) : !this.key.equals(other.key)) {
            return false;
        }
        return !((this.value == null) ? (other.value != null) : !this.value.equals(other.value));
    }
           
    
}
