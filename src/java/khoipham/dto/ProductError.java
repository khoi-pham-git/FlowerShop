/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package khoipham.dto;


public class ProductError {

    private String idError;
    private String nameError;
    private String priceError;
    private String quantityError;
    private String imgError;

    public ProductError() {
    }

    public ProductError(String idError, String nameError, String priceError, String quantityError, String imgError) {
        this.idError = idError;
        this.nameError = nameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.imgError = imgError;
    }

    public ProductError( String nameError, String priceError, String quantityError, String imgError) {
        this.nameError = nameError;
        this.priceError = priceError;
        this.quantityError = quantityError;
        this.imgError = imgError;
    }

    public String getIdError() {
        return idError;
    }

    public void setIdError(String idError) {
        this.idError = idError;
    }

    public String getNameError() {
        return nameError;
    }

    public void setNameError(String nameError) {
        this.nameError = nameError;
    }

    public String getPriceError() {
        return priceError;
    }

    public void setPriceError(String priceError) {
        this.priceError = priceError;
    }

    public String getQuantityError() {
        return quantityError;
    }

    public void setQuantityError(String quantityError) {
        this.quantityError = quantityError;
    }

    public String getImgError() {
        return imgError;
    }

    public void setImgError(String imgError) {
        this.imgError = imgError;
    }

    
}
