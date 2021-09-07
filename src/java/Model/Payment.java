/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Model;

import java.io.Serializable;

/**
 *
 * @author msi gaming
 */
public class Payment implements Serializable {
   
  private double totalPrice;
  private double CustomerMoney;
  private double Balance;

    public Payment() {
        this.totalPrice = 0;
        this.CustomerMoney = 0;
        this.Balance = 0;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public double getCustomerMoney() {
        return CustomerMoney;
    }

    public void setCustomerMoney(double CustomerMoney) {
        this.CustomerMoney = CustomerMoney;
    }

    public double getBalance() {
        return Balance;
    }

    public void setBalance(double Balance) {
        this.Balance = Balance;
    }
    
    public void calculateBalance(){
        this.Balance = CustomerMoney - totalPrice;
    }
  
};
