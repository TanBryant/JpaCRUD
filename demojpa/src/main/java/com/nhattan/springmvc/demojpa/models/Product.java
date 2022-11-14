package com.nhattan.springmvc.demojpa.models;

import java.sql.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;


@Entity
public class Product {

		@Id
		@GeneratedValue(strategy=GenerationType.IDENTITY)
		private Integer id;
		
		@NotNull(message = "Name not be null")
		private String name;
		
		
		private String description;
		
		@NotNull(message = "Price not be null")
		@Min(value = 0, message = "Price must be a number greater than 0")
		private Float price;
		
		private Date createDate;
		
		@ManyToOne(cascade = CascadeType.MERGE)
		@JoinColumn(name = "c_id", nullable = false)
		private Category category;
		
		@ManyToMany(cascade = CascadeType.MERGE, fetch = FetchType.EAGER)
		@JoinTable(name = "product_tag", joinColumns = @JoinColumn(name = "id"),
					inverseJoinColumns = @JoinColumn(name = "tagId"))
		private List<Tag> tags;
		
		public Product() {
			
		}

		public Product(String name, String description, Float price,Date createDate) {
			super();
			this.name = name;
			this.description = description;
			this.price = price;
			this.createDate = createDate;
			
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getName() {
			return name;
		}

		public void setName(String name) {
			this.name = name;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Float getPrice() {
			return price;
		}

		public void setPrice(Float price) {
			this.price = price;
		}

		
		public Category getCategory() {
			return category;
		}

		public void setCategory(Category category) {
			this.category = category;
		}

		public List<Tag> getTags() {
			return tags;
		}

		public void setTags(List<Tag> tags) {
			this.tags = tags;
		}

		public Date getCreateDate() {
			return createDate;
		}

		public void setCreateDate(Date date) {
			this.createDate = date;
		}	
		
}
