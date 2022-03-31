package spr.boot.order.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.stereotype.Component;

import com.fasterxml.jackson.annotation.JsonFormat;

@Entity @Table(name = "orderinformation")
@Component
public class PurchaseOrder {
	
	@Id @Column(name = "ORDERID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int oid;
	
	@Column(name = "PRODUCTNAME")
	private String orderName;
	
	@Column(name = "NUMBER")
	private int number;
	
	@Column(name = "PRODUCTUNITPRICE")
	private int productUnitPrice;
	
	@Column(name = "PRODUCTPRICE")
	private int productPrice;
	
	@Column(name = "REMARK")
	private String remark;

	

}
