/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author Asus
 */
public class Book implements Serializable{
    private String Title;
    private String Author;
    private String Publisher;
    private double price;
    private String cover;
    private String file;

    public Book(String Title, String Author, String Publisher, double price, String cover, String file) {
        this.Title = Title;
        this.Author = Author;
        this.Publisher = Publisher;
        this.price = price;
        this.cover = cover;
        this.file = file;
    }

    public String getCover() {
        return cover;
    }

    public String getFile() {
        return file;
    }

    public void setCover(String cover) {
        this.cover = cover;
    }

    public void setFile(String file) {
        this.file = file;
    }


    public Book() {
    }

    public String getTitle() {
        return Title;
    }

    public void setTitle(String Title) {
        this.Title = Title;
    }

    public String getAuthor() {
        return Author;
    }

    public void setAuthor(String Author) {
        this.Author = Author;
    }

    public String getPublisher() {
        return Publisher;
    }

    public void setPublisher(String Publisher) {
        this.Publisher = Publisher;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

}
