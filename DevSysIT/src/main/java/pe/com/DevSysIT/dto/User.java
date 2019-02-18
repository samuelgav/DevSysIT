package pe.com.DevSysIT.dto;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.persistence.Transient;


import org.hibernate.validator.constraints.NotBlank;

@Entity
@Table(name="user_detail")
public class User implements Serializable{

	private static final long serialVersionUID = 1L;
	
	@Id
	/*@GeneratedValue(strategy=GenerationType.SEQUENCE,generator="seq_usuario")
	@SequenceGenerator(name="seq_usuario",sequenceName="seq_id_usuario",allocationSize=1)*/
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="id",nullable=false)
	private int id;
	@NotBlank(message="Por favor ingrese su nombre!!")
	@Column(name="first_name")
	private String firstName;
	@NotBlank(message="Por favor ingrese sus apellidos!!")
	@Column(name="last_name")
	private String lastName;
	@Column(name="role")
	private String role;
	@Column(name="enabled")
	private boolean enabled=true;
	@NotBlank(message="Por favor ingrese su password!!")
	@Column(name="password")
	private String password;
	@NotBlank(message="Por favor ingrese su direccion de correo!!")
	@Column(name="email")
	private String email;
	@NotBlank(message="Por favor ingrese su numero de contacto!!")
	@Column(name="contact_number")
	private String contactNumber;
	
	@Transient
	private String confirmPassword;
	
	public String getConfirmPassword() {
		return confirmPassword;
	}
	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getFirstName() {
		return firstName;
	}
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getLastName() {
		return lastName;
	}
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public boolean isEnabled() {
		return enabled;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	
	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", email=" + email
				+ ", contactNumber=" + contactNumber + ", role=" + role + ", password=" + password + ", enabled="
				+ enabled + "]";
	}
	
	
	@OneToOne(mappedBy="user",cascade = CascadeType.ALL, fetch = FetchType.EAGER)	
	private Cart cart;
	public Cart getCart() {
		return cart;
	}
	public void setCart(Cart cart) {
		this.cart = cart;
	}
	
}
