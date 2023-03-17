package Entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import lombok.Data;

/**
 *
 * @author Ngoc Huyen
 */
@Data
@Entity(name = "customers")
@Table(name = "customers")
public class Customers {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer CustomerID;
    @Column
    private String Username;
    @Column
    private String Fullname;
    @Column(name = "Password")
    private String Password;
    @Column
    private String Address;
    @Column
    private String City;
}
