package com.utbm.lo54.project.entity;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Location {

    @Id
    private String id;
    private String city;

    public Location() {

    }

    public Location(String id, String city) {
        this.id = id;
        this.city = city;
    }

    public String getId() {
        return this.id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getCity() {
        return this.city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public Location id(String id) {
        this.id = id;
        return this;
    }

    public Location city(String city) {
        this.city = city;
        return this;
    }

    @Override
    public boolean equals(Object o) {
        if (o == this)
            return true;
        if (!(o instanceof Location)) {
            return false;
        }
        Location location = (Location) o;
        return Objects.equals(id, location.id) && Objects.equals(city, location.city);
    }

    @Override
    public int hashCode() {
        return Objects.hash(id, city);
    }

    @Override
    public String toString() {
        return "{" + " id='" + getId() + "'" + ", city='" + getCity() + "'" + "}";
    }

}