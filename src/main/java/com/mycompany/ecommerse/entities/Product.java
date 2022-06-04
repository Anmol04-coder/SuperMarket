/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ecommerse.entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.*;

/**
 *
 * @author HP
 */
@Entity
public class Product {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int Pid;
    private String pName;
    @Column(length = 3000)
    private String PDesc;
    private String pPhoto;
    private int pPrice;
    private int pDiscount;
    private int pQuantity;
//    @Lob
//    @Column(name="BOOK_IMAGE", nullable=false, columnDefinition="mediumblob")
//    private byte[] image;
    
    @ManyToOne
    private Category category;
    public Product() {
    }

    public Product(int Pid, String pName, String PDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity) {
        this.Pid = Pid;
        this.pName = pName;
        this.PDesc = PDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
    }

    public Product(String pName, String PDesc, String pPhoto, int pPrice, int pDiscount, int pQuantity,Category category) {
        this.pName = pName;
        this.PDesc = PDesc;
        this.pPhoto = pPhoto;
        this.pPrice = pPrice;
        this.pDiscount = pDiscount;
        this.pQuantity = pQuantity;
        this.category = category;
    }
    
    

    public int getPid() {
        return Pid;
    }

    public void setPid(int Pid) {
        this.Pid = Pid;
    }

    public String getpName() {
        return pName;
    }

    public void setpName(String pName) {
        this.pName = pName;
    }

    public String getPDesc() {
        return PDesc;
    }

    public void setPDesc(String PDesc) {
        this.PDesc = PDesc;
    }

    public String getpPhoto() {
        return pPhoto;
    }

    public void setpPhoto(String pPhoto) {
        this.pPhoto = pPhoto;
    }

    public int getpPrice() {
        return pPrice;
    }

    public void setpPrice(int pPrice) {
        this.pPrice = pPrice;
    }

    public int getpDiscount() {
        return pDiscount;
    }

    public void setpDiscount(int pDiscount) {
        this.pDiscount = pDiscount;
    }

    public int getpQuantity() {
        return pQuantity;
    }

    public void setpQuantity(int pQuantity) {
        this.pQuantity = pQuantity;
    }

    public Category getCategory() {
        return category;
    }

    public void setCategory(Category category) {
        this.category = category;
    }
    
    

    @Override
    public String toString() {
        return "Product{" + "Pid=" + Pid + ", pName=" + pName + ", PDesc=" + PDesc + ", pPhoto=" + pPhoto + ", pPrice=" + pPrice + ", pDiscount=" + pDiscount + ", pQuantity=" + pQuantity + '}';
    }
    
    public int getPriceAfterApplyingDiscount() {
        int d = (int) ((this.getpDiscount() / 100.0) * this.getpPrice());
        return this.getpPrice() - d;
    }
    
}
